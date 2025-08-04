import 'package:phlegeton_character_finance_manager/core/countries/currencies.dart';

enum Countries {
  archaeos,
  asteristema,
  tenemain,
  yarnagil,
  psavek,
  yagyeTan,
  kragafor,
  durgadoz,
  nurganor,
  tirigasots,
  karanor,
  minargar,
  longZhiGou
}

extension CountryNames on Countries {
  String get name => switch (this) {
        Countries.archaeos => 'Археос',
        Countries.asteristema => 'Астерістема',
        Countries.tenemain => 'Тенемайн',
        Countries.yarnagil => 'Ярнагіль',
        Countries.psavek => 'Псавек',
        Countries.yagyeTan => 'Яґ\'є Тан',
        Countries.kragafor => 'Краґафор',
        Countries.durgadoz => 'Дурґадоз',
        Countries.nurganor => 'Нурґанор',
        Countries.tirigasots => 'Тіріґасоц',
        Countries.karanor => 'Каранор',
        Countries.minargar => 'Мінарґар',
        Countries.longZhiGou => 'Лон Джи Гоу',
      };
}

enum Regions {
  archaeos,
  asteristema,
  tenemain,
  tribesOfGiants,
  psavek,
  yagyeTan,
  dwarvenKingdoms,
  longZhiGou,
}

extension RegionsNames on Regions {
  String get stringValue => switch (this) {
        Regions.archaeos => 'Археос',
        Regions.asteristema => 'Астаерістема',
        Regions.tenemain => 'Тенемайн',
        Regions.tribesOfGiants => 'Країни Велетнів',
        Regions.psavek => 'Псавек',
        Regions.yagyeTan => 'Яґ\'єтан',
        Regions.dwarvenKingdoms => 'Дворфські Держави',
        Regions.longZhiGou => 'Лонг Джи Гоу',
      };

  String getCurrencyNamesFor(Currencies currency) => switch (this) {
        Regions.archaeos => currency.Archaeos,
        Regions.asteristema => currency.Asteristema,
        Regions.tenemain => currency.Tenemain,
        Regions.tribesOfGiants => currency.Yarnagil,
        Regions.psavek => currency.Psavek,
        Regions.yagyeTan => currency.YagyeTan,
        Regions.dwarvenKingdoms => currency.Dwarven,
        Regions.longZhiGou => currency.LongZhiGou,
      };
}

extension GetRegionsFromCountry on Countries {
  Regions get region => switch (this) {
        Countries.archaeos => Regions.archaeos,
        Countries.asteristema => Regions.asteristema,
        Countries.tenemain => Regions.tenemain,
        Countries.yarnagil => Regions.tribesOfGiants,
        Countries.psavek => Regions.psavek,
        Countries.yagyeTan => Regions.yagyeTan,
        Countries.kragafor => Regions.dwarvenKingdoms,
        Countries.durgadoz => Regions.dwarvenKingdoms,
        Countries.nurganor => Regions.dwarvenKingdoms,
        Countries.tirigasots => Regions.dwarvenKingdoms,
        Countries.karanor => Regions.dwarvenKingdoms,
        Countries.minargar => Regions.dwarvenKingdoms,
        Countries.longZhiGou => Regions.longZhiGou,
      };

  String currencyProperNames(Currencies currencies) {
    switch (this) {
      case Countries.archaeos:
        return currencies.Archaeos;
      case Countries.asteristema:
        return currencies.Asteristema;
      case Countries.tenemain:
        return currencies.Tenemain;
      case Countries.yarnagil:
        return currencies.Yarnagil;
      case Countries.psavek:
        return currencies.Psavek;
      case Countries.yagyeTan:
        return currencies.YagyeTan;
      case Countries.kragafor:
      case Countries.durgadoz:
      case Countries.nurganor:
      case Countries.tirigasots:
      case Countries.karanor:
      case Countries.minargar:
        return currencies.Dwarven;
      case Countries.longZhiGou:
        return currencies.LongZhiGou;
    }
  }
}
