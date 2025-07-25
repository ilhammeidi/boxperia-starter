import 'package:booking_app/app/app_link.dart';
import 'package:flutter/material.dart';
import 'package:booking_app/models/promo.dart';
import 'package:booking_app/ui/themes/theme_spacing.dart';
import 'package:booking_app/widgets/cards/promo_card.dart';
import 'package:get/get.dart';

class PromoList extends StatelessWidget {
  const PromoList({super.key, required this.items, this.isHome = false});

  final List<Promotion> items;
  final bool isHome;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.only(top: spacingUnit(2), left: spacingUnit(2), right: spacingUnit(2), bottom: isHome ? spacingUnit(4) : spacingUnit(1)),
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
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