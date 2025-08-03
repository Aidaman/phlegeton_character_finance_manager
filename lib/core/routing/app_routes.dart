import 'package:flutter/material.dart';
import 'package:phlegeton_character_finance_manager/features/character_finances/page/character_finances.dart';
import 'package:phlegeton_character_finance_manager/features/homepage/page/homepage.dart';

enum AppRoutes {
  homepage,
  characterFinances,
}

extension AppRouting on AppRoutes {
  String get destination => switch (this) {
        AppRoutes.homepage => '/',
        AppRoutes.characterFinances => '/character',
      };

  WidgetBuilder get builder => switch (this) {
        AppRoutes.homepage => (context) => const Homepage(),
        AppRoutes.characterFinances => (context) => const CharacterFinances(),
      };
}
