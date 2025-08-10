import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phlegeton_character_finance_manager/core/countries/countries.dart';
import 'package:phlegeton_character_finance_manager/core/countries/currencies.dart';

class CurrenciesNamesCard extends StatefulWidget {
  const CurrenciesNamesCard({super.key});

  @override
  State<CurrenciesNamesCard> createState() => _CurrenciesNamesCardState();
}

class _CurrenciesNamesCardState extends State<CurrenciesNamesCard> {
  Regions? _selectedRegion;

  @override
  void initState() {
    super.initState();
    _selectedRegion = Regions.values.first;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 8,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.white.withOpacity(0.35), width: 1),
        gradient: const LinearGradient(
          colors: [
            Color.fromRGBO(0, 0, 0, 0.4),
            Color.fromRGBO(0, 0, 0, 0.1),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          Text(
            'Список Валют',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const Gap(8),
          Text(
            'Оберіть валюту держави',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const Gap(16),
          DropdownButton<Regions>(
            isExpanded: true,
            value: _selectedRegion,
            iconSize: 0.0,
            items: Regions.values
                .map(
                  (e) => DropdownMenuItem<Regions>(
                    value: e,
                    child: Center(child: Text(e.stringValue)),
                  ),
                )
                .toList(),
            onChanged: (Regions? value) => setState(() {
              if (value == null) {
                return;
              }

              _selectedRegion = value;
            }),
          ),
          if (_selectedRegion != null) const Gap(16),
          if (_selectedRegion != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: Currencies.values
                  .map(
                    (e) => Expanded(
                      child: Text(
                        _selectedRegion!.getCurrencyNamesFor(e),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                  .toList(),
            ),
        ],
      ),
    );
  }
}
