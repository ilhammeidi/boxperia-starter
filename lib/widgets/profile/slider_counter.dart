import 'package:booking_app/app/app_link.dart';
import 'package:booking_app/ui/themes/theme_breakpoints.dart';
import 'package:booking_app/ui/themes/theme_palette.dart';
import 'package:booking_app/widgets/cards/paper_card.dart';
import 'package:flutter/material.dart';
import 'package:booking_app/ui/themes/theme_spacing.dart';
import 'package:booking_app/ui/themes/theme_text.dart';
import 'package:get/route_manager.dart';

class SliderCounter extends StatelessWidget {
  const SliderCounter({super.key});

  @override
  Widget build(BuildContext context) {
    final bool wideScreen = ThemeBreakpoints.mdUp(context);
    double cardWidth = wideScreen ? 320 : 240;

    return SizedBox(
      height: 150,
      child: ListView(
        padding: EdgeInsets.all(spacingUnit(2)),
        scrollDirection: Axis.horizontal,
        children: [
          /// POINTS
          SizedBox(
            width: cardWidth,
            child: GestureDetector(
              onTap: () {
                Get.toNamed(AppLink.reward);
              },
              child: PaperCard(
                flat: true,
                content: Padding(
                  padding: EdgeInsets.all(spacingUnit(1)),
                  child: Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center, children: [
                    Container(
                      padding: EdgeInsets.all(spacingUnit(1)),
                      width: 100,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            width: 200,
                            height: 100,
                            child: CircularProgressIndicator(
                              value: 0.7,
                              strokeWidth: 15.0,
                              backgroundColor: Colors.amber.withValues(alpha: 0.5),
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
                            ),
                          ),
                          Text('Gold', style: ThemeText.subtitle)
                        ],
                      )
                    ),
                    SizedBox(width: spacingUnit(2)),
                    Expanded(
                      child: Column(mainAxisAlignment: MainAxisAlignment.end, crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text('700 Points', style: ThemeText.title2),
                        Text('Achieved', style: ThemeText.paragraph),
                      ])
                    )
                  ]),
                )
              ),
            ),
          ),
          SizedBox(width: spacingUnit(1)),

          /// VOUCHERS
          SizedBox(
            width: cardWidth,
            child: GestureDetector(
              onTap: () {
                Get.toNamed(AppLink.myVouchers);
              },
              child: PaperCard(
                flat: true,
                content: Padding(
                  padding: EdgeInsets.all(spacingUnit(1)),
                  child: Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.end, children: [
                    Icon(Icons.discount_outlined, color: ThemePalette.primaryMain, size: 80),
                    SizedBox(width: spacingUnit(2)),
                    Expanded(
                      child: Column(mainAxisAlignment: MainAxisAlignment.end, crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text('5 Vouchers', style: ThemeText.title2),
                        Text('Available', style: ThemeText.paragraph),
                      ])
                    )
                  ]),
                )
              ),
            ),
          ),
          SizedBox(width: spacingUnit(1)),

          /// HISTORY
          SizedBox(
            width: cardWidth,
            child: GestureDetector(
              onTap: () {
                Get.toNamed(AppLink.bookingHistory);
              },
              child: PaperCard(
                flat: true,
                content: Padding(
                  padding: EdgeInsets.all(spacingUnit(1)),
                  child: Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.end, children: [
                    Icon(Icons.bookmark_added_outlined, color: ThemePalette.secondaryMain, size: 110),
                    SizedBox(width: spacingUnit(2)),
                    Expanded(
                      child: Column(mainAxisAlignment: MainAxisAlignment.end, crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text('15 Places', style: ThemeText.title2),
                        Text('Booked', style: ThemeText.paragraph),
                      ])
                    )
                  ]),
                )
              ),
            ),
          )
        ],
      ),
    );
  }
}