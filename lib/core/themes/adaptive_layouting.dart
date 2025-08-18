import 'package:flutter/material.dart';

enum ScreenSizes {
  mobile,
  mobileLarge,
  desktop,
  desktopLarge,
}

extension MediaQuerrySizes on BuildContext {
  double get _screenWidth => MediaQuery.of(this).size.width;

  bool get isMobile => _screenWidth < 430;
  bool get isLargeMobile => _screenWidth > 430 && _screenWidth < 1024;

  bool get isDesktop => _screenWidth > 1024 && _screenWidth < 1440;
  bool get isLargedesktop => _screenWidth > 1440 && _screenWidth < 4096;

  ScreenSizes get screenSize {
    if (isMobile) return ScreenSizes.mobile;

    if (isLargeMobile) return ScreenSizes.mobileLarge;

    if (isDesktop) return ScreenSizes.desktop;

    return ScreenSizes.desktopLarge;
  }
}
