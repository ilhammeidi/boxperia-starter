import 'package:booking_app/app/app_link.dart';
import 'package:booking_app/ui/themes/theme_radius.dart';
import 'package:booking_app/ui/themes/theme_text.dart';
import 'package:booking_app/utils/custom_tooltip.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:booking_app/ui/themes/theme_palette.dart';
import 'package:overlay_tooltip/overlay_tooltip.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class BottomNavMenu extends StatelessWidget {
  const BottomNavMenu({super.key});

  @override
  Widget build(BuildContext context) {
    String currentRoute = Get.currentRoute;
    
    return BottomAppBar(
      elevation: 20,
      shadowColor: Colors.black,
      height: 55,
      color: Theme.of(context).colorScheme.surface,
      padding: const EdgeInsets.all(0),
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        MenuItem(
          title: 'Home',
          icon: Icons.home_work_outlined, 
          isActive: currentRoute == AppLink.home,
          onTap: () {
            Get.toNamed(AppLink.home);
          }
        ),
        MenuItem(
          title: 'Explore',
          icon: Icons.room_outlined,
          isActive: currentRoute == AppLink.explore,
          onTap: () {
            Get.toNamed(AppLink.explore);
          }
        ),
        OverlayTooltipItem(
          displayIndex: 3,
          tooltip: (controller) => Padding(
            padding: const EdgeInsets.only(right: 15),
            child: MTooltip(title: 'Your scheduled booking will be listed here.', controller: controller),
          ),
          tooltipVerticalPosition: TooltipVerticalPosition.TOP,
          tooltipHorizontalPosition: TooltipHorizontalPosition.CENTER,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colorScheme(context).surface
            ),
            child: MenuItem(
              title: 'My Bookings',
              icon: Icons.bookmark_border,
              isActive: currentRoute == AppLink.myBooking,
              onTap: () {
                Get.toNamed(AppLink.myBooking);
              }
            ),
          ),
        ),
        MenuItem(
          title: 'Promos',
          icon: Icons.sell_outlined,
          isActive: currentRoute == AppLink.promo,
          onTap: () {
            Get.toNamed(AppLink.promo);
          }
        ),
        MenuItem(
          title: 'Profile',
          icon: Icons.account_circle_outlined,
          isActive: currentRoute == AppLink.profile,
          onTap: () => Get.toNamed(AppLink.profile)
        ),
      ])
    );
  }
}

class MenuItem extends StatelessWidget {
  const MenuItem({
    super.key,
    required this.icon,
    required this.title,
    this.isActive = false,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final bool isActive;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation (
      child: GestureDetector(
        onTap: () => {
          onTap()
        },
        child: SizedBox(
          width: 70,
          height: 50,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 25,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: ThemeRadius.big,
                      color: ThemePalette.primaryMain.withValues(alpha: isActive ? 0.25 : 0)
                    ),
                  ),
                  Icon(icon, size: 24, color: isActive ? ThemePalette.primaryMain : Theme.of(context).colorScheme.onSurface),
                ],
              ),
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: ThemeText.caption.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }
}