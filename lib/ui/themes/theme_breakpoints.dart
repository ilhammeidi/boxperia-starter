import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ThemeSize {
  static double xs = 480;
  static double sm = 600;
  static double md = 768;
  static double lg = 960;
  static double xl = 1280;
  static double xxl = 1536;
}

class ThemeBreakpoints {
  // UP
  static bool xsUp(BuildContext context){
    return MediaQuery.of(context).size.width > ThemeSize.xs;
  }
  static bool smUp(BuildContext context){
    return MediaQuery.of(context).size.width > ThemeSize.sm;
  }
  static bool mdUp(BuildContext context){
    return MediaQuery.of(context).size.width > ThemeSize.md;
  }
  static bool lgUp(BuildContext context){
    return MediaQuery.of(context).size.width > ThemeSize.lg;
  }
  static bool xlUp(BuildContext context){
    return MediaQuery.of(context).size.width > ThemeSize.xl;
  }
  static bool xxlUp(BuildContext context){
    return MediaQuery.of(context).size.width > ThemeSize.xxl;
  }

  // Down
  static bool xsDown(BuildContext context){
    return MediaQuery.of(context).size.width <= ThemeSize.xs;
  }
  static bool smDown(BuildContext context){
    return MediaQuery.of(context).size.width <= ThemeSize.sm;
  }
  static bool mdDown(BuildContext context){
    return MediaQuery.of(context).size.width <= ThemeSize.md;
  }
  static bool lgDown(BuildContext context){
    return MediaQuery.of(context).size.width <= ThemeSize.lg;
  }
  static bool xlDown(BuildContext context){
    return MediaQuery.of(context).size.width <= ThemeSize.xl;
  }
  static bool xxlDown(BuildContext context){
    return MediaQuery.of(context).size.width <= ThemeSize.xxl;
  }
}

class ThemeConstraint {
  // Up
  static bool xsUp(double constraint){
    return constraint > ThemeSize.xs;
  }
  static bool smUp(double constraint){
    return constraint > ThemeSize.sm;
  }
  static bool mdUp(double constraint){
    return constraint > ThemeSize.md;
  }
  static bool lgUp(double constraint){
    return constraint > ThemeSize.lg;
  }
  static bool xlUp(double constraint){
    return constraint > ThemeSize.xl;
  }
  static bool xxlUp(double constraint){
    return constraint > ThemeSize.xxl;
  }

  // Down
  static bool xsDown(double constraint){
    return constraint <= ThemeSize.xs;
  }
  static bool smDown(double constraint){
    return constraint <= ThemeSize.sm;
  }
  static bool mdDown(double constraint){
    return constraint <= ThemeSize.md;
  }
  static bool lgDown(double constraint){
    return constraint <= ThemeSize.lg;
  }
  static bool xlDown(double constraint){
    return constraint <= ThemeSize.xl;
  }
  static bool xxlDown(double constraint){
    return constraint <= ThemeSize.xxl;
  }
}