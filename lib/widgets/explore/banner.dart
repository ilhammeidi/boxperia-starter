import 'package:booking_app/constants/img_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg_img;
import 'package:get/route_manager.dart';
import 'package:booking_app/constants/app_const.dart';
import 'package:booking_app/ui/themes/theme_palette.dart';
import 'package:booking_app/ui/themes/theme_spacing.dart';
import 'package:booking_app/ui/themes/theme_text.dart';
import 'package:booking_app/widgets/decorations/rounded_deco_main.dart';

class BannerExplore extends StatelessWidget {
  const BannerExplore({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Get.isDarkMode;

    return Container(
      height: 400,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: isDark 
            ? [ThemePalette.primaryDark, ThemePalette.tertiaryDark]
            : [ThemePalette.primaryLight, ThemePalette.secondaryLight]
        ),
      ),
      child: Container(
        /// CLOUD BACKGROUND
        decoration: BoxDecoration(
          image: DecorationImage(
            image: isDark ? svg_img.Svg(ImgApi.bgCloudDark) : svg_img.Svg(ImgApi.bgCloud),
            fit: BoxFit.contain,
            alignment: Alignment(0, -0.6),
            colorFilter: isDark ? ColorFilter.mode(Colors.black.withValues(alpha: 0.5), BlendMode.srcIn) : null
          ),
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            /// SKY BACKGROUND
            Positioned(
              bottom: 0,
              child: Container(
                width: 600,
                height: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(600),
                    topRight: Radius.circular(600),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      colorScheme(context).surfaceContainerLowest.withValues(alpha: 0.5),
                      colorScheme(context).surfaceContainerLowest.withValues(alpha: 0),
                    ]
                  ),
                ),
              ),
            ),

            /// TEXT TITLE AND ILLUSTRATION
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                /// TEXT TITLE
                Padding(
                  padding: EdgeInsets.all(spacingUnit(2)),
                  child: Column(children: [
                    const Text('Explore the most comfortable places around the world', style: ThemeText.title2, textAlign: TextAlign.center,),
                    const SizedBox(height: 8),
                    Text(
                      branding.desc,
                      style: ThemeText.paragraph,
                      textAlign: TextAlign.center,
                    ),
                  ])
                ),
                
                /// BUILDING ILLUSTRATION
                Stack(alignment: Alignment.topCenter,
                  children: [
                    Positioned(
                      top: 0,
                      child: SizedBox(
                        height: 250,
                        width: MediaQuery.of(context).size.width,
                        child: Opacity(
                          opacity: 0.1,
                          child: SvgPicture.asset(
                            ImgApi.bgBuildingBig,
                            colorFilter: ColorFilter.mode(isDark ? ThemePalette.primaryDark : ThemePalette.secondaryLight, BlendMode.srcIn)
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 150,
                      width: double.infinity,
                      margin: EdgeInsets.only(bottom: spacingUnit(1)),
                      child: SvgPicture.asset(
                        ImgApi.bgBuilding,
                        colorFilter: ColorFilter.mode(isDark ? colorScheme(context).surface : ThemePalette.primaryMain, BlendMode.srcIn)
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      child: RoundedDecoMain(
                        height: 80,
                        bgDecoration: BoxDecoration(
                          color: colorScheme(context).surfaceContainerLowest
                        ),
                      )
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      )
    );
  }
}