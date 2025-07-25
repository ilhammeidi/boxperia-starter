import 'package:booking_app/app/app_link.dart';
import 'package:flutter/material.dart';
import 'package:booking_app/models/promo.dart';
import 'package:booking_app/ui/themes/theme_spacing.dart';
import 'package:booking_app/widgets/cards/promo_card.dart';
import 'package:get/get.dart';

class PromoGrid extends StatelessWidget {
  const PromoGrid({super.key, required this.items, this.isHome = false});

  final List<Promotion> items;
  final bool isHome;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.only(top: spacingUnit(2), left: spacingUnit(2), right: spacingUnit(2), bottom: isHome ? 100 : spacingUnit(1)),
      itemCount: items.length,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        mainAxisExtent: 300,
        maxCrossAxisExtent: 400,
        childAspectRatio: 1.1,
        crossAxisSpacing: spacingUnit(2),
        mainAxisSpacing: spacingUnit(2),
      ),
      itemBuilder: (context, index) {
        Promotion item = items[index];
        return Padding(
          padding: EdgeInsets.only(bottom: spacingUnit(1)),
          child: PromoCard(
            thumb: item.thumb,
            title: item.name,
            liked: false,
            point: item.price,
            time: item.date,
            onTap: () {
              Get.toNamed(AppLink.promoDetail);
            },
          ),
        );
      },
    );
  }
}