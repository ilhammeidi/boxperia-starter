import 'package:booking_app/app/app_link.dart';
import 'package:booking_app/models/hotel.dart';
import 'package:booking_app/ui/themes/theme_palette.dart';
import 'package:booking_app/ui/themes/theme_radius.dart';
import 'package:booking_app/ui/themes/theme_spacing.dart';
import 'package:booking_app/ui/themes/theme_text.dart';
import 'package:booking_app/widgets/cards/featured_card.dart';
import 'package:booking_app/widgets/review/rating_star.dart';
import 'package:booking_app/widgets/title/title_basic.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class FeaturedHotelSlider extends StatelessWidget {
  const FeaturedHotelSlider({super.key, this.withCover = true});

  final bool withCover;

  @override
  Widget build(BuildContext context) {
    final List<Hotel> featuredHotel = hotelList.sublist(5, 11);

    const double cardHeight = 250;
    int indexStart = withCover ? 1 : 0;

    return Column(children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
        child: TitleBasic(title: 'Featured Hotels for You'),
      ),
      SizedBox(
        height: cardHeight + 20,
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            /// COVER
            withCover ? Positioned(
              left: spacingUnit(1),
              child: Container(
                width: cardHeight + 10,
                height: cardHeight + 10,
                decoration: BoxDecoration(
                  borderRadius: ThemeRadius.medium,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      colorScheme(context).primaryContainer,
                      colorScheme(context).surfaceContainerLowest,
                    ],
                  ),
                ),
              ),
            ) : SizedBox.shrink(),

            /// SLIDER LIST
            SizedBox(
              height: cardHeight,
              child: ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => SizedBox(width: spacingUnit(1)),
                itemCount: featuredHotel.length,
                itemBuilder: ((context, index) {
                  if (index == 0 && withCover) {
                    return SizedBox(width: 130, child: _featuredText(context));
                  }
                    
                  Hotel item = featuredHotel[index - indexStart];
                  return SizedBox(
                    width: 240,
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed(AppLink.hotelDetail);
                      },
                      child: FeaturedCard(
                        image: item.thumbnail,
                        discount: item.discount,
                        title: item.name,
                        location: '${item.location.name}, ${item.location.country}',
                        rating: item.rating,
                        reviews: item.reviews,
                        price: item.price,
                        facility1: item.facilities?[0],
                        facility2: item.facilities!.length > 1 ? item.facilities![1] : null,
                        label: 'Featured',
                        additionalWidget: RatingStar(
                          initVal: item.stars,
                          color: colorScheme(context).onPrimaryContainer,
                          size: 11,
                          maxVal: item.stars,
                          readOnly: true,
                        ),
                      ),
                    ),
                  );
                }),
              )
            ),
          ],
        ),
      )
    ]);
  }

  Widget _featuredText(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
      Text('FEATURED', style: ThemeText.caption.copyWith(color: colorScheme(context).onPrimaryContainer, fontWeight: FontWeight.bold)),
      SizedBox(height: 4),
      Text('Hotel start from \$50/night', style: ThemeText.paragraphBold),
      SizedBox(height: 4),
      Text('Complete your holiday list by staying here and discover the best hotels for your stay.', style: ThemeText.caption),
    ]);
  }
}