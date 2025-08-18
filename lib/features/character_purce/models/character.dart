import 'package:json_annotation/json_annotation.dart';
import 'package:phlegeton_character_finance_manager/core/countries/countries.dart';
import 'package:phlegeton_character_finance_manager/core/countries/currencies.dart';
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

  List<RegionalPurse> _purse;
  List<RegionalPurse> get purse => _purse;
  set purse(value) {
    _purse = value;
  }

  Character({
    required String id,
    required String name,
    required List<RegionalPurse> purse,
  })  : _id = id,
        _name = name,
        _purse = purse.isEmpty ? _populatePurse() : purse;

  factory Character.fromJson(Json json) => _$CharacterFromJson(json);

  Json toJson() => _$CharacterToJson(this);

  static List<RegionalPurse> _populatePurse() {
    return Regions.values
        .map(
          (region) => RegionalPurse(
            region: region,
            holdings: Currencies.values
                .map(
                  (piece) => CoinHolding(currency: piece),
                )
                .toList(),
          ),
        )
        .toList();
  }
}
