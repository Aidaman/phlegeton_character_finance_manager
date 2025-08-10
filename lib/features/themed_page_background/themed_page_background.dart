import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:phlegeton_character_finance_manager/core/themes/themes.dart';
import 'package:phlegeton_character_finance_manager/core/themes/themes_provider.dart';
import 'package:provider/provider.dart';

class ThemedPageBackground extends StatelessWidget {
  final Widget child;
  const ThemedPageBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          child: SvgPicture.asset(
            context.watch<ThemesProvider>().currentTheme.assetBackgroundPath,
            // alignment: Alignment.center,
            fit: BoxFit.cover,
            alignment: Alignment.center,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        Container(child: child),
      ],
    );
  }
}
