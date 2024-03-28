import 'package:geo_agency_mobile/repository/abstract/login_repository_remote.dart';

import '../repository/remote/login_repo_remote.dart';
import 'package:geo_agency_mobile/repository/local/login_repo_local.dart';
import "package:flutter_riverpod/flutter_riverpod.dart";
import '../repository/abstract/login_repository_local.dart';
import "./abstract/login_view_model_abstract.dart";


// View Model which interacts with Login Form

final loginVMProvider = Provider<LoginDetailsModelImpl>((ref) {   // Creating provider inside View Model for accessing data in View
  return LoginDetailsModelImpl(loginLocalRep: ref.read(LoginRepositoryLocalProvider), loginRemoteRep: ref.read(LoginRepositoryRemoteProvider));
});



class LoginDetailsModelImpl extends LoginDetailsModel {
  final LoginRepositoryLocal loginLocalRep;
  final LoginRepositoryRemote loginRemoteRep;

  LoginDetailsModelImpl({required this.loginLocalRep, required this.loginRemoteRep});

  @override
  String printUser() {  // Get first User's username and password
    return "${loginLocalRep.getUsernames().toString()} & ${loginLocalRep.getPasswords().toString()}";
  }

  @override
  Future getOneFromApi() async {  // Call the User fetch Repository Method
    return loginRemoteRep.getUserFromApi();
  }

  @override
  Future validateUser(String _username, String _password) async{  // Check whether they're already a member or not. Save it in shared_preferences according to the status
    
    List<String> fetchedUsernames = loginLocalRep.getUsernames();
    List<String> fetchedPasswords = loginLocalRep.getPasswords();

    List<dynamic> usersFromApi = await loginRemoteRep.getUserFromApi();

    fetchedUsernames.add(usersFromApi[0]);  // Adding users details from API request inside valid Users List
    fetchedPasswords.add(usersFromApi[1]);


    if(fetchedUsernames.contains(_username) && fetchedPasswords.contains(_password)) {
      loginLocalRep.saveLoginInfo(_username, _password, true);  // If already a member, set logged in as true
      return true;
    } else {
      loginLocalRep.saveLoginInfo(_username, _password, false); // If it is a new member, set logged in as false
      return false;
    }
  }

  @override
  Future getUserFilledInfo(String _username, String _password) {  // Call User's Shared Preference detail fetch Method
    return loginLocalRep.getLoginInfo();
  }

}