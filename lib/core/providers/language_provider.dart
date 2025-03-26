import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier {
  static const String _languageKey = 'language';
  final SharedPreferences _prefs;

  LanguageProvider(this._prefs) {
    _loadLanguage();
  }

  Locale _locale = const Locale('en');
  Locale get locale => _locale;

  void _loadLanguage() {
    final language = _prefs.getString(_languageKey);
    if (language != null) {
      _locale = Locale(language);
      notifyListeners();
    }
  }

  Future<void> setLanguage(String languageCode) async {
    if (_locale.languageCode != languageCode) {
      _locale = Locale(languageCode);
      await _prefs.setString(_languageKey, languageCode);
      notifyListeners();
    }
  }

  String getLanguageName(String languageCode) {
    switch (languageCode) {
      case 'en':
        return 'English';
      case 'vi':
        return 'Tiếng Việt';
      default:
        return 'English';
    }
  }
} 