import "dart:ffi";
import "../model/User.dart";
import "../repository/login_repo.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";


// View Model which interacts with Login Form

final loginVMProvider = Provider<LoginDetailsModelImpl>((ref) {   // Creating provider inside View Model for accessing data in View
  return LoginDetailsModelImpl(loginRep: ref.read(LoginRepositoryProvider));
});

abstract class LoginDetailsModel {
  String printUser();
  Future getOneFromApi();
  Future validateUser(String _user, String _pass);
  Future getUserFilledInfo(String _user, String _pass);
}


class LoginDetailsModelImpl extends LoginDetailsModel {
  final LoginRepository loginRep;

  LoginDetailsModelImpl({required this.loginRep});

  @override
  String printUser() {  // Get first User's username and password
    return "${loginRep.getUsername()} & ${loginRep.getPassword()}";
  }

  @override
  Future getOneFromApi() async {  // Call the User fetch Repository Method
    return loginRep.getUserFromApi();
  }

  @override
  Future validateUser(String _username, String _password) async{  // Check whether they're already a member or not. Save it in shared_preferences according to the status
    String fetchedUsername = loginRep.getUsername();
    String fetchedPassword = loginRep.getPassword();
    if(_username == fetchedUsername && _password == fetchedPassword) {
      loginRep.saveLoginInfo(_username, _password, true);  // If already a member, set logged in as true
      return "True";
    } else {
      loginRep.saveLoginInfo(_username, _password, false); // If it is a new member, set logged in as false
      return "Unauthorized Access";
    }
  }

  @override
  Future getUserFilledInfo(String _username, String _password) {  // Call User's Shared Preference detail fetch Method
    return loginRep.getLoginInfo();
  }

}