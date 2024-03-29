import 'package:flutter_test/flutter_test.dart';
import 'package:geo_agency_mobile/repository/local/login_repo_local.dart';
import 'package:geo_agency_mobile/repository/remote/login_repo_remote.dart';
import 'package:dio/dio.dart';
import 'package:geo_agency_mobile/helper/dio_client.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  LoginRepositoryLocalImpl? loginLocalRep;
  LoginRepositoryRemoteImpl? loginRemoteRep;
  final dio = Dio();
  final dioAdapter = DioAdapter(dio: DioClient.instance.dio);
  dio.httpClientAdapter = dioAdapter;


  setUpAll(() {
    loginLocalRep = LoginRepositoryLocalImpl();
    loginRemoteRep = LoginRepositoryRemoteImpl();
  });
  test("Gets the Usernames from the List", () {

    expect(loginLocalRep!.getUsernames(), isA<List<String>>());
  }); 

  test("Gets the Password from the List", () {
    final result = loginLocalRep!.getPasswords();

    expect(result, isA<List<String>>());

  });

  // API Mock testing
  test('Get 2nd User data from Reqres API', () async{
    dioAdapter.onGet('/users/2', (server) => server.reply(200, {
      "data": {
        "email": "janet.weaver@reqres.in",
        "first_name": "Janet",
    },

    }, delay: const Duration(seconds: 2)));

    final result = await loginRemoteRep!.getUserFromApi();
    if(result != null) {
    expect(result, isNotNull, reason: "API request is not null");
    expect(result.length, 2, reason: "Returns a list of Length 2");
    expect(result[0], isA<String>(), reason: "Returns username as string");
    expect(result[1], isA<String>(), reason: "Returns password as string");
    }
  }); 

}