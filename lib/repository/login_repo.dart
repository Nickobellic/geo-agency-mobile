import "../model/User.dart";

// Repository -> Fetch Data from Data Source. As of now, it is hardcoded

class LoginRepository {
  final List<User> _userList = [
    User("nithish@gmail.com", "nithish"),
    User("suresh@yahoo.com", "suresh"),
    User("john@gmail.com", "john")
  ];

  String getUsername() {
    return (_userList[0].username);
  }

  String getPassword() {
    return (_userList[0].password);
  }
  
}