import 'package:shared_preferences/shared_preferences.dart';

class UserLocal {
  static const String TOKEN = 'token';

  Future<String?> getAuthToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString(TOKEN);
    return token;
  }

  Future<void> saveAuthToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(TOKEN, token);
  }

  Future<void> logout() async {
    saveAuthToken('');
  }
}
