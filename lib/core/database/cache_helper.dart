import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static final CacheHelper _instance = CacheHelper._internal();
  late SharedPreferences prefs;

  factory CacheHelper() {
    return _instance;
  }

  CacheHelper._internal();

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<bool> setData({required String key, required var value}) async {
    if (value is int) {
      return prefs.setInt(key, value);
    } else if (value is double) {
      return prefs.setDouble(key, value);
    } else if (value is String) {
      return prefs.setString(key, value);
    } else if (value is bool) {
      return prefs.setBool(key, value);
    } else if (value is List<String>) {
      return prefs.setStringList(key, value);
    } else {
      return Future.value(false);
    }
  }

  getData({required String key}) {
    return prefs.get(key) ?? false;
  }

  Future<bool> clearData() async {
    return prefs.clear();
  }

  Future<bool> removeValue({required String key}) async {
    return prefs.remove(key);
  }
}
