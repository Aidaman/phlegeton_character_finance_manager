import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phlegeton_character_finance_manager/features/character_purce/models/character.dart';
import 'package:phlegeton_character_finance_manager/features/character_purce/services/character_service.dart';
import 'package:phlegeton_character_finance_manager/features/shared_drawer/shared_drawer.dart';
import 'package:phlegeton_character_finance_manager/features/themed_page_background/themed_page_background.dart';
import 'package:provider/provider.dart';

class Homepage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Character> characters =
        context.watch<CharacterService>().characters;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
        ),
      ),
      drawer: const SharedDrawer(),
      body: ThemedPageBackground(
        child: ListView.separated(
          itemCount: characters.length,
          separatorBuilder: (context, index) => const Gap(16),
          itemBuilder: (context, index) => FilledButton(
            onPressed: () {},
            child: Text(characters.elementAt(index).name),
          ),
        ),
      ),
    );
  }
}
