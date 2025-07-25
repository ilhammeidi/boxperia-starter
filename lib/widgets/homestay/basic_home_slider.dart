import 'package:booking_app/app/app_link.dart';
import 'package:booking_app/models/homestay.dart';
import 'package:booking_app/ui/themes/theme_spacing.dart';
import 'package:booking_app/widgets/cards/home_card.dart';
import 'package:booking_app/widgets/title/title_action.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class BasicHomeSlider extends StatelessWidget {
  const BasicHomeSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Homestay> nearestHome = homestayList.sublist(12, 19);
    const double cardHeight = 220;

    return Column(children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
        child: TitleAction(
          title: 'Homestays Around You',
          textAction: 'See All',
          onTap: () {
            Get.toNamed(AppLink.homestayList);
          }
        ),
      ),
      SizedBox(height: spacingUnit(2)),
      SizedBox(
        height: cardHeight,
        child: ListView.separated(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
          physics: const ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => SizedBox(width: spacingUnit(2)),
          itemCount: nearestHome.length,
          itemBuilder: ((context, index) {
            Homestay item = nearestHome[index];
            return SizedBox(
              width: 180,
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(AppLink.homestayDetail);
                },
                child: HomeCard(
                  label: 'Best Value',
                  image: item.thumbnail,
                  discount: item.discount,
                  price: item.price,
                  title: item.name,
                  location: '${item.location.name}, ${item.location.country}',
                  rating: item.rating,
                  reviews: item.reviews,
                  type: item.type,
                  bedRooms: item.bedRooms,
                  size: item.size,
                ),
              )
            );
          })
        )
      )
    ]);
  }
}