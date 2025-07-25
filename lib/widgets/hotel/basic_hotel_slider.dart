import 'package:booking_app/app/app_link.dart';
import 'package:booking_app/models/hotel.dart';
import 'package:booking_app/ui/themes/theme_spacing.dart';
import 'package:booking_app/widgets/cards/hotel_card.dart';
import 'package:booking_app/widgets/title/title_action.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class BasicHotelSlider extends StatelessWidget {
  const BasicHotelSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Hotel> nearestHotel = hotelList.sublist(10, 18);
    const double cardHeight = 220;

    return Column(children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
        child: TitleAction(
          title: 'Hotels Around You',
          textAction: 'See All',
          onTap: () {
            Get.toNamed(AppLink.hotelList);
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
          itemCount: nearestHotel.length,
          itemBuilder: ((context, index) {
            Hotel item = nearestHotel[index];
            return SizedBox(
              width: 180,
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(AppLink.hotelDetail);
                },
                child: HotelCard(
                  label: 'Best Value',
                  image: item.thumbnail,
                  discount: item.discount,
                  price: item.price,
                  title: item.name,
                  location: '${item.location.name}, ${item.location.country}',
                  rating: item.rating,
                  reviews: item.reviews,
                  stars: item.stars,
                ),
              )
            );
          })
        )
      )
    ]);
  }
}