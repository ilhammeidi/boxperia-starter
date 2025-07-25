import 'package:booking_app/ui/themes/theme_breakpoints.dart';
import 'package:flutter/material.dart';
import 'package:booking_app/ui/themes/theme_radius.dart';
import 'package:booking_app/ui/themes/theme_spacing.dart';


class AdsBanner extends StatelessWidget {
  const AdsBanner({super.key, required this.img});

  final String img;

  @override
  Widget build(BuildContext context) {
    double getHeight() {
      if (ThemeBreakpoints.mdUp(context)) {
        return 600;
      } else if (ThemeBreakpoints.smUp(context)) {
        return 400;
      } else if (ThemeBreakpoints.xsUp(context)) {
        return 300;
      } else {
        return 180;
      }
    }
    return Container(
      margin: EdgeInsets.symmetric(horizontal: spacingUnit(1)),
      width: double.infinity,
      height: getHeight(),
      decoration: BoxDecoration(
        borderRadius: ThemeRadius.small,
        image: DecorationImage(
          image: NetworkImage(img),
          fit: BoxFit.cover
        )
      ),
    );
  }
}
