abstract class LoginRepository {
  List<String> getUsernames();
  List<String> getPasswords();
  Future getUserFromApi();
  void saveLoginInfo(String _name, String _pass, bool logged);
  Future getLoginInfo();
}