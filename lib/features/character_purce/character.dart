import 'package:phlegeton_character_finance_manager/features/character_purce/purse.dart';

class Character {
  final String id;
  final String name;

  final List<RegionalPurse> purse;

  Character({required this.id, required this.name, required this.purse});
}
