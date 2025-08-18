// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
enum Currencies {
  @JsonValue('Copper Pieces')
  cp,
  @JsonValue('Silver Pieces')
  sp,
  @JsonValue('Gold Pieces')
  gp,
  @JsonValue('Platinum Pieces')
  pp,
}

extension CurrencyProperNames on Currencies {
  String get Archaeos => switch (this) {
        Currencies.cp => 'Мідний Кермій',
        Currencies.sp => 'Срібний Обол',
        Currencies.gp => 'Золота Драхма',
        Currencies.pp => 'Платиновий Талан',
      };

  String get ArchaeosShort => switch (this) {
        Currencies.cp => 'Кермій',
        Currencies.sp => 'Обол',
        Currencies.gp => 'Драхма',
        Currencies.pp => 'Талан',
      };

  String get Asteristema => switch (this) {
        Currencies.cp => 'Мідний Мендар',
        Currencies.sp => 'Срібний Офір',
        Currencies.gp => 'Золотий Салміран',
        Currencies.pp => 'Платиновий Беліос / Массар',
      };

  String get AsteristemaShort => switch (this) {
        Currencies.cp => 'Мендар',
        Currencies.sp => 'Офір',
        Currencies.gp => 'Салміран',
        Currencies.pp => 'Беліос / Массар',
      };

  String get Tenemain => switch (this) {
        Currencies.cp => 'Мідний Мендар',
        Currencies.sp => 'Срібний Офір',
        Currencies.gp => 'Золотий Лунор',
        Currencies.pp => 'Платиновий Арель / Массар',
      };

  String get TenemainShort => switch (this) {
        Currencies.cp => 'Мендар',
        Currencies.sp => 'Офір',
        Currencies.gp => 'Лунор',
        Currencies.pp => 'Арель / Массар',
      };

  String get YagyeTan => switch (this) {
        Currencies.cp => 'Мідний Джаєн',
        Currencies.sp => 'Срібний Чонсін',
        Currencies.gp => 'Золотий Сончон',
        Currencies.pp => 'Платиновий Сін',
      };

  String get YagyeTanShort => switch (this) {
        Currencies.cp => 'Джаєн',
        Currencies.sp => 'Чонсін',
        Currencies.gp => 'Сончон',
        Currencies.pp => 'Сін',
      };

  String get LongZhiGou => switch (this) {
        Currencies.cp => 'Мідний Тонг',
        Currencies.sp => 'Срібний Їнь',
        Currencies.gp => 'Золотий Джинці',
        Currencies.pp => 'Платиновий Бо',
      };

  String get LongZhiGouShort => switch (this) {
        Currencies.cp => 'Тонг',
        Currencies.sp => 'Їнь',
        Currencies.gp => 'Джинці',
        Currencies.pp => 'Бо',
      };

  String get Yarnagil => switch (this) {
        Currencies.cp => 'Мідний Ферд',
        Currencies.sp => 'Срібний Селвір',
        Currencies.gp => 'Золотий Йорміл',
        Currencies.pp => 'Платиновий Хелґйорт',
      };

  String get YarnagilShort => switch (this) {
        Currencies.cp => 'Ферд',
        Currencies.sp => 'Селвір',
        Currencies.gp => 'Йорміл',
        Currencies.pp => 'Хелґйорт',
      };

  String get Dwarven => switch (this) {
        Currencies.cp => 'Мідний Торг',
        Currencies.sp => 'Срібний Рунел',
        Currencies.gp => 'Золотий Світґар',
        Currencies.pp => 'Платиновий Боґрад',
      };

  String get DwarvenShort => switch (this) {
        Currencies.cp => 'Торг',
        Currencies.sp => 'Рунел',
        Currencies.gp => 'Світґар',
        Currencies.pp => 'Боґрад',
      };

  String get Psavek => switch (this) {
        Currencies.cp => 'Мідний Сетем',
        Currencies.sp => 'Срібний Тахем',
        Currencies.gp => 'Золотий Уам\'са',
        Currencies.pp => 'Платиновий Іретд-жа',
      };

  String get PsavekShort => switch (this) {
        Currencies.cp => 'Сетем',
        Currencies.sp => 'Тахем',
        Currencies.gp => 'Уам\'са',
        Currencies.pp => 'Іретд-жа',
      };
}
