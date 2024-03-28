import 'package:flutter_test/flutter_test.dart';
import 'package:geo_agency_mobile/repository/local/login_repo_local.dart';
import 'package:geo_agency_mobile/repository/remote/login_repo_remote.dart';

void main() {
  LoginRepositoryLocalImpl? loginLocalRep;
  LoginRepositoryRemoteImpl? loginRemoteRep;

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

}