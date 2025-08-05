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
        SvgPicture.asset(
          context.watch<ThemesProvider>().currentTheme.assetBackgroundPath,
          // alignment: Alignment.center,
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          fit: BoxFit.fill,
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 16.0,
          ),
          child: child,
        ),
      ],
    );
  }
}
