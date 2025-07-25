import 'package:booking_app/ui/themes/theme_breakpoints.dart';
import 'package:booking_app/widgets/home_screen/news_list.dart';
import 'package:booking_app/widgets/profile/favorite_places.dart';
import 'package:booking_app/widgets/profile/recent_booking.dart';
import 'package:booking_app/widgets/profile/slider_counter.dart';
import 'package:flutter/material.dart';
import 'package:booking_app/ui/themes/theme_spacing.dart';
import 'package:booking_app/widgets/settings/setting_list.dart';
import 'package:booking_app/widgets/profile/profile_banner_header.dart';

class ProfileMain extends StatefulWidget {
  const ProfileMain({super.key});

  @override
  State<ProfileMain> createState() => _ProfileMainState();
}

class _ProfileMainState extends State<ProfileMain> {
  int _active = 0;

  final List<Widget> _content = [
    const Column(children: [
      SliderCounter(),
      VSpaceShort(),
      FavoritePlaces(),
      VSpace(),
      RecentBooking(),
      VSpace(),
      NewsList(),
      VSpace(),
    ]),
    Align(
      alignment: Alignment.center,
      child: Container(
        constraints: BoxConstraints(maxWidth: ThemeSize.sm),
        child: SettingList()
      )
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;

    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          delegate: ProfileBannerHeader(
            minExtent: topPadding + 100,
            maxExtent: 250,
            current: _active,
            onSelect: (int val) {
              setState(() {
                _active = val;
              });
            }
          ),
          pinned: true,
        ),
        SliverToBoxAdapter(
          child: _content[_active]
        ),
        SliverPadding(padding: EdgeInsets.only(bottom: spacingUnit(4)))
      ],
    );
  }
}