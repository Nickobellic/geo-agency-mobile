import "../model/User.dart";
import "package:shared_preferences/shared_preferences.dart";
import "package:dio/dio.dart";
import 'abstract/login_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:geo_agency_mobile/helper/dio_client.dart';
import 'package:geo_agency_mobile/helper/dio_exceptions.dart';

// Repository -> Fetch Data from Data Source. As of now, it is hardcoded

final LoginRepositoryProvider = Provider<LoginRepository>((_) => LoginRepositoryImpl()); // Provider for Login Repository


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
    try {
     final dynamic response = await DioClient.instance.get("/users/2"); // Response from DioClient in Helper 
    _userList.add(User(response["data"]["email"], response["data"]["first_name"]));

   return ([response["data"]["email"], response["data"]["first_name"]]);

    }on DioException catch(e) { // Sending Error to the Snackbar for display
      var error = DioExceptionClass.fromDioError(e);
      throw error.errorMessage;
    }
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