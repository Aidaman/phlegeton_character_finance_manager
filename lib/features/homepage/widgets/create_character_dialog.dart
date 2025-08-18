import 'package:flutter/material.dart';
import 'package:phlegeton_character_finance_manager/features/character_purce/services/character_service.dart';
import 'package:provider/provider.dart';

class CreateCharacterDialog extends StatefulWidget {
  const CreateCharacterDialog({super.key});

  @override
  State<CreateCharacterDialog> createState() => _CreateCharacterDialogState();
}

class _CreateCharacterDialogState extends State<CreateCharacterDialog> {
  final _formKey = GlobalKey<FormState>();
  String _newCharacterName = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      content: Form(
        key: _formKey,
        child: TextFormField(
          onChanged: (value) {
            _newCharacterName = value;
          },
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }

            return null;
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Відмінити'),
        ),
        FilledButton(
          onPressed: () {
            context.read<CharacterService>().createCharacter(_newCharacterName);
            Navigator.pop(context);
          },
          child: const Text('Підтвердити'),
        ),
      ],
    );
  }
}
