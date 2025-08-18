import 'package:flutter/material.dart';
import 'package:phlegeton_character_finance_manager/core/themes/themes.dart';
import 'package:phlegeton_character_finance_manager/core/themes/themes_provider.dart';
import 'package:provider/provider.dart';

class SelectThemeDialog extends StatelessWidget {
  const SelectThemeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Container()),
          Text(
            'Теми Програми',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Expanded(child: Container()),
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close),
          )
        ],
      ),
      titleTextStyle: Theme.of(context).textTheme.labelSmall,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: Themes.values
            .map(
              (e) => MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    context.read<ThemesProvider>().setTheme(e);
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.grey[700]!, width: 1),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(
                                  e.assetIconPath,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(child: Text(e.name)),
                      ],
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
