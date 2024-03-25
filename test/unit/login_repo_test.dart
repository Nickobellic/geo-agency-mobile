import 'package:flutter_test/flutter_test.dart';
import 'package:geo_agency_mobile/repository/login_repo.dart';

void main() {
  LoginRepositoryImpl? loginRep;

  setUpAll(() {
    loginRep = LoginRepositoryImpl();
  });
  test("Gets the Usernames from the List", () {

    expect(loginRep!.getUsernames(), isA<List<String>>());
  }); 

  test("Gets the Password from the List", () {
    final result = loginRep!.getPasswords();

    expect(result, isA<List<String>>());
  }); 

}