import 'package:booking_app/ui/themes/theme_palette.dart';
import 'package:flutter/material.dart';
import 'package:booking_app/ui/themes/theme_radius.dart';
import 'package:booking_app/ui/themes/theme_text.dart';

class ButtonTab extends StatelessWidget {
  const ButtonTab({super.key, required this.isSelected, required this.text, required this.onSelect});

  final bool isSelected;
  final String text;
  final Function() onSelect;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {
        onSelect();
      },
      style: FilledButton.styleFrom(
        backgroundColor: isSelected ? Colors.black : Colors.transparent,
        foregroundColor: isSelected ? Colors.white : colorScheme(context).onSurface,
        shape: RoundedRectangleBorder(
          borderRadius: ThemeRadius.medium
        ),
        padding: EdgeInsets.symmetric(horizontal: 0)
      ),
      child: Text(text, style: ThemeText.paragraph.copyWith(fontWeight: FontWeight.bold),),
    );
  }
}