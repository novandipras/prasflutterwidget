import 'package:shared_preferences/shared_preferences.dart';

class LocalSharedPreferences {
  LocalSharedPreferences();


  static const accessToken = 'accessToken';
  static const sessionToken = 'sessionToken';
  static const cookies = 'cookies';
  static const authTokenExpired = 'authTokenExpired';

  ///
  Future<void> saveAccessToken(String value) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString(accessToken, value);
  }

  Future<String?> getAccessToken() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString(accessToken);
  }

  Future<void> clearAccessToken() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.remove(accessToken);
  }
  ///
  Future<void> saveAuthTokenExpired(String value) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString(authTokenExpired, value);
  }

  Future<String?> getAuthTokenExpired() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString(authTokenExpired);
  }

  Future<void> clearAuthTokenExpired() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.remove(authTokenExpired);
  }
  ///
  Future<void> saveSessionToken(String value) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString(sessionToken, value);
  }

  Future<String?> getSessionToken() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString(sessionToken);
  }

  Future<void> clearSessionToken() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.remove(sessionToken);
  }
  ///
  Future<void> saveCookies(List<String> value) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setStringList(cookies, value);
  }

  Future<List<String>?> getCookies() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getStringList(cookies);
  }

  Future<void> clearCookies() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.remove(cookies);
  }
}
