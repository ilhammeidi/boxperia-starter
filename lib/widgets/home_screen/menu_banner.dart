import 'package:booking_app/app/app_link.dart';
import 'package:booking_app/constants/img_api.dart';
import 'package:booking_app/ui/themes/theme_breakpoints.dart';
import 'package:booking_app/ui/themes/theme_palette.dart';
import 'package:booking_app/ui/themes/theme_shadow.dart';
import 'package:booking_app/ui/themes/theme_text.dart';
import 'package:booking_app/utils/custom_tooltip.dart';
import 'package:flutter/material.dart';
import 'package:booking_app/ui/themes/theme_spacing.dart';
import 'package:booking_app/widgets/home_screen/home_banner.dart';
import 'package:get/route_manager.dart';
import 'package:overlay_tooltip/overlay_tooltip.dart';

class MenuBanner extends StatefulWidget {
  const MenuBanner({super.key});

  @override
  State<MenuBanner> createState() => _MenuBannerState();
}

class _MenuBannerState extends State<MenuBanner> {

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        /// BANNER AND DECORATION
        const Positioned(top: 0, child: HomeBanner()),

        /// FEATURE BUTTON
        SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(height: ThemeBreakpoints.mdUp(context) ? 200 : 260),
              OverlayTooltipItem(
                displayIndex: 0,
                tooltip: (controller) => Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: MTooltip(title: 'Find The Best Place to Stay or Work', controller: controller),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: spacingUnit(1)),
                  child: Row(children: [
                    Expanded(child: 
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(AppLink.search, arguments: {'tabMenu': 'hotel'});
                        },
                        child: FeatureButton(title: 'Hotels', icon: ImgApi.hotelIcon, color: ThemePalette.primaryMain)
                      )
                    ),
                    SizedBox(width: spacingUnit(1)),
                    Expanded(child: 
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(AppLink.search, arguments: {'tabMenu': 'homestay'});
                        },
                        child: FeatureButton(title: 'Homestays', icon: ImgApi.homestayIcon, color: ThemePalette.secondaryMain, indent: true)
                      )
                    ),
                    SizedBox(width: spacingUnit(1)),
                    Expanded(child: 
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(AppLink.search, arguments: {'tabMenu': 'workspace'});
                        },
                        child: FeatureButton(title: 'Workspace', icon: ImgApi.officeIcon, color: ThemePalette.tertiaryMain, indent: true, invert: true)
                      )
                    ),
                  ]),
                )
              ),
            ],
          ),
        ),
      ]
    );
  }
}

class FeatureButton extends StatelessWidget {
  const FeatureButton({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    this.indent = false,
    this.invert = false
  });

  final String title;
  final String icon;
  final Color color;
  final bool indent;
  final bool invert;

  @override
  Widget build(BuildContext context) {
    BorderRadius borderRadius = BorderRadius.circular(20);
    final bool isDark = Get.isDarkMode;
    final bool wideScreen = ThemeBreakpoints.smUp(context);
    final TextStyle titleStyle = wideScreen ? ThemeText.title2 : ThemeText.subtitle;

    return Container(
      height: wideScreen ? 120 : 90,
      decoration: BoxDecoration(
        color: isDark ? darken(color, 0.25) : color,
        borderRadius: borderRadius,
        boxShadow: invert ? [ThemeShade.shadeSoft(context)] : [ThemeShade.shadeMedium(context)]
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return ClipRRect(
            borderRadius: borderRadius,
            child: Stack(
              children: [
                Positioned(
                  top: 30,
                  left: 10,
                  child: Container(
                    width: constraints.maxWidth,
                    height: constraints.maxWidth,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          invert && !isDark ? Colors.grey.withValues(alpha: 0.25) : Colors.white.withValues(alpha: 0.5),
                          color.withValues(alpha: 0.5),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 0,
                  child: Padding(
                    padding: EdgeInsets.all(spacingUnit(1)),
                    child: Text(title, textAlign: TextAlign.start, style: titleStyle.copyWith(color: invert && !isDark ? Colors.black.withValues(alpha: 0.5) : Colors.white))
                  ),
                ),
                Positioned(
                  right: indent ? 12 : 0,
                  bottom: 0,
                  child: Image.asset(icon, height: wideScreen ? 80 : 50,)
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}