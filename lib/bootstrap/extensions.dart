import 'package:flutter/material.dart';
import 'package:invoicefoxy_all/app/models/company.dart';
import '/bootstrap/helpers.dart';
import '/resources/themes/styles/color_styles.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:invoicefoxy_all/config/keys.dart';

/// [Text] Extensions
extension NyText on Text {
  Text setColor(
      BuildContext context, Color Function(ColorStyles color) newColor,
      {String? themeId}) {
    return copyWith(
        style: TextStyle(
            color: newColor(ThemeColor.get(context, themeId: themeId))));
  }
}

/// [BuildContext] Extensions
extension NyApp on BuildContext {
  /// Get the current theme color
  ColorStyles get color => ThemeColor.get(this);
}

/// [TextStyle] Extensions
extension NyTextStyle on TextStyle {
  TextStyle? setColor(
      BuildContext context, Color Function(ColorStyles color) newColor,
      {String? themeId}) {
    return copyWith(color: newColor(ThemeColor.get(context, themeId: themeId)));
  }
}

extension NyColor on Color {
  Color get foxyColor => Color.fromARGB(255, 249, 115, 21);
}


extension ScreenSizeExtension on BuildContext {
  double get screenWidth => MediaQuery.sizeOf(this).width;
  double get screenHeight => MediaQuery.sizeOf(this).height;

  bool get isMobile => screenWidth < 600;

  bool get isTablet => screenWidth >= 600 && screenWidth < 1024;

  bool get isDesktop => screenWidth >= 1024;
}

extension CompanyContextExtension on BuildContext {
  void setCompany(Company company) {
    Keys.companySelected.saveJson(company, inBackpack: true);
  }

  Company getCompany() => Keys.companySelected.fromBackpack() as Company;
}
