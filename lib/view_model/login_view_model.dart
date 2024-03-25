import "../repository/login_repo.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import '../repository/abstract/login_repository.dart';
import "./abstract/login_view_model_abstract.dart";


// View Model which interacts with Login Form

final loginVMProvider = Provider<LoginDetailsModelImpl>((ref) {   // Creating provider inside View Model for accessing data in View
  return LoginDetailsModelImpl(loginRep: ref.read(LoginRepositoryProvider));
});



class LoginDetailsModelImpl extends LoginDetailsModel {
  final LoginRepository loginRep;

  LoginDetailsModelImpl({required this.loginRep});

  @override
  String printUser() {  // Get first User's username and password
    return "${loginRep.getUsernames().toString()} & ${loginRep.getPasswords().toString()}";
  }

  @override
  Future getOneFromApi() async {  // Call the User fetch Repository Method
    return loginRep.getUserFromApi();
  }

  @override
  Future validateUser(String _username, String _password) async{  // Check whether they're already a member or not. Save it in shared_preferences according to the status
    
    List<String> fetchedUsernames = loginRep.getUsernames();
    List<String> fetchedPasswords = loginRep.getPasswords();

    List<dynamic> usersFromApi = await loginRep.getUserFromApi();

    fetchedUsernames.add(usersFromApi[0]);  // Adding users details from API request inside valid Users List
    fetchedPasswords.add(usersFromApi[1]);


    if(fetchedUsernames.contains(_username) && fetchedPasswords.contains(_password)) {
      loginRep.saveLoginInfo(_username, _password, true);  // If already a member, set logged in as true
      return true;
    } else {
      loginRep.saveLoginInfo(_username, _password, false); // If it is a new member, set logged in as false
      return false;
    }
  }

  @override
  Future getUserFilledInfo(String _username, String _password) {  // Call User's Shared Preference detail fetch Method
    return loginRep.getLoginInfo();
  }

}