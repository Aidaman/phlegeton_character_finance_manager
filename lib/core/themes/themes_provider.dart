import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:phlegeton_character_finance_manager/core/json.typedef.dart';
import 'package:phlegeton_character_finance_manager/core/services/app_directories_service.dart';
import 'package:phlegeton_character_finance_manager/core/themes/themes.dart';

class ThemesProvider with ChangeNotifier {
  Themes _currentTheme;

  Themes get currentTheme => _currentTheme;
  setTheme(Themes value, {bool save = true}) async {
    _currentTheme = value;

    if (save) {
      saveTheme();
    }

    notifyListeners();
  }

  ThemesProvider({Themes currentTheme = Themes.themeB})
      : _currentTheme = currentTheme;

  saveTheme() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File(
          '${directory.path}/${AppDirectories.appDirectory.path}/theme.json');
      final jsonString = jsonEncode(
        {"theme": _currentTheme.name},
      );

      await file.writeAsString(jsonString);
    } catch (e) {
      rethrow;
    }
  }

  loadTheme() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File(
          '${directory.path}/${AppDirectories.appDirectory.path}/theme.json');

      if (!file.existsSync()) {
        saveTheme();
        return;
      }

      final jsonString = await file.readAsString();
      final jsonMap = jsonDecode(jsonString) as Json;

      setTheme(ThemesData.fromName(jsonMap["theme"]), save: false);
    } catch (e) {
      rethrow;
    }
  }
}
