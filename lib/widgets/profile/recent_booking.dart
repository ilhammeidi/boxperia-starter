import 'package:booking_app/app/app_link.dart';
import 'package:booking_app/models/homestay.dart';
import 'package:booking_app/models/hotel.dart';
import 'package:booking_app/models/workspace.dart';
import 'package:booking_app/ui/themes/theme_palette.dart';
import 'package:booking_app/ui/themes/theme_spacing.dart';
import 'package:booking_app/ui/themes/theme_text.dart';
import 'package:booking_app/widgets/cards/featured_card.dart';
import 'package:booking_app/widgets/review/rating_star.dart';
import 'package:booking_app/widgets/title/title_basic.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class RecentBooking extends StatelessWidget {
  const RecentBooking({super.key});

  @override
  Widget build(BuildContext context) {
    final Hotel item1 = hotelList[5];
    final Hotel item2 = hotelList[2];
    final Homestay item3 = homestayList[10];
    final Workspace item4 = workspaceList[1];
    final Workspace item5 = workspaceList[2];

    final double sizeWidth = 240;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
          child: TitleBasic(title: 'Your Latest Booking'),
        ),
        SizedBox(height: spacingUnit(2)),
        SizedBox(
          height: 240,
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
            physics: const ClampingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                width: sizeWidth,
                margin: EdgeInsets.only(left: spacingUnit(1), right: spacingUnit(1)),
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(AppLink.hotelDetail);
                  },
                  child: FeaturedCard(
                    image: item1.thumbnail,
                    discount: item1.discount,
                    title: item1.name,
                    location: '${item1.location.name}, ${item1.location.country}',
                    rating: item1.rating,
                    reviews: item1.reviews,
                    price: item1.price,
                    facility1: item1.facilities?[0],
                    facility2: item1.facilities!.length > 1 ? item1.facilities![1] : null,
                    label: 'Featured',
                    additionalWidget: RatingStar(
                      initVal: item1.stars,
                      color: colorScheme(context).onPrimaryContainer,
                      size: 11,
                      maxVal: item1.stars,
                      readOnly: true,
                    ),
                  ),
                ),
              ),
          
              Container(
                width: sizeWidth,
                margin: EdgeInsets.only(right: spacingUnit(1)),
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(AppLink.hotelDetail);
                  },
                  child: FeaturedCard(
                    image: item2.thumbnail,
                    discount: item2.discount,
                    title: item2.name,
                    location: '${item2.location.name}, ${item1.location.country}',
                    rating: item2.rating,
                    reviews: item2.reviews,
                    price: item2.price,
                    facility1: item2.facilities?[0],
                    facility2: item2.facilities!.length > 1 ? item2.facilities![1] : null,
                    label: 'Featured',
                    additionalWidget: RatingStar(
                      initVal: item2.stars,
                      color: colorScheme(context).onPrimaryContainer,
                      size: 11,
                      maxVal: item2.stars,
                      readOnly: true,
                    ),
                  ),
                ),
              ),
          
              Container(
                width: sizeWidth,
                margin: EdgeInsets.only(right: spacingUnit(1)),
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(AppLink.homestayDetail);
                  },
                  child: FeaturedCard(
                    image: item3.thumbnail,
                    discount: item3.discount,
                    title: item3.name,
                    location: '${item3.location.name}, ${item3.location.country}',
                    rating: item3.rating,
                    reviews: item3.reviews,
                    price: item3.price,
                    facility1: item3.facilities?[0],
                    facility2: item3.facilities!.length > 1 ? item3.facilities![1] : null,
                    label: 'Featured',
                    additionalWidget: Row(
                      children: [
                        Text('${item3.size} • ${item3.bedRooms} ', style: ThemeText.caption.copyWith(color: colorScheme(context).onSurfaceVariant)),
                        Icon(Icons.bed_outlined, size: 14, color: colorScheme(context).onSurfaceVariant),
                      ],
                    ),
                  ),
                ),
              ),
          
              Container(
                width: sizeWidth,
                margin: EdgeInsets.only(right: spacingUnit(1)),
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(AppLink.workspaceDetail);
                  },
                  child: FeaturedCard(
                    image: item4.thumbnail,
                    title: item4.name,
                    location: '${item4.location.name}, ${item4.location.country}',
                    rating: item4.rating,
                    reviews: item4.reviews,
                    price: item4.price,
                    facility1: item4.facilities?[0],
                    facility2: item4.facilities!.length > 1 ? item4.facilities![1] : null,
                    label: 'Featured',
                    additionalWidget: Text('Start from', style: ThemeText.caption.copyWith(height: 1),),
                  ),
                ),
              ),
          
              SizedBox(
                width: sizeWidth,
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(AppLink.workspaceDetail);
                  },
                  child: FeaturedCard(
                    image: item5.thumbnail,
                    title: item5.name,
                    location: '${item5.location.name}, ${item5.location.country}',
                    rating: item5.rating,
                    reviews: item5.reviews,
                    price: item5.price,
                    facility1: item5.facilities?[0],
                    facility2: item5.facilities!.length > 1 ? item5.facilities![1] : null,
                    label: 'Featured',
                    additionalWidget: Text('Start from', style: ThemeText.caption.copyWith(height: 1),),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}