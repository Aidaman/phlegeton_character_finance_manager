// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinHolding _$CoinHoldingFromJson(Map<String, dynamic> json) => CoinHolding(
      currency: $enumDecode(_$CurrenciesEnumMap, json['currency']),
      amount: (json['amount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$CoinHoldingToJson(CoinHolding instance) =>
    <String, dynamic>{
      'currency': _$CurrenciesEnumMap[instance.currency]!,
      'amount': instance.amount,
    };

const _$CurrenciesEnumMap = {
  Currencies.cp: 'Copper Pieces',
  Currencies.sp: 'Silver Pieces',
  Currencies.gp: 'Gold Pieces',
  Currencies.pp: 'Platinum Pieces',
};

RegionalPurse _$RegionalPurseFromJson(Map<String, dynamic> json) =>
    RegionalPurse(
      region: $enumDecode(_$RegionsEnumMap, json['region']),
      holdings: (json['holdings'] as List<dynamic>)
          .map((e) => CoinHolding.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RegionalPurseToJson(RegionalPurse instance) =>
    <String, dynamic>{
      'region': _$RegionsEnumMap[instance.region]!,
      'holdings': instance.holdings,
    };

const _$RegionsEnumMap = {
  Regions.archaeos: 'archaeos',
  Regions.asteristema: 'asteristema',
  Regions.tenemain: 'tenemain',
  Regions.tribesOfGiants: 'tribesOfGiants',
  Regions.psavek: 'psavek',
  Regions.yagyeTan: 'yagyeTan',
  Regions.dwarvenKingdoms: 'dwarvenKingdoms',
  Regions.longZhiGou: 'longZhiGou',
};
