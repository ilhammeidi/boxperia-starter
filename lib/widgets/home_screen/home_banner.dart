import 'package:booking_app/constants/img_api.dart';
import 'package:booking_app/ui/themes/theme_breakpoints.dart';
import 'package:booking_app/ui/themes/theme_palette.dart';
import 'package:booking_app/ui/themes/theme_spacing.dart';
import 'package:booking_app/utils/check_platforms.dart';
import 'package:booking_app/widgets/decorations/rounded_deco_main.dart';
import 'package:flutter/material.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    bool wideScreen = ThemeBreakpoints.smUp(context);

    return Stack(
      children: [
        Container(
          height: 320,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.topCenter,
          padding: EdgeInsets.all(spacingUnit(3)),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImgApi.homeBanner),
              alignment: const Alignment(0, -0.4),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: isOnDesktopAndWeb() ? spacingUnit(10) : spacingUnit(12)),
            child: Text(
              'Easy Booking, Endless Experience',
              style: TextStyle(color: Colors.white, fontSize: wideScreen ? 48 : 32, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: RoundedDecoMain(
            height: 70,
            bgDecoration: BoxDecoration(
              color: colorScheme(context).surfaceContainerLowest,
              boxShadow: [BoxShadow(
                color: colorScheme(context).surfaceContainerLowest,
                blurRadius: 0.0,
                spreadRadius: 0.0,
                offset: const Offset(0, 2),
              )],
            ),
          )
        ),
      ],
    );
  }
}