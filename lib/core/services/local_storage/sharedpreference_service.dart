import 'dart:convert';

import 'package:farming_motor_app/core/app_ui/app_ui.dart';
import 'package:farming_motor_app/core/models/src/user_model/user_model.dart';
import 'package:farming_motor_app/core/utilities/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalPreferences {
  factory LocalPreferences() {
    return _instance;
  }

  LocalPreferences._internal();
  final Map<String,ValueNotifier<bool>> _pumpStateNotifiers  = {};
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
  Future<void> savePumpTimer({
    required String serial,
    required String pumpId,
    required int minutes,
  }) async {
    final key = '_timer_${serial}_$pumpId';
    final startTime = DateTime.now();

    await _prefs?.setString('${key}_start', startTime.toIso8601String());
    await _prefs?.setInt('${key}_minutes', minutes);
    await _prefs?.setBool('${key}_active', true);

    logger.i('Timer saved for pump $serial-$pumpId: $minutes minutes');
  }
  Future<void> setLanguage(String code) async{
    await _prefs?.setString(PreferenceKey.language,code);
    logger.d('Language Saved : $code');
  }

  Future<void> clearPumpTimer({
    required String serial,
    required String pumpId,
  }) async {
    final key = '_timer_${serial}_$pumpId';

    await _prefs?.remove('${key}_start');
    await _prefs?.remove('${key}_minutes');
    await _prefs?.remove('${key}_active');

    logger.i('Timer cleared for pump $serial-$pumpId');
  }
  // LocalPreferences ક્લાસની અંદર ઉમેરો
  Future<void> reload() async {
    await _prefs?.reload();
  }

  Map<String, dynamic>? getPumpTimer({
    required String serial,
    required String pumpId,
  }) {
    final key = '_timer_${serial}_$pumpId';

    final startStr = _prefs?.getString('${key}_start');
    final minutes = _prefs?.getInt('${key}_minutes');
    final active = _prefs?.getBool('${key}_active') ?? false;

    if (startStr == null || minutes == null) return null;

    return {
      'startTime': DateTime.parse(startStr),
      'minutes': minutes,
      'active': active,
      'remainingMinutes': _calculateRemainingMinutes(
        DateTime.parse(startStr),
        minutes,
      ),
    };
  }
  int _calculateRemainingMinutes(DateTime startTime, int totalMinutes) {
    final now = DateTime.now();
    final elapsed = now.difference(startTime).inMinutes;
    final remaining = totalMinutes - elapsed;
    return remaining > 0 ? remaining : 0;
  }
  

  bool isPumpTimerActive({
    required String serial,
    required String pumpId,
  }) {
    final key = '_timer_${serial}_$pumpId';
    return _prefs?.getBool('${key}_active') ?? false;
  }

  bool get isPumpRunning =>
      _prefs?.getBool(PreferenceKey.pumpRunning) ?? false;

  

  bool get isAuth => _prefs?.getBool(PreferenceKey.isAuth) ?? false;
  String? get isAdminToken => _prefs?.getString(PreferenceKey.isAdminToken);
  String? get isCustomerToken => _prefs?.getString(PreferenceKey.isCustomerAuthToken);
  String? get getLanguage => _prefs?.getString(PreferenceKey.language);

  // ---------------- SETUP ----------------



  /// ✅ Save logged-in user info
  Future<void> setUser(UserModel user) async {
    final jsonString = jsonEncode((user.toJson()));
    await _prefs?.setString(PreferenceKey.user, jsonString);

    logger.i('User stored: $jsonString');
  }

  UserModel? getUser() {
    final jsonString = _prefs?.getString(PreferenceKey.user);
    if (jsonString == null) return null;

    final Map<String, dynamic> json =
    jsonDecode(jsonString) as Map<String, dynamic>;
    logger.d(UserModel.fromJson(json));

    return UserModel.fromJson(json);
  }

  Future<void> setPumpState({
    required String serial,
    required String pumpId,
    required bool value,
  }) async {
    final key = PreferenceKey._pumpControlKey(serial, pumpId);
    await _prefs?.setBool(key, value);
    if(_pumpStateNotifiers.containsKey(key)){
    _pumpStateNotifiers[key]!.value = value;
    }
    logger.i('Pump state stored [$key] => $value');
  }


  ValueNotifier<bool> getPumpState({
    required String serial,
    required String pumpId,
}) {

    final key = PreferenceKey._pumpControlKey(serial, pumpId);
    logger.d(_prefs?.getBool(key) ?? false);

    _pumpStateNotifiers[key] = ValueNotifier<bool>(_prefs?.getBool(key) ?? false);

    return _pumpStateNotifiers[key]!;
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

  // Timer Keys
  static const pumpStartTime = 'pump_start_time';
  static const pumpTotalMinutes = 'pump_total_minutes';
  static const pumpRunning = 'pump_running';
  static const elapsedSeconds = 'elapsed_seconds';


  // Pump control
  static String _pumpControlKey (String serial,String pumpId) => 'pump_${serial}_$pumpId';


  // Language

  static const String language = 'Language';

}
