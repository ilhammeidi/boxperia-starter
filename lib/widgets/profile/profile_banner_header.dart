import 'package:booking_app/constants/img_api.dart';
import 'package:booking_app/ui/themes/theme_breakpoints.dart';
import 'package:booking_app/widgets/action_header/home_action_group.dart';
import 'package:booking_app/widgets/tab_menu/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/route_manager.dart';
import 'package:booking_app/constants/app_const.dart';
import 'package:booking_app/ui/themes/theme_palette.dart';
import 'package:booking_app/ui/themes/theme_spacing.dart';
import 'package:booking_app/ui/themes/theme_text.dart';
import 'package:booking_app/utils/image_viewer.dart';
import 'package:booking_app/widgets/decorations/rounded_deco_main.dart';

class ProfileBannerHeader extends SliverPersistentHeaderDelegate {
  const ProfileBannerHeader({
    required this.current,
    required this.onSelect, 
    required this.maxExtent,
    required this.minExtent
  });

  final int current;
  final Function(int) onSelect;

  @override
  final double maxExtent;
  
  @override
  final double minExtent;


  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final showItem = shrinkOffset < 50;
    
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraint) {
        double maxWidth = constraint.maxWidth;

        return SizedBox(
          width: maxWidth,
          child: Stack(
            fit: StackFit.expand,
            children: [
              /// BACKGROUND
              Container(
                decoration: BoxDecoration(
                  color: colorScheme(context).primaryContainer,
                  gradient: LinearGradient(
                    colors: [
                      colorScheme(context).surfaceDim,
                      colorScheme(context).secondaryContainer,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight
                  )
                ),
                child: Opacity(
                  opacity: 0.25,
                  child: SvgPicture.asset(
                    ImgApi.profileBanner,
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(colorScheme(context).onSurface, BlendMode.srcIn)
                  ),
                ),
              ),
          
              /// CURVE DECORATION
              Positioned(
                bottom: 0,
                left: 0,
                child: RoundedDecoMain(
                  height: 70,
                  baseHeight: 20,
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
          
              /// TOP BAR
              Positioned(
                top: spacingUnit(1),
                left: spacingUnit(2),
                child: AnimatedOpacity(
                  opacity: showItem ? 0 : 1,
                  duration: const Duration(milliseconds: 300),
                  child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundImage: NetworkImage(userDummy.avatar),
                    ),
                    SizedBox(width: spacingUnit(1)),
                    Text(userDummy.name, style: ThemeText.title2),
                  ]),
                ),
              ),
              Positioned(
                top: spacingUnit(1),
                right: spacingUnit(1),
                child: Row(children: homeActionGroup(context, false)),
              ),
          
              /// USER PROFILE
              Positioned(
                bottom: 0,
                child: SizedBox(
                  width: maxWidth,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                    /// AVATAR
                    AnimatedOpacity(
                      opacity: showItem ? 1 : 0,
                      duration: const Duration(milliseconds: 300),
                      child: AnimatedScale(
                        scale: showItem ? 1 : 0,
                        curve: Curves.easeOutBack,
                        duration: const Duration(milliseconds: 300),
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Hero(
                              tag: userDummy.avatar,
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(() => ImageViewer(img: userDummy.avatar));
                                },
                                child: CircleAvatar(
                                  radius: 50,
                                  backgroundImage: NetworkImage(userDummy.avatar),
                                ),
                              ),
                            ),
                            Positioned(
                              child: CircleAvatar(
                                radius: 13,
                                backgroundColor: ThemePalette.tertiaryMain,
                                child: Icon(Icons.verified, size: 20, color: ThemePalette.tertiaryDark),
                              )
                            )
                          ],
                        )
                      ),
                    ),
                    
                    /// NAME
                    AnimatedOpacity(
                      opacity: showItem ? 1 : 0,
                      duration: const Duration(milliseconds: 300),
                      child: Text(userDummy.name, style: ThemeText.title2),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: spacingUnit(4)),
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: ThemeSize.sm
                        ),
                        child: TabMenu(onSelect: onSelect, current: current, menus: const ['Profile', 'Settings'])
                      ),
                    ),
                
                  ]),
                ),
              ),
            ]
          ),
        );
      },
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;

  @override
  OverScrollHeaderStretchConfiguration get stretchConfiguration => OverScrollHeaderStretchConfiguration();
}