import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phlegeton_character_finance_manager/core/countries/countries.dart';
import 'package:phlegeton_character_finance_manager/core/countries/currencies.dart';
import 'package:phlegeton_character_finance_manager/core/countries/currency_exchange.dart';

class CurrencyExchangeCard extends StatefulWidget {
  const CurrencyExchangeCard({super.key});

  @override
  State<CurrencyExchangeCard> createState() => _CurrencyExchangeCardState();
}

class _CurrencyExchangeCardState extends State<CurrencyExchangeCard> {
  Countries? baseState;
  Currencies? baseStateCurrency;
  double baseStateAmount = 0;

  Countries? targetState;

  final TextEditingController _textEditingController =
      TextEditingController(text: '0');

  void _updateExchangeRate() {
    setState(() {
      _textEditingController.text = baseState!
          .convertionRateFor(targetState!, baseStateAmount)
          .toStringAsFixed(2);
    });
  }

  @override
  void initState() {
    super.initState();

    baseState = Countries.values.first;
    baseStateCurrency = Currencies.gp;

    targetState = Countries.values.first;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 32,
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
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: DropdownButton<Countries>(
                        isExpanded: true,
                        value: baseState,
                        iconSize: 0.0,
                        items: Countries.values
                            .map(
                              (e) => DropdownMenuItem<Countries>(
                                value: e,
                                child: Center(child: Text(e.name)),
                              ),
                            )
                            .toList(),
                        onChanged: (value) => setState(() {
                          if (value == null) {
                            return;
                          }

                          baseState = value;
                          _updateExchangeRate();
                        }),
                      ),
                    ),
                  ],
                ),
                TextField(
                  textAlign: TextAlign.center,
                  onChanged: (value) => setState(() {
                    if (double.tryParse(value) == null) {
                      return;
                    }

                    baseStateAmount = double.parse(value);
                    _updateExchangeRate();
                  }),
                ),
              ],
            ),
          ),
          const Gap(32),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: DropdownButton<Countries>(
                        isExpanded: true,
                        value: targetState,
                        iconSize: 0.0,
                        items: Countries.values
                            .map(
                              (e) => DropdownMenuItem<Countries>(
                                value: e,
                                child: Center(child: Text(e.name)),
                              ),
                            )
                            .toList(),
                        onChanged: (value) => setState(() {
                          if (value == null) {
                            return;
                          }

                          targetState = value;
                          _updateExchangeRate();
                        }),
                      ),
                    ),
                  ],
                ),
                if (baseState != null && targetState != null)
                  TextField(
                    readOnly: true,
                    textAlign: TextAlign.center,
                    controller: _textEditingController,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
