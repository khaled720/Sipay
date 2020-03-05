import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtils {
  SharedPreferences _prefs;

  SharedPreferencesUtils(this._prefs);

  static Future<SharedPreferencesUtils> getSharedPrefs() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return SharedPreferencesUtils(sharedPreferences);
  }

  int getIntDataFromSharedPrefs(String key) {
    return _prefs.getInt(key);
  }

  String getStringDataFromSharedPrefs(String key) {
    return _prefs.getString(key);
  }

  bool getBoolDataFromSharedPrefs(String key) {
    return _prefs.getBool(key);
  }

  double getDoubleDataFromSharedPrefs(String key) {
    return _prefs.getDouble(key);
  }

  void setIntDataToSharedPrefs(String key, int data) {
    _prefs.setInt(key, data);
  }

  void setStringDataToSharedPrefs(String key, String data) {
    _prefs.setString(key, data);
  }

  void setBoolDataToSharedPrefs(String key, bool data) {
    _prefs.setBool(key, data);
  }

  void setDoubleDataToSharedPrefs(String key, double data) {
    _prefs.setDouble(key, data);
  }
}
