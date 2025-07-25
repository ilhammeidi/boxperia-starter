import 'package:booking_app/app/app_link.dart';
import 'package:booking_app/ui/themes/theme_palette.dart';
import 'package:booking_app/ui/themes/theme_spacing.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

List<Widget> homeActionGroup(BuildContext context, bool isFixed) {
  return [
    Badge.count(
      backgroundColor: Colors.red,
      count: 3,
      offset: const Offset(0, -1),
      child: iconBtn(context, Icons.notifications, isFixed, () {
          Get.toNamed(AppLink.notification);
        },
      ),
    ),
    iconBtn(context, Icons.help, isFixed, () {
        Get.toNamed(AppLink.faq);
      },
    )
  ];
}

Widget iconBtn(BuildContext context, IconData icon, bool isFixed, void Function() onTap) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: spacingUnit(1)),
    child: Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(32)),
        color: isFixed ? colorScheme(context).outline : colorScheme(context).surface
      ),
      child: IconButton(
        onPressed: onTap,
        icon: Icon(icon, size: 24, color: colorScheme(context).onSurface,),
      ),
    ),
  );
}