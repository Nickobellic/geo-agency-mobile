import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:geolocator/geolocator.dart';

class PayloadHelper {
  
  static Future<Map<String, dynamic>> getDeviceInfo() async{
    final deviceInfoPlugin = DeviceInfoPlugin();
    if(kIsWeb) {
      WebBrowserInfo browserInfo = await deviceInfoPlugin.webBrowserInfo;
      dynamic browserName = browserInfo.browserName.name;
      dynamic platform = browserInfo.platform;
      return {"type": "browser","browser": browserName, "platform": platform, "user-agent": browserInfo.userAgent};
    } else {
      AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
      return {"type": "android","model": androidInfo.model, "physical": androidInfo.isPhysicalDevice, "brand": androidInfo.brand };
    }

  }

  static Future<List> getLocationLatLong() async {
    try {
      Position locator = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
      return [locator.latitude, locator.longitude];
    } catch(error) {
      return [null, null];
    }
  }

  static Future createSignInPayload(Map<String, dynamic> requestObject,String login, String password, String taskName) async {
    Map<String, dynamic> payload = {
      "eventCode": "rqstevnt_agcy_agnt_$taskName",
      "systemCode": "agncy",
      "session": {
        "ruleConfirmation": false,
        "gpsLoc": await getLocationLatLong(),
        "device": requestObject["device"],
        // "device": {"type": "browser", "token": "postman"},
        "task": taskName,
        "domain": "app.geo-daily.com"
      },
      "role": {
        "name": "agen",
        "request": {
          taskName: requestObject
        }
      }
    };
    return _prettyPrintJson(payload);
  }

  static Map<String, dynamic> parseSignInResponse(String responseJson) {
    return json.decode(responseJson);
  }

  static String _prettyPrintJson(dynamic data) {
    final dynamic parsed = json.decode(json.encode(data));
    final encoder = JsonEncoder.withIndent('  ');
    return encoder.convert(parsed);
  }
}

// Usage
/*void main() {
  String login = "9999999999";
  String password = "5863";
  String signInPayload = PayloadHelper.createSignInPayload(login, password);
  print('Request payload:');
  print(signInPayload);

  // Simulating a response
  String responseJson = '''
    {
      "success": true,
      "message": "Sign-in successful",
      "token": "your_auth_token_here",
      "user": {
        "id": "user_id_here",
        "name": "User Name",
        "email": "user@example.com"
      }
    }
  ''';
  print('\nResponse payload:');
  print(responseJson);

  // Parsing the response
  Map<String, dynamic> response = PayloadHelper.parseSignInResponse(responseJson);
  print('\nParsed response:');
  print(response);
}*/
