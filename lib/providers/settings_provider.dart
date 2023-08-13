import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Extension for [DropDown] Widget
extension DropDown on Locale {
  /// Convert [countryCode] to readable Output
  String toDropDown() {
    switch (countryCode) {
      case 'en':
        return 'English';
      case 'de':
        return 'Deutsch';
      default:
        return 'English';
    }
  }
}

/// Provider for Settings
class SettingsProvider extends ChangeNotifier {
  /// [SettingsProvider] Constructor
  SettingsProvider() {
    fetchLocale();
    fetchThemeMode();
    fetchSchema();
  }

  Locale _appLocale = const Locale('en');
  FlexScheme _theme = FlexScheme.amber;
  ThemeMode _themeMode = ThemeMode.light;

  /// In the App selected: [Locale]
  Locale get appLocal => _appLocale;

  /// In the App selected: [FlexScheme]
  FlexScheme get theme => _theme;

  /// In the App selected: [ThemeMode]
  ThemeMode get themeMode => _themeMode;

  /// Catch saved [FlexScheme] from [SharedPreferences]
  Future<void> fetchSchema() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString('schema') != null) {
      _theme = FlexScheme.values.firstWhere(
        (element) => element.name == prefs.getString('schema'),
        orElse: () => FlexScheme.amber,
      );
      notifyListeners();
      return;
    }
    _theme = FlexScheme.amber;
    notifyListeners();
  }

  /// Change [FlexScheme] and write it to [SharedPreferences]
  Future<void> changeSchema(FlexScheme schema) async {
    final prefs = await SharedPreferences.getInstance();
    if (_theme == schema) {
      return;
    }
    _theme = schema;
    await prefs.setString('schema', schema.name);

    notifyListeners();
  }

  /// Catch saved [ThemeMode] from [SharedPreferences]
  Future<void> fetchThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString('themeMode') == 'light') {
      _themeMode = ThemeMode.light;
      notifyListeners();
      return;
    } else if (prefs.getString('themeMode') == 'dark') {
      _themeMode = ThemeMode.dark;
      notifyListeners();
      return;
    }
    _themeMode = ThemeMode.system;
    notifyListeners();
  }

  /// Change [ThemeMode] and write it to [SharedPreferences]
  Future<void> changeThemeMode(ThemeMode mode) async {
    final prefs = await SharedPreferences.getInstance();
    if (_themeMode == mode) {
      return;
    }
    if (mode == ThemeMode.light) {
      _themeMode = ThemeMode.light;
      await prefs.setString('themeMode', 'light');
    } else if (mode == ThemeMode.dark) {
      _themeMode = ThemeMode.dark;
      await prefs.setString('themeMode', 'dark');
    } else {
      _themeMode = ThemeMode.system;
      await prefs.setString('themeMode', 'system');
    }
    notifyListeners();
  }

  /// Catch saved [Locale] from [SharedPreferences]
  Future<void> fetchLocale() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString('language_code') == null) {
      _appLocale = const Locale('en');
      notifyListeners();
      return;
    }
    _appLocale = Locale(prefs.getString('language_code')!);
    notifyListeners();
  }

  /// Change [Locale] and write it to [SharedPreferences]
  Future<void> changeLanguage(Locale type) async {
    final prefs = await SharedPreferences.getInstance();
    if (_appLocale == type) {
      return;
    }
    if (type == const Locale('de')) {
      _appLocale = const Locale('de');
      await prefs.setString('language_code', 'de');
      await prefs.setString('countryCode', 'GER');
    } else {
      _appLocale = const Locale('en');
      await prefs.setString('language_code', 'en');
      await prefs.setString('countryCode', 'US');
    }
    notifyListeners();
  }
}
