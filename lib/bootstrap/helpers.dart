import 'package:flutter/material.dart';
import '/resources/themes/styles/color_styles.dart';
import 'package:nylo_framework/nylo_framework.dart';

/* Helpers
|--------------------------------------------------------------------------
| Add your helper methods here
|-------------------------------------------------------------------------- */

/// helper to find correct color from the [context].
class ThemeColor {
  static ColorStyles get(BuildContext context, {String? themeId}) =>
      nyColorStyle<ColorStyles>(context, themeId: themeId);

  static Color fromHex(String hexColor) => nyHexColor(hexColor);
}


class Pagination {
  static (int from, int to) range(int page, int limit) =>
      ((page - 1) * limit, page * limit - 1);
}

class SortOption {
  final String column;
  final bool ascending;
  const SortOption(this.column, this.ascending);
}