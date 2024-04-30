import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefServices {
  // set bool
  static Future<void> setBoolMethod(String key, bool value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool(key, value);
  }

  // get bool
  static Future<bool> getBoolMethod(String key) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool(key) ?? false;
  }
}
