import 'package:flutter/material.dart';
import 'package:booking_app/ui/themes/theme_palette.dart';
import 'package:booking_app/ui/themes/theme_radius.dart';

class ThemeButton {
  static BorderRadius buttonRadius = ThemeRadius.big;

  // Filled Button
  static ButtonStyle primary = FilledButton.styleFrom(
    backgroundColor: ThemePalette.primaryMain,
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: buttonRadius,
    ),
  );
  static ButtonStyle secondary = FilledButton.styleFrom(
    backgroundColor: ThemePalette.secondaryMain,
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: buttonRadius,
    ),
  );
  static ButtonStyle tertiary = FilledButton.styleFrom(
    backgroundColor: ThemePalette.tertiaryMain,
    foregroundColor: Colors.black,
    shape: RoundedRectangleBorder(
      borderRadius: buttonRadius,
    ),
  );

  static ButtonStyle white = FilledButton.styleFrom(
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
    shape: RoundedRectangleBorder(
      borderRadius: buttonRadius,
    ),
  );

  static ButtonStyle black = FilledButton.styleFrom(
    backgroundColor: Colors.black,
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: buttonRadius,
    ),
  );

  static ButtonStyle invert(BuildContext context) {
    return OutlinedButton.styleFrom(
      backgroundColor: Theme.of(context).colorScheme.onSurface,
      foregroundColor: Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: buttonRadius,
      ),
    );
  }

  static ButtonStyle invert2(BuildContext context) {
    return OutlinedButton.styleFrom(
      backgroundColor: Theme.of(context).colorScheme.surface.withValues(alpha: 0.75),
      foregroundColor: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.75),
      shape: RoundedRectangleBorder(
        borderRadius: buttonRadius,
      ),
    );
  }

  // Outlined Button
  static ButtonStyle outlinedPrimary(BuildContext context) {
    return OutlinedButton.styleFrom(
      side: BorderSide(
        color: ThemePalette.primaryMain,
      ),
      foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
      shape: RoundedRectangleBorder(
        borderRadius: buttonRadius,
      ),
    );
  }

  static ButtonStyle outlinedSecondary(BuildContext context) {
    return OutlinedButton.styleFrom(
      side: BorderSide(
        color: Theme.of(context).colorScheme.onSecondaryContainer,
      ),
      backgroundColor: Colors.transparent,
      foregroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
      shape: RoundedRectangleBorder(
        borderRadius: buttonRadius,
      ),
    );
  }

  static ButtonStyle outlinedTertiary(BuildContext context) {
    return OutlinedButton.styleFrom(
      side: BorderSide(
        color: ThemePalette.tertiaryMain
      ),
      foregroundColor: Theme.of(context).colorScheme.onTertiaryContainer,
      shape: RoundedRectangleBorder(
        borderRadius: buttonRadius,
      ),
    );
  }

  static ButtonStyle outlinedBlack() {
    return OutlinedButton.styleFrom(
      side: const BorderSide(
        color: Colors.black
      ),
      foregroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: buttonRadius,
      ),
    );
  }

  static ButtonStyle outlinedWhite() {
    return OutlinedButton.styleFrom(
      side: const BorderSide(
        color: Colors.white
      ),
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: buttonRadius,
      ),
    );
  }

  static ButtonStyle outlinedInvert(BuildContext context) {
    return OutlinedButton.styleFrom(
      side: BorderSide(
        color: Theme.of(context).colorScheme.onSurface
      ),
      foregroundColor: Theme.of(context).colorScheme.onSurface,
      shape: RoundedRectangleBorder(
        borderRadius: buttonRadius,
      ),
    );
  }

  static ButtonStyle outlinedInvert2(BuildContext context) {
    return OutlinedButton.styleFrom(
      side: BorderSide(
        color: Theme.of(context).colorScheme.surface
      ),
      foregroundColor: Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: buttonRadius,
      ),
    );
  }

  static ButtonStyle outlinedDefault(BuildContext context) {
    return OutlinedButton.styleFrom(
      side: BorderSide(
        color: Theme.of(context).colorScheme.outlineVariant
      ),
      foregroundColor: Theme.of(context).colorScheme.onSurface,
      shape: RoundedRectangleBorder(
        borderRadius: buttonRadius,
      ),
    );
  }

  // Tonal Button
  static ButtonStyle tonalPrimary(BuildContext context) {
    return FilledButton.styleFrom(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
      shape: RoundedRectangleBorder(
        borderRadius: buttonRadius,
      ),
    );
  }

  static ButtonStyle tonalSecondary(BuildContext context) {
    return FilledButton.styleFrom(
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      foregroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
      shape: RoundedRectangleBorder(
        borderRadius: buttonRadius,
      ),
    );
  }

  static ButtonStyle tonalTertiary(BuildContext context) {
    return FilledButton.styleFrom(
      backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
      foregroundColor: Theme.of(context).colorScheme.onTertiaryContainer,
      shape: RoundedRectangleBorder(
        borderRadius: buttonRadius,
      ),
    );
  }

  static ButtonStyle tonalDefault(BuildContext context) {
    return FilledButton.styleFrom(
      backgroundColor: Theme.of(context).colorScheme.outline.withValues(alpha: 0.75),
      foregroundColor: Theme.of(context).colorScheme.onSurface,
      shape: RoundedRectangleBorder(
        borderRadius: buttonRadius,
      ),
    );
  }

  // Text Button
  static ButtonStyle textPrimary(BuildContext context) {
    return TextButton.styleFrom(
      foregroundColor: ThemePalette.primaryMain,
      shape: RoundedRectangleBorder(
        borderRadius: buttonRadius,
      ),
    );
  }

  static ButtonStyle textSecondary(BuildContext context) {
    return TextButton.styleFrom(
      foregroundColor: ThemePalette.secondaryMain,
      shape: RoundedRectangleBorder(
        borderRadius: buttonRadius,
      ),
    );
  }

  static ButtonStyle textTertiary(BuildContext context) {
    return TextButton.styleFrom(
      foregroundColor: Theme.of(context).colorScheme.onSurface,
      shape: RoundedRectangleBorder(
        borderRadius: buttonRadius,
      ),
    );
  }

  // Button Size
  static ButtonStyle btnBig = TextButton.styleFrom(
    minimumSize: const Size(200, 50),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(150),
    ),
  );
  
  static ButtonStyle btnSmall = TextButton.styleFrom(
    minimumSize: const Size(50, 30),
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
  );

  // Icon Button with Background
  static ButtonStyle iconBtn(BuildContext context) {
    return IconButton.styleFrom(
      padding: const EdgeInsets.all(1),
      backgroundColor: Theme.of(context).colorScheme.surface,
      elevation: 3
    );
  }
}
