import 'dart:convert';
import 'package:flutter_bloc_di/app/data/data_interfaces/local_interfaces.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferentStorage implements PreferencesStorageInterfaces {

  Future<String?> _getItem(String key) async {
    final prefs = await SharedPreferences.getInstance();
    String? keyVal = prefs.getString(key);
    if (keyVal != null)
      return jsonDecode(keyVal);
    else
      return null;
  }

  Future<bool> _setItem(String key, String data) async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.setString(key, data);
  }

  Future<bool> _removeItem(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.remove(key);
  }

  @override
  Future<bool> clearPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.clear();
  }

  @override
  Future<bool> removeItemExample(String key) async {
    return await _removeItem(key);
  }

  @override
  Future<bool> setItemExample(String key, String value) async {
    return await _setItem(key, value);
  }

  @override
  Future<String?> getItemExample(String key)async {
    return await _getItem(key);
  }
}
