
import 'package:farming_motor_app/core/app_ui/app_ui.dart';
import 'package:farming_motor_app/core/services/local_storage/sharedpreference_service.dart';

class LanguageProvider extends ChangeNotifier {
  final LocalPreferences _prefs = LocalPreferences();

  Locale _locale = const Locale('en');

  Locale get locale => _locale;

  /// 🔹 Init from storage
  Future<void> loadLanguage() async {
    final code = _prefs.getLanguage ?? 'en';
    _locale = Locale(code);
    notifyListeners();
  }

  /// 🔹 Change language
  Future<void> setLanguage(String code) async {
    _locale = Locale(code);
    await _prefs.setLanguage(code);
    notifyListeners();
  }

  bool get isEnglish => _locale.languageCode == 'en';
  bool get isHindi => _locale.languageCode == 'hi';
  bool get isGujarati => _locale.languageCode == 'gu';
}