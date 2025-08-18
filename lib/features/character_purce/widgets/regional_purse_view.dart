import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:phlegeton_character_finance_manager/core/countries/countries.dart';
import 'package:phlegeton_character_finance_manager/features/character_purce/models/purse.dart';
import 'package:phlegeton_character_finance_manager/features/character_purce/services/character_service.dart';
import 'package:provider/provider.dart';

class RegionalPurseView extends StatefulWidget {
  final RegionalPurse regionalPurse;
  final String charId;

  const RegionalPurseView(
      {super.key, required this.regionalPurse, required this.charId});

  @override
  State<RegionalPurseView> createState() => _RegionalPurseViewState();
}

class _RegionalPurseViewState extends State<RegionalPurseView> {
  Timer? _debounce;

  _onSearchChanged(
    String query,
    CoinHolding coinHolding,
    CharacterService service,
  ) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();

    _debounce = Timer(
      const Duration(milliseconds: 512),
      () => service.updatePurse(
        widget.charId,
        RegionalPurse(
          region: widget.regionalPurse.region,
          holdings: widget.regionalPurse.holdings.map(
            (x) {
              if (x.currency == coinHolding.currency) {
                return CoinHolding(
                  currency: x.currency,
                  amount: int.parse(query),
                );
              }

              return x;
            },
          ).toList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final CharacterService characterService = context.watch<CharacterService>();

    return IntrinsicWidth(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 24,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.regionalPurse.region.stringValue,
              textAlign: TextAlign.center,
            ),
            const Gap(12),
            ...widget.regionalPurse.holdings.map(
              (CoinHolding holdings) {
                final TextEditingController textEditingController =
                    TextEditingController(text: holdings.amount.toString());

                return Row(
                  children: [
                    IntrinsicWidth(
                      child: TextField(
                        controller: textEditingController,
                        onChanged: (value) =>
                            _onSearchChanged(value, holdings, characterService),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                    Text(
                      widget.regionalPurse.region
                          .getShortCurrencyNamesFor(holdings.currency),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }
}
