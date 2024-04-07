import 'package:geo_agency_mobile/data/User_data.dart' as data;
import 'package:geo_agency_mobile/repository/login/abstract_login_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:talker/talker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import "package:shared_preferences/shared_preferences.dart";

final LoginRepositoryLocalProvider = Provider<LoginRepositoryLocal>((_) => LoginRepositoryLocalImpl()); // Provider for Login Repository

class LoginRepositoryLocalImpl extends LoginRepositoryLocal {
  final talker = Talker();

    @override
  List<String> getUsernames() {    // Get first user's username
    List<String> vals = [];
    talker.info("Retrieving the Usernames");
    data.usersFromDB.forEach((user) => 
      vals.add(user.username)
    );
    talker.info("Usernames retrieved");
    return (vals);
  }

  @override
  List<String> getPasswords() {   // Get first user's password
    List<String> passes = [];
    talker.info("Retrieving the Usernames");
    data.usersFromDB.forEach((user) => 
      passes.add(user.password)
    );
    talker.info("Passwords retrieved");

    return (passes);
  }

    @override
  Future<void> saveLoginInfo(String _username, String _password, bool _logged) async {  // Saving Login Info in Shared Preferences
    talker.info("Creating a Shared Preference Instance");
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString("Username", _username);
    await pref.setString("Password", _password);
    await pref.setBool("Logged_In", _logged);
    talker.info("Shared Preference updated successfully");
  }
  
  @override
  Future getLoginInfo()async {  // Fetch the stored Shared Preferences
    talker.info("Getting the Shared Preference Instance");
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final String? loggedUsername = pref.getString("Username");
    final String? loggedPassword = pref.getString("Password");
    final bool? isLogged = pref.getBool("Logged_In");
    talker.info("Details of Login obtained from Shared Preferences");
    return ("From Shared Preferences => Username: ${loggedUsername} Password: ${loggedPassword} Logged In?: ${isLogged}");
    //return (isLogged);
  }

  

}