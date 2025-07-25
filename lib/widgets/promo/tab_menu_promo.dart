import 'package:booking_app/ui/themes/theme_palette.dart';
import 'package:booking_app/ui/themes/theme_spacing.dart';
import 'package:flutter/material.dart';
import 'package:booking_app/widgets/tab_menu/menu.dart';

class TabMenuPromo extends StatelessWidget {
  const TabMenuPromo({super.key, required this.onSelect, required this.current});

  final Function(int) onSelect;
  final int current;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: spacingUnit(1)),
      color: colorScheme(context).surfaceContainerLowest,
      child: TabMenu(
        onSelect: onSelect,
        current: current,
        menus: const ['Promos', 'Vouchers']
      )
    );
  }
}