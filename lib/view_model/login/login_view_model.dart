import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geo_agency_mobile/repository/login/login_repo_remote.dart';
import 'package:geo_agency_mobile/helper/dio_payload_helper.dart';
import 'package:geo_agency_mobile/helper/dio_exceptions.dart';
import 'package:geo_agency_mobile/helper/dio_client.dart';
import '../../repository/login/login_repo_remote.dart';
import 'package:geo_agency_mobile/repository/login/login_repo_local.dart';
import "package:flutter_riverpod/flutter_riverpod.dart";
import '../../repository/login/abstract_login_repository.dart';
import 'login_view_model_abstract.dart';


// View Model which interacts with Login Form

final loginVMProvider = Provider<LoginDetailsModelImpl>((ref) {   // Creating provider inside View Model for accessing data in View
  return LoginDetailsModelImpl(loginLocalRep: ref.read(LoginRepositoryLocalProvider), loginRemoteRep: ref.read(LoginRepositoryRemoteProvider));
});



class LoginDetailsModelImpl extends LoginDetailsModel {
  final LoginRepositoryLocal loginLocalRep;
  final LoginRepositoryRemote loginRemoteRep;
  late BuildContext context;

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
  Future<Map<String, dynamic>> validateUser(String _username, String _password) async{  // Check whether they're already a member or not. Save it in shared_preferences according to the status
    try {
    dynamic deviceData = await PayloadHelper.getDeviceInfo();
    Map<String, dynamic> reqDetails = {
      "login": _username,
      "password": _password,
      "device": deviceData
    };  
    String signInPayload = await PayloadHelper.createPayload(reqDetails,_username, _password, "login");
    print(signInPayload);

    List<String> fetchedUsernames = loginLocalRep.getUsernames();
    List<String> fetchedPasswords = loginLocalRep.getPasswords();

    List<dynamic> usersFromApi = await loginRemoteRep.getUserFromApi();

    fetchedUsernames.add(usersFromApi[0]);  // Adding users details from API request inside valid Users List
    fetchedPasswords.add(usersFromApi[1]);

    print(usersFromApi[0]);

    if(fetchedUsernames.contains(_username) && fetchedPasswords.contains(_password)) {
      loginLocalRep.saveLoginInfo(_username, _password, true);  // If already a member, set logged in as true
      return {"valid": true, "message": "Authenticated Successfully"};
    } else {
      loginLocalRep.saveLoginInfo(_username, _password, false); // If it is a new member, set logged in as false
      return {"valid": false, "message": "Unauthorized User"};
    }



    } on DioException catch(e) {

      int statusCode = e.response!.statusCode!;
      print('Status Code : $statusCode');
          dynamic deviceData = await PayloadHelper.getDeviceInfo();
           Map<String, dynamic> reqDetails = {
          "code": statusCode,
            "message": e.toString(),
          "device": deviceData
    };  
    String signInPayload = await PayloadHelper.createPayload(reqDetails,_username, _password, "error");
      return {"valid":false,"message":"Network Error: $e.message"};
    } catch(e,stackTrace) {
             dynamic deviceData = await PayloadHelper.getDeviceInfo();
           Map<String, dynamic> reqDetails = {
            "message": e.toString(),
          "device": deviceData
    };
        String signInPayload = await PayloadHelper.createPayload(reqDetails,_username, _password, "error");
        return {"valid": false, "message": "Error: $e.toString()"};
    }


  }

  @override
  Future getUserFilledInfo(String _username, String _password) {  // Call User's Shared Preference detail fetch Method
    return loginLocalRep.getLoginInfo();
  }

}