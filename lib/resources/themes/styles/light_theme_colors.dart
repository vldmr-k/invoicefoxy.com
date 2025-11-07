import 'package:flutter/material.dart';
import 'package:invoicefoxy_all/bootstrap/helpers.dart';
import '/resources/themes/styles/color_styles.dart';

/* Light Theme Colors
|-------------------------------------------------------------------------- */

class LightThemeColors implements ColorStyles {
  // general
  @override
  Color get background => const Color(0xFFFFFFFF);

  @override
  Color get content => const Color(0xFF000000);
  @override
  Color get primaryAccent => const Color.fromARGB(255, 0, 0, 0);

  @override
  Color get surfaceBackground => Colors.white;
  @override
  Color get surfaceContent => Colors.black;

  // app bar
  @override
  Color get appBarBackground => const Color.fromARGB(255, 255, 255, 255);
  @override
  Color get appBarPrimaryContent => const Color.fromARGB(255, 0, 0, 0);

  // buttons
  @override
  Color get buttonBackground => const Color.fromARGB(255, 0, 0, 0);
  @override
  Color get buttonContent => Colors.white;

  @override
  Color get buttonSecondaryBackground => const Color(0xff151925);
  @override
  Color get buttonSecondaryContent => Colors.white.withAlpha((255.0 * 0.9).round());

  // bottom tab bar
  @override
  Color get bottomTabBarBackground => Colors.white;

  // bottom tab bar - icons
  @override
  Color get bottomTabBarIconSelected => ThemeColor.fromHex('#181834');
  @override
  Color get bottomTabBarIconUnselected => Colors.black45;

  // bottom tab bar - label
  @override
  Color get bottomTabBarLabelUnselected => Colors.black45;
  @override
  Color get bottomTabBarLabelSelected => Colors.black;

  // toast notification
  @override
  Color get toastNotificationBackground => Colors.white;

  //input

  @override
  Color get inputBackground => Colors.grey.shade200;
}
