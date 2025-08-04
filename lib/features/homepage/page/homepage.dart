import 'package:flutter/material.dart';
import 'package:phlegeton_character_finance_manager/features/shared_drawer/shared_drawer.dart';

class Homepage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
        ),
      ),
      drawer: SharedDrawer(),
      body: const Placeholder(),
    );
  }
}
