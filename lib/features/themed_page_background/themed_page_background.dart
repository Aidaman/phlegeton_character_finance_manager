import 'package:flutter/material.dart';
import 'package:phlegeton_character_finance_manager/core/themes/themes.dart';
import 'package:phlegeton_character_finance_manager/core/themes/themes_provider.dart';
import 'package:provider/provider.dart';

class ThemedPageBackground extends StatelessWidget {
  final Widget child;
  const ThemedPageBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    // return Stack(
    //   children: [
    //     Align(
    //       child: Image.asset(
    //         context
    //             .watch<ThemesProvider>()
    //             .currentTheme
    //             .assetBackgroundThemePath,
    //         // alignment: Alignment.center,
    //         fit: BoxFit.cover,
    //         alignment: Alignment.center,
    //         width: double.infinity,
    //         height: double.infinity,
    //       ),
    //     ),
    //     Container(child: child),
    //   ],
    // );
    final themesProvider = context.watch<ThemesProvider>();

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            themesProvider.currentTheme.assetBackgroundThemePath +
                themesProvider.currentTheme.getBackgroundImage(context),
          ),
          fit: BoxFit.cover,
          alignment: Alignment.center,
        ),
      ),
      child: child,
    );
  }
}
