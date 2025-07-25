import 'package:flutter/material.dart';
import 'package:booking_app/ui/themes/theme_text.dart';
import 'package:booking_app/ui/themes/theme_palette.dart';

ThemeData lightColorScheme = ThemeData(
  fontFamily: appFont,
  primaryColor: ThemePalette.primaryMain,
  primaryColorDark: ThemePalette.primaryDark,
  primaryColorLight: ThemePalette.primaryLight,
  brightness: Brightness.light,
  inputDecorationTheme: InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: Colors.grey[400]!),
    ),
  ),
  colorScheme: ColorScheme.light(
    primary: ThemePalette.primaryMain,
    onPrimary: Colors.white,
    primaryContainer: ThemePalette.primaryLight,
    onPrimaryContainer: ThemePalette.primaryDark,
    secondary: ThemePalette.secondaryMain,
    onSecondary: Colors.white,
    secondaryContainer: ThemePalette.secondaryLight,
    onSecondaryContainer: ThemePalette.secondaryDark,
    tertiary: ThemePalette.tertiaryMain,
    onTertiary: Colors.white,
    tertiaryContainer: ThemePalette.tertiaryLight,
    onTertiaryContainer: ThemePalette.tertiaryDark,
    surface: ThemePalette.paperLight,
    onSurface: Colors.black,
    surfaceDim: const Color.fromRGBO(240, 240, 240, 1),
    surfaceContainerHighest: ThemePalette.defaultLight,
    surfaceContainerLowest: ThemePalette.paperLight,
    onSurfaceVariant: const Color.fromRGBO(117, 117, 117, 1),
    error: Colors.red,
    onError: Colors.white,
    brightness: Brightness.light,
    outline: const Color.fromARGB(255, 226, 235, 235),
    outlineVariant: const Color.fromARGB(255, 198, 208, 208),
    shadow: Colors.black.withValues(alpha: 0.05),
  ),
);

ThemeData darkColorScheme = ThemeData(
  fontFamily: appFont,
  primaryColor: ThemePalette.primaryMain,
  primaryColorDark: ThemePalette.primaryDark,
  primaryColorLight: ThemePalette.primaryLight,
  brightness: Brightness.dark,
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: Colors.grey[700]!)
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey[500]!),
    ),
  ),
  scaffoldBackgroundColor: ThemePalette.defaultDark,
  colorScheme: ColorScheme.dark(
    primary: ThemePalette.primaryMain,
    onPrimary: Colors.white,
    primaryContainer: ThemePalette.primaryDark,
    onPrimaryContainer: ThemePalette.primaryLight,
    secondary: ThemePalette.secondaryMain,
    onSecondary: Colors.white,
    secondaryContainer: ThemePalette.secondaryDark,
    onSecondaryContainer: ThemePalette.secondaryLight,
    tertiary: ThemePalette.tertiaryMain,
    onTertiary: Colors.white,
    tertiaryContainer: ThemePalette.tertiaryDark,
    onTertiaryContainer: ThemePalette.tertiaryLight,
    surface: ThemePalette.paperDark,
    onSurface: Colors.white,
    surfaceDim: const Color.fromRGBO(50, 50, 50, 1),
    surfaceContainerHighest: ThemePalette.paperDark,
    surfaceContainerLowest: ThemePalette.defaultDark,
    onSurfaceVariant: Colors.grey.shade300,
    error: Colors.red,
    onError: Colors.white,
    brightness: Brightness.dark,
    outline: const Color.fromARGB(255, 53, 69, 69),
    outlineVariant: const Color.fromARGB(255, 107, 135, 135),
    shadow: Colors.black.withValues(alpha: 0.2)
  )
);