import 'package:booking_app/ui/themes/theme_palette.dart';
import 'package:flutter/material.dart';

Color colorType(String type) {
  switch(type) {
    case 'hotel':
      return ThemePalette.primaryMain;
    case 'homestay':
      return ThemePalette.secondaryMain;
    case 'workspace':
      return ThemePalette.tertiaryMain;
    default:
      return Colors.grey;
  }
}