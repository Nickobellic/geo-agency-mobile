import "dart:ffi";
import "../model/User.dart";
import "../repository/login_repo.dart";

// View Model which interacts with Login Form

class LoginDetailsModel {
  LoginRepository _loginRep;

  LoginDetailsModel(this._loginRep);

  String printUser() {
    return "${_loginRep.getUsername()} & ${_loginRep.getPassword()}";
  }

  String validateUser(String _username, String _password) {
    String fetchedUsername = _loginRep.getUsername();
    String fetchedPassword = _loginRep.getPassword();
    if(_username == fetchedUsername && _password == fetchedPassword) {
      return "True";
    } else {
      return "Unauthorized Access";
    }
  }

}