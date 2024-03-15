import "../model/User.dart";
import "package:shared_preferences/shared_preferences.dart";
import "package:dio/dio.dart";

// Repository -> Fetch Data from Data Source. As of now, it is hardcoded

class LoginRepository {
  final dio = Dio();


  final List<User> _userList = [    // Define a List for Storing instances of type 'User'
    User("nithish@gmail.com", "nithish"),
    User("suresh@yahoo.com", "suresh"),
    User("john@gmail.com", "john")
  ];

  String getUsername() {    // Get first user's username
    return (_userList[0].username);
  }

  String getPassword() {   // Get first user's password
    return (_userList[0].password);
  }

  void getUserFromApi() async { // Get random User detail from API through Dio
    Response res;
    res = await dio.get("https://reqres.in/api/users/2");
    print(res.data.toString());
    [res.data['data']].forEach((data) {
      _userList.add(User(data["email"], data["first_name"]));
    });

    _userList.forEach((user) => {
      print("${user.username} & ${user.password}")
    });
  }

  void saveLoginInfo(String _username, String _password, bool _logged) async {  // Saving Login Info in Shared Preferences

    final SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString("Username", _username);
    await pref.setString("Password", _password);
    await pref.setBool("Logged_In", _logged);
  }
  
  Future getLoginInfo()async {  // Fetch the stored Shared Preferences

    final SharedPreferences pref = await SharedPreferences.getInstance();
    final String? loggedUsername = pref.getString("Username");
    final String? loggedPassword = pref.getString("Password");
    final bool? isLogged = pref.getBool("Logged_In");

    return ("From Shared Preferences => Username: ${loggedUsername} Password: ${loggedPassword} Logged In?: ${isLogged}");
  }

}