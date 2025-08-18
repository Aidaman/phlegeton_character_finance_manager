import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phlegeton_character_finance_manager/features/character_purce/models/character.dart';
import 'package:phlegeton_character_finance_manager/features/character_purce/widgets/regional_purse_view.dart';

class CharacterFinancesCard extends StatelessWidget {
  final Character character;

  const CharacterFinancesCard({super.key, required this.character});

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
      child: Column(
        children: [
          Text(
            'Список Валют',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const Gap(8),
          Wrap(
            alignment: WrapAlignment.spaceEvenly,
            clipBehavior: Clip.antiAlias,
            direction: Axis.horizontal,
            runSpacing: 24,
            children: character.purse
                .map(
                  (purse) => RegionalPurseView(
                    regionalPurse: purse,
                    charId: character.id,
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
