abstract class LoginRepositoryLocal {
  List<String> getUsernames();
  List<String> getPasswords();
  Future<void> saveLoginInfo(String _username, String _password, bool _logged);
  Future getLoginInfo();
}