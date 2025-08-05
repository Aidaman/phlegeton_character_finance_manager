import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:phlegeton_character_finance_manager/core/json.typedef.dart';
import 'package:phlegeton_character_finance_manager/core/services/app_directories_service.dart';
import 'package:phlegeton_character_finance_manager/features/character_purce/models/character.dart';

class CharacterIoService {
  static final CharacterIoService _instance = CharacterIoService._internal();

  factory CharacterIoService() => _instance;

  CharacterIoService._internal();

  Future saveCharacter(Character character) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File(
          '${directory.path}/${AppDirectories.characters.path}/${character.id}.json');
      final jsonString = jsonEncode(character.toJson());

      await file.writeAsString(jsonString);
    } catch (e) {
      rethrow;
    }
  }

  Future<Character?> loadCharacter(String characterId) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File(
          '${directory.path}/${AppDirectories.characters.path}/$characterId.json');

      if (!file.existsSync()) {
        return null; // Character file not found
      }

      final jsonString = await file.readAsString();
      final jsonMap = jsonDecode(jsonString) as Json;

      return Character.fromJson(jsonMap);
    } catch (e) {
      return null;
    }
  }
}

final CharacterIoService characterIoService = CharacterIoService();
