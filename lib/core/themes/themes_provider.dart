import 'package:flutter/material.dart';
import 'package:phlegeton_character_finance_manager/core/themes/themes.dart';

class ThemesProvider with ChangeNotifier {
  Themes _currentTheme;

  Themes get currentTheme => _currentTheme;
  set currentTheme(Themes value) {
    _currentTheme = value;
    notifyListeners();
  }

  ThemesProvider({Themes currentTheme = Themes.themeB})
      : _currentTheme = currentTheme;
}
