import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:booking_app/ui/themes/theme_palette.dart';

const String appFont = 'Ubuntu';

class ThemeText {
  static const TextStyle title = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    fontFamily: appFont
  );
  static const TextStyle title2 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    fontFamily: appFont
  );
  static const TextStyle subtitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    fontFamily: appFont
  );
  static const TextStyle subtitle2 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    fontFamily: appFont
  );
  static const TextStyle headline = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontFamily: appFont
  );
  static const TextStyle paragraph = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: appFont
  );
  static const TextStyle paragraphBold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    fontFamily: appFont
  );
  static const TextStyle caption = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    fontFamily: appFont
  );
}

class ThemeTextColor {
  static final bool _isDark = Get.isDarkMode;

  static TextStyle primary = TextStyle(
    color: ThemePalette.primaryMain
  );
  static TextStyle secondary = TextStyle(
    color: ThemePalette.secondaryMain
  );
  static TextStyle tertiary = TextStyle(
    color: ThemePalette.tertiaryMain
  );
  static TextStyle tonalPrimary(BuildContext context) {
    return TextStyle(
      color: _isDark ? ThemePalette.primaryLight : ThemePalette.primaryDark,
    );
  }
  static TextStyle tonalSecondary(BuildContext context) {
    return TextStyle(
      color: _isDark ? ThemePalette.secondaryLight : ThemePalette.secondaryDark,
    );
  }
  static TextStyle tonalTertiary(BuildContext context) {
    return TextStyle(
      color: _isDark ? ThemePalette.tertiaryLight : ThemePalette.tertiaryDark,
    );
  }
}
