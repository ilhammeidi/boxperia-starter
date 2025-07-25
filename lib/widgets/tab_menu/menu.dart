import 'package:booking_app/ui/themes/theme_palette.dart';
import 'package:flutter/material.dart';
import 'package:booking_app/ui/themes/theme_radius.dart';
import 'package:booking_app/ui/themes/theme_shadow.dart';
import 'package:booking_app/ui/themes/theme_spacing.dart';
import 'package:booking_app/widgets/tab_menu/button_tab.dart';
import 'package:get/route_manager.dart';

class TabMenu extends StatelessWidget {
  const TabMenu({
    super.key,
    required this.onSelect,
    required this.current,
    required this.menus,
  });

  final Function(int) onSelect;
  final int current;
  final List<String> menus; 

  @override
  Widget build(BuildContext context) {
    final bool isDark = Get.isDarkMode;

    return Container(
      margin: EdgeInsets.all(spacingUnit(1)),
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      width: MediaQuery.of(context).size.width,
      height: 40,
      decoration: BoxDecoration(
        color: isDark ? colorScheme(context).outline : colorScheme(context).surface,
        boxShadow: [ThemeShade.shadeSoft(context)],
        borderRadius: ThemeRadius.medium,
        border: Border.all(
          width: 1,
          color: colorScheme(context).surfaceDim
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: menus.asMap().entries.map((entry) {
          String item = entry.value;
          int index = entry.key;

          return Expanded(
            flex: 1,
            child: ButtonTab(
              isSelected: current == index,
              text: item,
              onSelect: () => onSelect(index)
            ),
          );
        }).toList()
      ),
    );
  }
}