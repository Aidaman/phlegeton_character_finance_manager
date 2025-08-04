import 'package:flutter/material.dart';
import 'package:phlegeton_character_finance_manager/core/routing/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
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
