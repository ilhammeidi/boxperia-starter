import 'package:booking_app/app/app_link.dart';
import 'package:booking_app/ui/themes/theme_palette.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:booking_app/ui/themes/theme_radius.dart';
import 'package:booking_app/ui/themes/theme_shadow.dart';
import 'package:booking_app/ui/themes/theme_spacing.dart';

class HeaderExplore extends StatelessWidget {
  const HeaderExplore({super.key});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle iconBtn = IconButton.styleFrom(
      padding: const EdgeInsets.all(0),
      backgroundColor: colorScheme(context).surface,
      shadowColor: Colors.grey.withValues(alpha: 0.5),
      elevation: 3
    );

    return Container(
      height: 60,
      width: double.infinity,
      padding: EdgeInsets.all(spacingUnit(1)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// GIFT BUTTON
          GestureDetector(
            onTap: () {
              Get.toNamed(AppLink.reward);
            },
            child: Container(
              width: 180,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: colorScheme(context).surface,
                borderRadius: ThemeRadius.medium,
                boxShadow: [ThemeShade.shadeSoft(context)],
              ),
              child: const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Icon(Icons.motion_photos_on, color: Colors.orange),
                SizedBox(width: 2,),
                Text('Claim Your Coin Today', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 11),),
              ]),
            ),
          ),
          /// ACTIONS HEADER BUTTON
          Row(children: [
            SizedBox(
              width: 32,
              height: 32,
              child: IconButton(
                onPressed: () {
                  Get.toNamed(AppLink.notification);
                },
                style: iconBtn,
                icon: Badge.count(
                  backgroundColor: Colors.red,
                  count: 10,
                  child: Icon(Icons.notifications, size: 24, color: colorScheme(context).onSurface),
                )
              ),
            ),
            SizedBox(width: spacingUnit(2)),
            SizedBox(
              width: 32,
              height: 32,
              child: IconButton(
                onPressed: () {
                  Get.toNamed(AppLink.faq);
                },
                style: iconBtn,
                icon: Icon(Icons.help, size: 24, color: colorScheme(context).onSurface)
              ),
            )
          ])
        ],
      ),
    );
  }
}