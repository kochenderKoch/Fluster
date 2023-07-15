import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

extension DropDown on Locale {
  String toDropDown() {
    switch (countryCode) {
      case "en":
        return "English";
      case "de":
        return "Deutsch";
      default:
        return "English";
    }
  }
}

class SettingsProvider extends ChangeNotifier {
  Locale _appLocale = const Locale('en');
  FlexScheme _theme = FlexScheme.amber;
  ThemeMode _themeMode = ThemeMode.light;

  Locale get appLocal => _appLocale;
  FlexScheme get theme => _theme;
  ThemeMode get themeMode => _themeMode;

  SettingsProvider() {
    fetchLocale();
    fetchThemeMode();
    fetchSchema();
  }

  fetchSchema() async {
    var prefs = await SharedPreferences.getInstance();
    debugPrint(prefs.getString("schema"));
    if (prefs.getString('schema') != null) {
      _theme = FlexScheme.values.firstWhere(
        (element) => element.name == prefs.getString("schema"),
        orElse: () => FlexScheme.amber,
      );
      notifyListeners();
      return Null;
    }
    _theme = FlexScheme.amber;
    notifyListeners();
    return Null;
  }

  void changeSchema(FlexScheme schema) async {
    var prefs = await SharedPreferences.getInstance();
    if (_theme == schema) {
      return;
    }

    _theme = schema;

    debugPrint(schema.name.toString());
    await prefs.setString('schema', schema.name.toString());

    notifyListeners();
  }

  fetchThemeMode() async {
    var prefs = await SharedPreferences.getInstance();
    if (prefs.getString('themeMode') == "light") {
      _themeMode = ThemeMode.light;
      notifyListeners();
      return Null;
    } else if (prefs.getString('themeMode') == "dark") {
      _themeMode = ThemeMode.dark;
      notifyListeners();
      return Null;
    }
    _themeMode = ThemeMode.system;
    notifyListeners();
    return Null;
  }

  void changeThemeMode(ThemeMode mode) async {
    var prefs = await SharedPreferences.getInstance();
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

  fetchLocale() async {
    var prefs = await SharedPreferences.getInstance();
    if (prefs.getString('language_code') == null) {
      _appLocale = const Locale('en');
      notifyListeners();
      return Null;
    }
    _appLocale = Locale(prefs.getString('language_code')!);
    notifyListeners();
    return Null;
  }

  void changeLanguage(Locale type) async {
    var prefs = await SharedPreferences.getInstance();
    if (_appLocale == type) {
      return;
    }
    if (type == const Locale("de")) {
      _appLocale = const Locale("de");
      await prefs.setString('language_code', 'de');
      await prefs.setString('countryCode', 'GER');
    } else {
      _appLocale = const Locale("en");
      await prefs.setString('language_code', 'en');
      await prefs.setString('countryCode', 'US');
    }
    notifyListeners();
  }
}
