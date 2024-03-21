import "../model/User.dart";
import "package:shared_preferences/shared_preferences.dart";
import "package:dio/dio.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Repository -> Fetch Data from Data Source. As of now, it is hardcoded

final LoginRepositoryProvider = Provider<LoginRepository>((_) => LoginRepositoryImpl()); // Provider for Login Repository

abstract class LoginRepository {
  List<String> getUsernames();
  List<String> getPasswords();
  Future getUserFromApi();
  void saveLoginInfo(String _name, String _pass, bool logged);
  Future getLoginInfo();
}


class LoginRepositoryImpl extends LoginRepository{
  final dio = Dio();


  final List<User> _userList = [    // Define a List for Storing instances of type 'User'
    User("nithish@gmail.com", "nithish"),
    User("suresh@yahoo.com", "suresh"),
    User("john@gmail.com", "john")
  ];

  @override
  List<String> getUsernames() {    // Get first user's username
    List<String> vals = [];
    _userList.forEach((user) => {
      vals.add(user.username)
    });
    return (vals);
  }

  @override
  List<String> getPasswords() {   // Get first user's password
    List<String> passes = [];
    _userList.forEach((user) => {
      passes.add(user.password)
    });
    return (passes);
  }

  @override
  Future getUserFromApi()async { // Get random User detail from API through Dio
    Response res;
    res = await dio.get("https://reqres.in/api/users/2");
    
    [res.data['data']].forEach((data) {
      _userList.add(User(data["email"], data["first_name"]));
    });

    /*_userList.forEach((user) => 
      print("${user.username} & ${user.password}")
    );*/

   /* return (res.data.toString()); */
   print(res.data["data"]["email"]);
   return ([res.data["data"]["email"], res.data["data"]["first_name"]]);
  }

  @override
  void saveLoginInfo(String _username, String _password, bool _logged) async {  // Saving Login Info in Shared Preferences

    final SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString("Username", _username);
    await pref.setString("Password", _password);
    await pref.setBool("Logged_In", _logged);
  }
  
  @override
  Future getLoginInfo()async {  // Fetch the stored Shared Preferences

    final SharedPreferences pref = await SharedPreferences.getInstance();
    final String? loggedUsername = pref.getString("Username");
    final String? loggedPassword = pref.getString("Password");
    final bool? isLogged = pref.getBool("Logged_In");

    return ("From Shared Preferences => Username: ${loggedUsername} Password: ${loggedPassword} Logged In?: ${isLogged}");
    //return (isLogged);
  }

}