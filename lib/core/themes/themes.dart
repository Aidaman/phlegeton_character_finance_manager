import 'package:flutter/material.dart';

enum Themes {
  themeL,
  themeG,
  themeB,
  themeT,
}

extension ThemesData on Themes {
  ThemeData get themeData => switch (this) {
        Themes.themeL => _themeL,
        Themes.themeG => _themeG,
        Themes.themeB => _themeB,
        Themes.themeT => _themeT,
      };

  String get name => switch (this) {
        Themes.themeL => 'Тема Л',
        Themes.themeG => 'Тема Г',
        Themes.themeB => 'Тема Б',
        Themes.themeT => 'Тема Т',
      };

  String get assetBackgroundPath => switch (this) {
        Themes.themeL => 'assets/backgrounds/theme_l.svg',
        Themes.themeG => 'assets/backgrounds/theme_g.svg',
        Themes.themeB => 'assets/backgrounds/theme_b.svg',
        Themes.themeT => 'assets/backgrounds/theme_t.svg',
      };

  String get assetIconPath => switch (this) {
        Themes.themeL => 'assets/theme_icons/theme_l_icon.png',
        Themes.themeG => 'assets/theme_icons/theme_g_icon.png',
        Themes.themeB => 'assets/theme_icons/theme_b_icon.png',
        Themes.themeT => 'assets/theme_icons/theme_t_icon.png',
      };
}

ThemeData _themeL = ThemeData(
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFFFF9C59),
    onPrimary: Color(0xFFFCFEFB),
    secondary: Color(0xFFFD89CD),
    onSecondary: Color(0xFFFCFEFB),
    error: Colors.deepOrange,
    onError: Color(0xFFFCFEFB),
    surface: Color(0x001A1A1A),
    onSurface: Color(0xFFFCFEFB),
  ),
);

ThemeData _themeG = ThemeData(
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
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
    brightness: Brightness.light,
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
    brightness: Brightness.light,
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
