import 'package:phlegeton_character_finance_manager/core/countries/countries.dart';

enum Currencies { cp, sp, gp, pp }

extension CurrencyProperNames on Currencies {
  String get Archaeos => switch (this) {
        Currencies.cp => 'Мідний Кермій',
        Currencies.sp => 'Срібний Обол',
        Currencies.gp => 'Золота Драхма',
        Currencies.pp => 'Платиновий Талан',
      };

  String get Asteristema => switch (this) {
        Currencies.cp => 'Мідний Мендар',
        Currencies.sp => 'Срібний Офір',
        Currencies.gp => 'Золотий Салміран',
        Currencies.pp => 'Платиновий Беліос / Массар',
      };

  String get Tenemain => switch (this) {
        Currencies.cp => 'Мідний Мендар',
        Currencies.sp => 'Срібний Офір',
        Currencies.gp => 'Золотий Лунор',
        Currencies.pp => 'Платиновий Арель / Массар',
      };

  String get YagyeTan => switch (this) {
        Currencies.cp => 'Мідний Джаєн',
        Currencies.sp => 'Срібний Чонсін',
        Currencies.gp => 'Золотий Сончон',
        Currencies.pp => 'Платиновий Сін',
      };

  String get LongZhiGou => switch (this) {
        Currencies.cp => 'Мідний Тонг',
        Currencies.sp => 'Срібний Їнь',
        Currencies.gp => 'Золотий Джинці',
        Currencies.pp => 'Платиновий Бо',
      };

  String get Yarnagil => switch (this) {
        Currencies.cp => 'Мідний Ферд',
        Currencies.sp => 'Срібний Селвір',
        Currencies.gp => 'Золотий Йорміл',
        Currencies.pp => 'Платиновий Хелґйорт',
      };

  String get Dwarven => switch (this) {
        Currencies.cp => 'Мідний Торг',
        Currencies.sp => 'Срібний Рунел',
        Currencies.gp => 'Золотий Світґар',
        Currencies.pp => 'Платиновий Боґрад',
      };

  String get Psavek => switch (this) {
        Currencies.cp => 'Мідний Сетем',
        Currencies.sp => 'Срібний Тахем',
        Currencies.gp => 'Золотий Уам\'са',
        Currencies.pp => 'Платиновий Іретд-жа',
      };
}
