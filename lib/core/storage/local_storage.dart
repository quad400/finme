import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static final SharedPreferencesAsync _prefs = SharedPreferencesAsync();

  static Future<void> save(String key, dynamic value) async {
    if (value is String) {
      await _prefs.setString(key, value);
    } else if (value is bool) {
      await _prefs.setBool(key, value);
    } else if (value is int) {
      await _prefs.setInt(key, value);
    } else if (value is double) {
      await _prefs.setDouble(key, value);
    } else if (value is List<String>) {
      await _prefs.setStringList(key, value);
    } else {
      throw ArgumentError("Unsupported storage type: ${value.runtimeType}");
    }
  }

  static Future get<T>(String key) async {
    if (T is String) {
      return await _prefs.getString(key);
    } else if (T == bool) {
      return await _prefs.getBool(key);
    } else if (T == int) {
      return await _prefs.getInt(key);
    } else if (T == double) {
      return await _prefs.getDouble(key);
    } else if (T == List<String>) {
      return await _prefs.getStringList(key);
    } else {
      return null;
    }
  }

  static Future<void> remove(String key) async {
    await _prefs.remove(key);
  }
}
