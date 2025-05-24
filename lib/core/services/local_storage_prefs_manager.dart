// Created by: [Abdullah Awad] on 2025-5-24
import 'package:shared_preferences/shared_preferences.dart'
    show SharedPreferences;

abstract class LocalStorageManager {
  void setString(String key, String value);
  String? getString(String key);
  void setBool(String key, bool value);
  bool? getBool(String key);
  void setInt(String key, int value);
  int? getInt(String key);
  void remove(String key);
  /* Clears all stored preferences */
  Future<void> clear();
}

class LocalStoragePrefsManager implements LocalStorageManager {
  /// Returns the singleton instance of [LocalStoragePrefsManager].
  static late SharedPreferences instance;
  static LocalStoragePrefsManager? _instance;

  LocalStoragePrefsManager._internal();

  /// Initializes the local storage preferences manager.
  static Future<LocalStoragePrefsManager> init() async {
    if (_instance == null) {
      _instance = LocalStoragePrefsManager._internal();
      instance = await SharedPreferences.getInstance();
    }
    return _instance!;
  }

  @override
  Future<void> clear() async {
    await instance.clear();
  }

  @override
  bool? getBool(String key) {
    return instance.getBool(key);
  }

  @override
  int? getInt(String key) {
    return instance.getInt(key);
  }

  @override
  String? getString(String key) {
    return instance.getString(key);
  }

  @override
  void remove(String key) {
    instance.remove(key);
  }

  @override
  void setBool(String key, bool value) {
    instance.setBool(key, value);
  }

  @override
  void setInt(String key, int value) {
    instance.setInt(key, value);
  }

  @override
  void setString(String key, String value) {
    instance.setString(key, value);
  }
}
