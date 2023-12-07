import 'package:shared_preferences/shared_preferences.dart';

class SharedpreferencesService {
  static late SharedPreferences sharedpreferences;
  static initialization() async {
    sharedpreferences = await SharedPreferences.getInstance();
  }

  static void setData({required String key, required dynamic value}) async {
    if (value is bool) {
      await sharedpreferences.setBool(key, value);
    } else if (value is String) {
      await sharedpreferences.setString(key, value);
    } else if (value is int) {
      await sharedpreferences.setInt(key, value);
    }
  }

  static getData({required String key}) {
    dynamic data = sharedpreferences.get(key);
    return data;
  }

  static void deleteData({required String key}) {
    sharedpreferences.remove(key);
  }
}
