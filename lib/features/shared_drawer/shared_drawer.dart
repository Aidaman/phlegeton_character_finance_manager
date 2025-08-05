import 'package:flutter/material.dart';
import 'package:phlegeton_character_finance_manager/features/homepage/widgets/create_character_dialog.dart';
import 'package:phlegeton_character_finance_manager/features/homepage/widgets/select_theme_dialog.dart';

class SharedDrawer extends StatelessWidget {
  const SharedDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, void Function()> navigationButtons = {
      'Лист Персонажів': () {},
      'Створити Персонажку(-а)': () => showAdaptiveDialog(
            context: context,
            builder: (context) => const CreateCharacterDialog(),
          ),
      'Вибір Теми': () => showAdaptiveDialog(
            context: context,
            builder: (context) => const SelectThemeDialog(),
          ),
    };

    return Drawer(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 16,
        ),
        child: Center(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: navigationButtons.length,
            itemBuilder: (context, index) => TextButton(
              onPressed: navigationButtons.entries.elementAt(index).value,
              child: Text(
                navigationButtons.entries.elementAt(index).key,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
