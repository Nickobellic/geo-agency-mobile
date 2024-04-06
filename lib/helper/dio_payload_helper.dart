import 'dart:convert';

class PayloadHelper {
  static String createSignInPayload(String login, String password, String taskName) {
    Map<String, dynamic> payload = {
      "eventCode": "rqstevnt_agcy_agnt_$taskName",
      "systemCode": "agncy",
      "session": {
        "ruleConfirmation": false,
        "gpsLoc": [0, 0],
        "device": {"type": "browser", "token": "postman"},
        "task": taskName,
        "domain": "app.geo-daily.com"
      },
      "role": {
        "name": "agen",
        "request": {
          "authInfo": {"login": login, "password": password, "device": 
          {"type": "browser", "token": "postman"}
          }
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
