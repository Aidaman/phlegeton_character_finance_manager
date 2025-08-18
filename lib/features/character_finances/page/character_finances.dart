import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phlegeton_character_finance_manager/core/json.typedef.dart';
import 'package:phlegeton_character_finance_manager/features/character_finances/widgets/character_finances_card.dart';
import 'package:phlegeton_character_finance_manager/features/character_finances/widgets/currencies_exchange_card.dart';
import 'package:phlegeton_character_finance_manager/features/character_finances/widgets/currencies_names_card.dart';
import 'package:phlegeton_character_finance_manager/features/character_purce/models/character.dart';
import 'package:phlegeton_character_finance_manager/features/character_purce/services/character_io_service.dart';
import 'package:phlegeton_character_finance_manager/features/character_purce/services/character_service.dart';
import 'package:phlegeton_character_finance_manager/features/themed_page_background/themed_page_background.dart';
import 'package:provider/provider.dart';

class CharacterFinances extends StatefulWidget {
  const CharacterFinances({super.key});

  @override
  State<CharacterFinances> createState() => _CharacterFinancesState();
}

class _CharacterFinancesState extends State<CharacterFinances> {
  @override
  Widget build(BuildContext context) {
    final Json? args = ModalRoute.of(context)?.settings.arguments as Json?;
    if (args == null) {
      throw Exception(
        'To access this page Route arguments should be present, but they are not',
      );
    }

    final String? id = args['character_id'];
    if (id == null) {
      throw Exception('No valid Id found in the Route argumets');
    }

    final Character char = context
        .read<CharacterService>()
        .characters
        .firstWhere((x) => x.id == id);

    return ThemedPageBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(char.name),
          actions: [
            IconButton(
              onPressed: () {
                characterIoService.saveCharacter(char);
              },
              icon: const Icon(Icons.save),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              child: Column(
                children: [
                  const Row(
                    children: [
                      Expanded(
                        child: CurrenciesNamesCard(),
                      ),
                    ],
                  ),
                  const Gap(32),
                  const Row(
                    children: [
                      Expanded(
                        child: CurrencyExchangeCard(),
                      ),
                    ],
                  ),
                  const Gap(32),
                  Row(
                    children: [
                      Expanded(
                        child: CharacterFinancesCard(character: char),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
