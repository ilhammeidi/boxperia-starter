import 'package:booking_app/ui/themes/theme_spacing.dart';
import 'package:booking_app/utils/custom_tooltip.dart';
import 'package:booking_app/widgets/bottom_nav/bottom_nav_menu.dart';
import 'package:booking_app/widgets/home_screen/city_destinations.dart';
import 'package:booking_app/widgets/homestay/basic_home_slider.dart';
import 'package:booking_app/widgets/homestay/featured_home_slider.dart';
import 'package:booking_app/widgets/hotel/basic_hotel_slider.dart';
import 'package:booking_app/widgets/hotel/featured_hotel_slider.dart';
import 'package:booking_app/widgets/home_screen/header.dart';
import 'package:booking_app/widgets/home_screen/partners_logo.dart';
import 'package:booking_app/widgets/home_screen/promo_slider.dart';
import 'package:booking_app/widgets/home_screen/menu_banner.dart';
import 'package:booking_app/widgets/workspace/basic_workspace_slider.dart';
import 'package:booking_app/widgets/workspace/featured_workspace_slider.dart';
import 'package:flutter/material.dart';
import 'package:overlay_tooltip/overlay_tooltip.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ScrollController _scrollref = ScrollController();
  final TooltipController _tooltipRef = TooltipController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  final String _key = 'finishedGuide';

  bool _isDoneGuide = false;
  bool _isFixed = false;

  void _checkFinishedGuide() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isDoneGuide = prefs.getBool(_key) ?? false;
    });
  }

  @override
  void initState() {
    _tooltipRef.onDone(() async {
      SharedPreferences pref = await _prefs;
      pref.setBool(_key, true);
      setState(() {
        _isDoneGuide = true;
      });
    });

    _checkFinishedGuide();
    super.initState();
  }

  @override
  void dispose() {
    _tooltipRef.dispose();
    _scrollref.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scrollref.addListener(() {
      setState(() {
        if(_scrollref.offset > 60) {
          _isFixed = true;
        } else {
          _isFixed = false;
        }
      });
    });

    return OverlayTooltipScaffold(
      overlayColor: Colors.black.withValues(alpha: 0.4),
      tooltipAnimationCurve: Curves.linear,
      tooltipAnimationDuration: const Duration(milliseconds: 1000),
      controller: _tooltipRef,
      startWhen: (initializedWidgetLength) async {
        await Future.delayed(const Duration(milliseconds: 500));
        return initializedWidgetLength == 1 && !_isDoneGuide;
      },
      builder: (context) => Scaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: HomeHeader(isFixed: _isFixed),
        ),
        body: SingleChildScrollView(
          controller: _scrollref,
          child: Column(
            children: [
              const MenuBanner(),
              const VSpaceBig(),
              OverlayTooltipItem(
                displayIndex: 1,
                tooltip: (controller) => Padding(
                  padding: EdgeInsets.all(spacingUnit(1)),
                  child: MTooltip(title: 'Explore The Most Popular Places', controller: controller),
                ),
                child: const CityDestinations()
              ),
              const VSpaceShort(),
              const PromoSlider(),
              const VSpaceBig(),
              const FeaturedHotelSlider(),
              const VSpaceBig(),
              const BasicHotelSlider(),
              const VSpace(),
              const FeaturedHomeSlider(),
              const VSpaceBig(),
              const BasicHomeSlider(),
              const VSpace(),
              const FeaturedWorkspaceSlider(),
              const VSpaceBig(),
              const BasicWorkspaceSlider(),
              const PartnersLogo(),
              const SizedBox(height: 100,)
            ],
          ),
        ),
        bottomNavigationBar: const BottomNavMenu(),
      ),
    );
  }
}