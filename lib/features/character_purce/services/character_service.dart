import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:phlegeton_character_finance_manager/core/services/app_directories_service.dart';
import 'package:phlegeton_character_finance_manager/features/character_purce/models/character.dart';
import 'package:phlegeton_character_finance_manager/features/character_purce/services/character_io_service.dart';
import 'package:uuid/uuid.dart';

class CharacterService with ChangeNotifier {
  final List<Character> _characters = [];
  List<Character> get characters => _characters;

  loadCharacters() async {
    if (characters.isNotEmpty) {
      return;
    }

    final Directory appDocDir = await getApplicationDocumentsDirectory();
    final Directory characterDirectory = Directory(
      '${appDocDir.path}/${AppDirectories.characters.path}',
    );

    if (!await characterDirectory.exists()) {
      throw Exception('user content directory with characters does not exist');
    }

    List<FileSystemEntity> files = characterDirectory.listSync();
    for (FileSystemEntity file in files) {
      if (file is File) {
        try {
          String content = await file.readAsString();
          characters.add(Character.fromJson(json.decode(content)));
        } catch (e) {
          rethrow;
        }
      }
    }

    notifyListeners();
  }

  createCharacter(String name) {
    final newCharacter = Character(
      id: const Uuid().v4(),
      name: name,
      purse: [],
    );

    _characters.add(newCharacter);
    characterIoService.saveCharacter(newCharacter);
  }
}
