import 'package:booking_app/app/app_link.dart';
import 'package:booking_app/models/homestay.dart';
import 'package:booking_app/ui/themes/theme_palette.dart';
import 'package:booking_app/ui/themes/theme_radius.dart';
import 'package:booking_app/ui/themes/theme_spacing.dart';
import 'package:booking_app/ui/themes/theme_text.dart';
import 'package:booking_app/widgets/cards/featured_card.dart';
import 'package:booking_app/widgets/title/title_basic.dart';
import 'package:change_case/change_case.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class FeaturedHomeSlider extends StatelessWidget {
  const FeaturedHomeSlider({super.key, this.withCover = true});

  final bool withCover;

  @override
  Widget build(BuildContext context) {
    final List<Homestay> featuredHome = homestayList.sublist(5, 11);

    const double cardHeight = 240;
    int indexStart = withCover ? 1 : 0;

    return Column(children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
        child: TitleBasic(title: 'Featured Homestays for You'),
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
                      colorScheme(context).secondaryContainer,
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
                itemCount: featuredHome.length,
                itemBuilder: ((context, index) {
                  if (index == 0 && withCover) {
                    return SizedBox(width: 130, child: _featuredText(context));
                  }
  
                  Homestay item = featuredHome[index - indexStart];
                  return SizedBox(
                    width: 250,
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed(AppLink.homestayDetail);
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
                        additionalWidget: Row(
                          children: [
                            Text('${item.size.toCapitalCase()} • ${item.bedRooms} ', style: ThemeText.caption.copyWith(color: colorScheme(context).onSurfaceVariant)),
                            Icon(Icons.bed_outlined, size: 14, color: colorScheme(context).onSurfaceVariant),
                          ],
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
      Text('FEATURED', style: ThemeText.caption.copyWith(color: colorScheme(context).onSecondaryContainer, fontWeight: FontWeight.bold)),
      SizedBox(height: 4),
      Text('Homestays start from \$20', style: ThemeText.paragraphBold),
      SizedBox(height: 4),
      Text('Save money by exploring cheap homestays. You can explore it in more ways than ever.', style: ThemeText.caption),
    ]);
  }
}