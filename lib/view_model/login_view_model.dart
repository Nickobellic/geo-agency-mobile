import "dart:ffi";
import "../model/User.dart";
import "../repository/login_repo.dart";

// View Model which interacts with Login Form

class LoginDetailsModel {
  LoginRepository _loginRep;

  LoginDetailsModel(this._loginRep);

  String printUser() {  // Get first User's username and password
    return "${_loginRep.getUsername()} & ${_loginRep.getPassword()}";
  }

  Future getOneFromApi() async {  // Call the User fetch Repository Method
    return _loginRep.getUserFromApi();
  }

  Future validateUser(String _username, String _password) async{  // Check whether they're already a member or not. Save it in shared_preferences according to the status
    String fetchedUsername = _loginRep.getUsername();
    String fetchedPassword = _loginRep.getPassword();
    if(_username == fetchedUsername && _password == fetchedPassword) {
      _loginRep.saveLoginInfo(_username, _password, true);  // If already a member, set logged in as true
      return "True";
    } else {
      _loginRep.saveLoginInfo(_username, _password, false); // If it is a new member, set logged in as false
      return "Unauthorized Access";
    }
  }

  Future getUserFilledInfo(String _username, String _password) {  // Call User's Shared Preference detail fetch Method
    return _loginRep.getLoginInfo();
  }

}