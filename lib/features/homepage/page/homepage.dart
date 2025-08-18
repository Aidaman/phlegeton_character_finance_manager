import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phlegeton_character_finance_manager/core/routing/app_routes.dart';
import 'package:phlegeton_character_finance_manager/features/homepage/widgets/filled_button.dart';
import 'package:phlegeton_character_finance_manager/features/character_purce/services/character_service.dart';
import 'package:phlegeton_character_finance_manager/features/shared_drawer/shared_drawer.dart';
import 'package:phlegeton_character_finance_manager/features/themed_page_background/themed_page_background.dart';
import 'package:provider/provider.dart';

class Homepage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final characterService = context.watch<CharacterService>();

    return ThemedPageBackground(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => _scaffoldKey.currentState?.openDrawer(),
          ),
        ),
        drawer: const SharedDrawer(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 16),
          child: ListView.separated(
            itemCount: characterService.characters.length,
            separatorBuilder: (context, index) => const Gap(16),
            itemBuilder: (context, index) => GradientButton(
              onPressed: () => Navigator.pushNamed(
                context,
                AppRoutes.characterFinances.destination,
                arguments: {
                  'character_id':
                      characterService.characters.elementAt(index).id
                },
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      characterService.characters.elementAt(index).name,
                    ),
                  ),
                  IconButton(
                    onPressed: () => showAdaptiveDialog(
                      context: context,
                      builder: (context) => AlertDialog.adaptive(
                        title: const Text('Точно Видалити?'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Не видаляти'),
                          ),
                          FilledButton(
                            onPressed: () {
                              characterService.deleteCharacter(
                                characterService.characters.elementAt(index).id,
                              );
                            },
                            child: const Text('Видалити'),
                          )
                        ],
                      ),
                    ),
                    icon: const Icon(Icons.delete),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
