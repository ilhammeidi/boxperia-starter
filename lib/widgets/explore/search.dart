import 'package:booking_app/app/app_link.dart';
import 'package:booking_app/ui/themes/theme_breakpoints.dart';
import 'package:booking_app/ui/themes/theme_palette.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:booking_app/ui/themes/theme_radius.dart';
import 'package:booking_app/ui/themes/theme_spacing.dart';

class SearchExplore extends StatelessWidget {
  const SearchExplore({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colorScheme(context).surfaceContainerLowest
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          /// SEARCH BOX
          InkWell(
            onTap: () {
              Get.toNamed(AppLink.searchList);
            },
            child: Container(
              height: 50,
              margin: EdgeInsets.all(spacingUnit(1)),
              padding: EdgeInsets.all(spacingUnit(1)),
              width: double.infinity,
              constraints: BoxConstraints(
                maxWidth: ThemeSize.sm
              ),
              decoration: BoxDecoration(
                borderRadius: ThemeRadius.medium,
                color: colorScheme(context).outline 
              ),
              child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                const Icon(Icons.search),
                SizedBox(width: spacingUnit(1)),
                const Text('Search city, location, or any place')
              ])
            ),
          ),
        ]
      )
    );
  }
}