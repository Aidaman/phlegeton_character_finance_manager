import 'package:flutter/material.dart';

enum Themes {
  themeL,
  themeG,
  themeB,
  themeT,
}

extension ThemesData on Themes {
  ThemeData get colorScheme => switch (this) {
        Themes.themeL => _themeT,
        Themes.themeG => _themeG,
        Themes.themeB => _themeB,
        Themes.themeT => _themeT,
      };

  String get assetImagePath => switch (this) {
        Themes.themeL => '/assets/backgrounds/theme_l',
        Themes.themeG => '/assets/backgrounds/theme_g',
        Themes.themeB => '/assets/backgrounds/theme_b',
        Themes.themeT => '/assets/backgrounds/theme_t',
      };
}

ThemeData _themeL = ThemeData(
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFFFF9C59),
    onPrimary: Color(0xFFFCFEFB),
    secondary: Color(0xFFFD89CD),
    onSecondary: Color(0xFFFCFEFB),
    error: Colors.deepOrange,
    onError: Color(0xFFFCFEFB),
    surface: Color(0xFF1A1A1A),
    onSurface: Color(0xFFFCFEFB),
  ),
);

ThemeData _themeG = ThemeData(
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF98E8C1),
    onPrimary: Color(0xFFFCFEFB),
    secondary: Color(0xFF7BADE2),
    onSecondary: Color(0xFFFCFEFB),
    error: Colors.deepOrange,
    onError: Color(0xFFFCFEFB),
    surface: Color(0xFF1A1A1A),
    onSurface: Color(0xFFFCFEFB),
  ),
);

ThemeData _themeB = ThemeData(
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFFFB0074),
    onPrimary: Color(0xFFFCFEFB),
    secondary: Color(0xFF0135AB),
    onSecondary: Color(0xFFFCFEFB),
    error: Colors.deepOrange,
    onError: Color(0xFFFCFEFB),
    surface: Color(0xFF1A1A1A),
    onSurface: Color(0xFFFCFEFB),
  ),
);

ThemeData _themeT = ThemeData(
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF39D7FF),
    onPrimary: Color(0xFF1A1A1A),
    secondary: Color(0xFFFEA7EC),
    onSecondary: Color(0xFF1A1A1A),
    error: Colors.deepOrange,
    onError: Color(0xFFFCFEFB),
    surface: Color(0xFF1A1A1A),
    onSurface: Color(0xFFFCFEFB),
  ),
);
