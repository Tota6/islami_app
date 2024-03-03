import 'dart:ui';

import 'package:flutter/material.dart';

class SettingProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light;
  String currentLanguage = "en";

  changeNotifier(ThemeMode newTheme) {
    if (currentTheme == newTheme) return;
    currentTheme = newTheme;
    notifyListeners();
  }

  changeLanguage(String language) {
    if (currentLanguage == language) return;
    currentLanguage = language;
    notifyListeners();
  }

  changeBackground() {
    return currentTheme == ThemeMode.light
        ? "assets/images/default_bg.png"
        : "assets/images/dark_bg.png";
  }
}
