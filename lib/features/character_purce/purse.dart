import 'package:phlegeton_character_finance_manager/core/countries/countries.dart';
import 'package:phlegeton_character_finance_manager/core/countries/currencies.dart';

class CoinHolding {
  final Currencies _currency;
  Currencies get currency => _currency;

  int amount;

  CoinHolding({required Currencies currency, this.amount = 0})
      : _currency = currency;
}

class RegionalPurse {
  final Regions _region;
  Regions get region => _region;

  final List<CoinHolding> _holdings;
  List<CoinHolding> get holdings => _holdings;

  RegionalPurse({required Regions region, required List<CoinHolding> holdings})
      : _holdings = holdings,
        _region = region;

  int getCoinAmount(Currencies currency) {
    final holding = holdings.firstWhere(
      (h) => h.currency == currency,
      orElse: () => CoinHolding(currency: currency),
    );

    return holding.amount;
  }

  void addCoins(Currencies currency, int amount) {
    final holding = holdings.firstWhere(
      (h) => h.currency == currency,
      orElse: () => CoinHolding(currency: currency),
    );

    holding.amount += amount;
  }

  void removeCoins(Currencies currency, int amount) {
    if (amount < 0) {
      throw Exception('Amount must be positive');
    }

    final holding = holdings.firstWhere(
      (h) => h.currency == currency,
      orElse: () => CoinHolding(currency: currency),
    );

    if (holding.amount < amount) {
      throw Exception('Insufficient funds to remove');
    }

    holding.amount -= amount;
  }
}
