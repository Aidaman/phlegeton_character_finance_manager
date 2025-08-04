import 'package:json_annotation/json_annotation.dart';
import 'package:phlegeton_character_finance_manager/core/json.typedef.dart';
import 'package:phlegeton_character_finance_manager/features/character_purce/models/purse.dart';

part 'character.g.dart';

@JsonSerializable()
class Character {
  @JsonKey(name: 'id')
  final String _id;
  String get id => _id;

  @JsonKey(name: 'name')
  final String _name;
  String get name => _name;

  final List<RegionalPurse> purse;

  Character({required String id, required String name, required this.purse})
      : _id = id,
        _name = name;

  factory Character.fromJson(Json json) => _$CharacterFromJson(json);

  Json toJson() => _$CharacterToJson(this);
}
