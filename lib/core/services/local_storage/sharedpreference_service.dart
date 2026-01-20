import 'dart:convert';

import 'package:farming_motor_app/core/models/src/login_model/login_model.dart';
import 'package:farming_motor_app/core/utilities/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalPreferences {
  factory LocalPreferences() {
    return _instance;
  }

  LocalPreferences._internal();
  static final LocalPreferences _instance = LocalPreferences._internal();

  SharedPreferences? _prefs;

  // 🔹 INIT
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // ---------------- AUTH ----------------
  Future<void> setAuth(bool value) async {
    await _prefs?.setBool(PreferenceKey.isAuth, value);
    logger.i('isAuth stored: ${_prefs?.getBool(PreferenceKey.isAuth)}');
  }
  Future<void> setAdminToken(String value) async {
    await _prefs?.setString(PreferenceKey.isAdminToken, value);
    logger.i('Token stored: ${_prefs?.getString(PreferenceKey.isAdminToken)}');
  }
  Future<void> setCustomerToken(String value) async {
    await _prefs?.setString(PreferenceKey.isCustomerAuthToken, value);
    logger.i('Token stored: ${_prefs?.getString(PreferenceKey.isCustomerAuthToken)}');
  }

  bool get isAuth => _prefs?.getBool(PreferenceKey.isAuth) ?? false;
  String? get isAdminToken => _prefs?.getString(PreferenceKey.isAdminToken);
  String? get isCustomerToken => _prefs?.getString(PreferenceKey.isCustomerAuthToken);

  // ---------------- SETUP ----------------



  /// ✅ Save logged-in user info
  Future<void> setUser(User user) async {
    final jsonString = jsonEncode((user.toJson()));
    await _prefs?.setString(PreferenceKey.user, jsonString);

    logger.i('User stored: $jsonString');
  }

  User? getUser() {
    final jsonString = _prefs?.getString(PreferenceKey.user);
    if (jsonString == null) return null;

    final Map<String, dynamic> json =
    jsonDecode(jsonString) as Map<String, dynamic>;

    return User.fromJson(json);
  }
  /// ✅ Clear user only
  Future<void> clearUser() async {
    await _prefs?.remove(PreferenceKey.user);
    await _prefs?.remove(PreferenceKey.isAdminToken);
    await _prefs?.remove(PreferenceKey.isAuth);

    logger.i('User cleared');
  }



  // ---------------- CLEAR ALL ----------------
  Future<void> clear() async {
    await _prefs?.clear();
  }
}

// =====================================================
// 🔑 Preference Keys
// =====================================================
class PreferenceKey {
  static const String isAuth = 'isAuth';
  static const String isAdminToken = 'isAdminToken';
  static const String isCustomerAuthToken = 'isCustomerAuthToken';
  static const String user = 'user';

  // 🔥 Pump base key
  static const String pump = 'pump';
  static const String pumpLogs = 'pump_logs';
}
