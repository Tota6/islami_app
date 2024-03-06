import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light;
  String currentLanguage = "en";

  Future<void> changeNotifier(ThemeMode newTheme) async {
    if (currentTheme == newTheme) return;
    currentTheme = newTheme;
    notifyListeners();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isDark", newTheme == ThemeMode.dark);
  }

  Future<void> changeLanguage(String language) async {
    if (currentLanguage == language) return;
    currentLanguage = language;
    notifyListeners();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("language", language);
  }

  Future<void> getlanguage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? lang = prefs.getString("language");
    if (lang != null) {
      currentLanguage = lang;
      notifyListeners();
    }
  }

  Future<void> getTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isDark = prefs.getBool("isDark");
    if (isDark != null) {
      if (isDark) {
        currentTheme = ThemeMode.dark;
        notifyListeners();
      } else {
        currentTheme == ThemeMode.light;
      }
      notifyListeners();
    }
  }

  changeBackground() {
    return currentTheme == ThemeMode.light
        ? "assets/images/default_bg.png"
        : "assets/images/dark_bg.png";
  }
}
