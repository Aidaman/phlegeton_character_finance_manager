import 'package:phlegeton_character_finance_manager/core/countries/countries.dart';

typedef ExchangeRate = Map<Countries, double>;

extension CurrencyExchange on Countries {
  // Археоська валюта є аналогом Долара США в нашому світі
  // Ми відштовхуємсся від курсу валюти Археосу
  static const ExchangeRate exchangeRates = {
    Countries.archaeos: 1,
    Countries.asteristema: 1.5,
    Countries.tenemain: 1.5,
    Countries.yarnagil: 1.3,
    Countries.psavek: 2.5,
    Countries.yagyeTan: 1.2,
    Countries.kragafor: 2,
    Countries.durgadoz: 2.5,
    Countries.nurganor: 2.5,
    Countries.tirigasots: 2.5,
    Countries.karanor: 3,
    Countries.minargar: 3,
    Countries.longZhiGou: 1.4,
  };

  double convertionRateFor(Countries targetCountry, double baseAmount) {
    if (targetCountry == this) {
      return baseAmount;
    }

    final baseRate = exchangeRates[this];

    if (baseRate == null) {
      throw const FormatException(
        'Не можемо знайти обмінні дані для цієї країни',
      );
    }

    final targetRate = exchangeRates[targetCountry];

    if (targetRate == null) {
      throw const FormatException(
        'Не можемо знайти обмінні дані для цієї країни',
      );
    }

    if (this == Countries.archaeos) {
      return baseAmount / targetRate;
    }

    return (baseAmount / baseRate) * targetRate;
  }
}
