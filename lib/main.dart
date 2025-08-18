import 'package:flutter/material.dart';
import 'package:phlegeton_character_finance_manager/core/routing/app_routes.dart';
import 'package:phlegeton_character_finance_manager/core/services/app_directories_service.dart';
import 'package:phlegeton_character_finance_manager/core/themes/themes.dart';
import 'package:phlegeton_character_finance_manager/core/themes/themes_provider.dart';
import 'package:phlegeton_character_finance_manager/features/character_purce/services/character_service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CharacterService(),
        ),
        ChangeNotifierProvider(
          create: (_) => ThemesProvider(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  _initDirectories() async {
    await appDirectoriesService.ensureDirectories();
  }

  _initCharacters() async {
    await context.read<CharacterService>().loadCharacters();
  }

  _initTheme() async {
    await context.read<ThemesProvider>().loadTheme();
  }

  @override
  void initState() {
    super.initState();
    _initDirectories();
    _initCharacters();
    _initTheme();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: context.watch<ThemesProvider>().currentTheme.themeData,
      initialRoute: AppRoutes.homepage.destination,
      routes: Map.fromEntries(
        AppRoutes.values.map(
          (e) => MapEntry(e.destination, e.builder),
        ),
      ),
    );
  }
}

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
