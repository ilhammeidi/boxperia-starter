import 'package:booking_app/app/app_link.dart';
import 'package:booking_app/ui/themes/theme_palette.dart';
import 'package:booking_app/utils/custom_tooltip.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:booking_app/constants/app_const.dart';
import 'package:booking_app/widgets/action_header/home_action_group.dart';
import 'package:booking_app/ui/themes/theme_radius.dart';
import 'package:booking_app/ui/themes/theme_spacing.dart';
import 'package:booking_app/ui/themes/theme_text.dart';
import 'package:overlay_tooltip/overlay_tooltip.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key, this.isFixed = false});

  final bool isFixed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 60,
      scrolledUnderElevation: 0.0,
      forceMaterialTransparency: true,
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      titleSpacing: spacingUnit(1),
      flexibleSpace: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        color: isFixed ? colorScheme(context).surface : Colors.transparent,
      ),
      title: GestureDetector(
        onTap: () {
          Get.toNamed(AppLink.profile);
        },
        child: Row(children: [
          /// AVATAR AND USER PROFILE
          CircleAvatar(
            radius: 24,
            backgroundImage: NetworkImage(userDummy.avatar),
          ),
          SizedBox(width: spacingUnit(1)),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(userDummy.name, style: ThemeText.subtitle.copyWith(color: isFixed ? colorScheme(context).onSurface : Colors.white)),
            Container(
              margin: const EdgeInsets.only(top: 4),
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 4),
              decoration: BoxDecoration(
                borderRadius: ThemeRadius.small,
                color: colorScheme(context).surface.withValues(alpha: 0.8),
              ),
              child: Row(
                children: [
                  const Icon(Icons.location_on, size: 12, color: Colors.red),
                  const SizedBox(width: 2,),
                  Text(
                    'Tokyo • ${userDummy.country}',
                    style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500)
                  ),
                ],
              )
            )
          ])
        ]),
      ),

      /// ACTION BUTTONS
      actions: [
        OverlayTooltipItem(
          displayIndex: 2,
          tooltip: (controller) => Padding(
            padding: const EdgeInsets.only(right: 15),
            child: MTooltip(title: 'Check messages, the best deals, or notification here.', controller: controller),
          ),
          child: Badge.count(
            backgroundColor: Colors.red,
            count: 3,
            offset: const Offset(0, -1),
            child: iconBtn(context, Icons.notifications, isFixed, () {
                Get.toNamed(AppLink.notification);
              },
            ),
          ),
        ),
        iconBtn(context, Icons.help, isFixed, () {
            Get.toNamed(AppLink.faq);
          },
        )
      ],
    );
  }
}