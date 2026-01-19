import 'dart:convert';

import 'package:farming_motor_app/core/models/src/login_model/login_model.dart';
import 'package:farming_motor_app/core/models/src/pump_detail_model/pump_detail_model.dart';
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
  Future<void> setToken(String value) async {
    await _prefs?.setString(PreferenceKey.isToken, value);
    logger.i('Token stored: ${_prefs?.getString(PreferenceKey.isToken)}');
  }

  bool get isAuth => _prefs?.getBool(PreferenceKey.isAuth) ?? false;
  String? get token => _prefs?.getString(PreferenceKey.isToken);

  // ---------------- SETUP ----------------
  Future<void> setSetupCompleted(bool value) async {
    await _prefs?.setBool(PreferenceKey.isFirstPumpCreated, value);
    logger.i(
      'isFirstPumpCreated stored: ${_prefs?.getBool(PreferenceKey.isFirstPumpCreated)}',
    );
  }

  bool get isFirstPumpCreated =>
      _prefs?.getBool(PreferenceKey.isFirstPumpCreated) ?? false;

  // ---------------- USER ----------------


  // =====================================================
  // 🔥🔥 PUMP RELATED (NEW ADDITIONS)
  // =====================================================

  /// ✅ Save pump ON / OFF state
  Future<void> setPumpState({
    required String pumpId,
    required bool isOn,
  }) async {
    await _prefs?.setBool('${PreferenceKey.pump}_$pumpId', isOn);
    logger.i('Pump[$pumpId] state stored: $isOn');
  }

  /// ✅ Get pump ON / OFF state
  bool getPumpState(String pumpId) {
    return _prefs?.getBool('${PreferenceKey.pump}_$pumpId') ?? false;
  }

  /// ✅ Save scheduled start time (epoch)
  Future<void> setPumpStartTime({
    required String pumpId,
    required DateTime time,
  }) async {
    await _prefs?.setInt(
      '${PreferenceKey.pump}_start_$pumpId',
      time.millisecondsSinceEpoch,
    );
  }

  /// ✅ Get scheduled start time
  DateTime? getPumpStartTime(String pumpId) {
    final millis =
    _prefs?.getInt('${PreferenceKey.pump}_start_$pumpId');
    if (millis == null) return null;
    return DateTime.fromMillisecondsSinceEpoch(millis);
  }
  List<PumpLogModel> getPumpLogs(String pumpId) {
    final key = '${PreferenceKey.pumpLogs}$pumpId';
    final logs = _prefs?.getStringList(key) ?? [];

    return logs.map((e) {
      final parts = e.split('|');
      return PumpLogModel(
        action: parts[0],
        time: DateTime.parse(parts[1]),
      );
    }).toList();
  }


  /// ✅ Clear single pump data
  Future<void> clearPump(String pumpId) async {
    await _prefs?.remove('${PreferenceKey.pump}_$pumpId');
    await _prefs?.remove('${PreferenceKey.pump}_start_$pumpId');
  }
  Future<void> addPumpLog({
    required String pumpId,
    required String action,
  }) async {
    final key = '${PreferenceKey.pumpLogs}$pumpId';

    final logs = _prefs?.getStringList(key) ?? [];
    logs.insert(
      0,
      '$action|${DateTime.now().toIso8601String()}',
    );

    await _prefs?.setStringList(key, logs);
  }
  /// ✅ Get logged-in user info
  // ---------------- USER ----------------

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
    await _prefs?.remove(PreferenceKey.isToken);
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
  static const String isToken = 'isToken';
  static const String isFirstPumpCreated = 'isFirstPumpCreated';
  static const String user = 'user';

  // 🔥 Pump base key
  static const String pump = 'pump';
  static const String pumpLogs = 'pump_logs';
}
