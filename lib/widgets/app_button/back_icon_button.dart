import 'package:booking_app/ui/themes/theme_button.dart';
import 'package:booking_app/ui/themes/theme_palette.dart';
import 'package:booking_app/ui/themes/theme_shadow.dart';
import 'package:flutter/material.dart';

class BackIconButton extends StatelessWidget {
  const BackIconButton({super.key, required this.onTap, this.withBg = false});

  final Function() onTap;
  final bool withBg;

  @override
  Widget build(BuildContext context) {
    final double size = withBg ? 32 : 16;

    return Container(
      width: size,
      height: size,
      padding: withBg ? const EdgeInsets.all(0) : const EdgeInsets.all(12),
      decoration: withBg ? BoxDecoration(
        shape: BoxShape.circle,
        color: colorScheme(context).surface,
        boxShadow: [ThemeShade.shadeSoft(context)]
      ) : null,
      child: IconButton(
        iconSize: 16,
        onPressed: onTap,
        style: ThemeButton.iconBtn(context),
        icon: const Icon(Icons.arrow_back_ios_new)
      ),
    );
  }
}