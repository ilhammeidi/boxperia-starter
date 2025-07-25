import 'dart:ui';

import 'package:booking_app/ui/themes/theme_palette.dart';
import 'package:booking_app/ui/themes/theme_radius.dart';
import 'package:booking_app/ui/themes/theme_spacing.dart';
import 'package:booking_app/ui/themes/theme_text.dart';
import 'package:booking_app/utils/shimmer_preloader.dart';
import 'package:booking_app/widgets/cards/paper_card.dart';
import 'package:flutter/material.dart';

class FeaturedWideCard extends StatelessWidget {
  const FeaturedWideCard({
    super.key,
    this.label, required this.image, this.discount = 0,
    required this.title,
    required this.location, required this.rating, required this.reviews,
    this.additionalWidget, required this.price,
    this.facility1, this.facility2,
  });

  final String? label;
  final String image;
  final double discount;
  final String title;
  final String location;
  final double rating;
  final double reviews;
  final Widget? additionalWidget;
  final double price;
  final String? facility1;
  final String? facility2;

  @override
  Widget build(BuildContext context) {
    double thumbSize = 120;
    double cardHeight = 150;
    double marginLeft = 20;

    String setValue(val) {
      if (val < 2) {
        return 'Poor';
      } else if (val < 3.5) {
        return 'Average';
      } else if (val < 4.5) {
        return 'Good';
      } else {
        return 'Exellent';
      } 
    }

    String finalPrice() => '\$${(price - price * discount / 100).toStringAsFixed(2)}';

    return Stack(alignment: Alignment.centerLeft, children: [
      /// CARD CONTENT
      Container(
        margin: EdgeInsets.only(left: marginLeft),
        height: cardHeight,
        child: PaperCard(
          content: Padding(
            padding: EdgeInsets.all(spacingUnit(1)),
            child: Row(
              children: [
                SizedBox(width: thumbSize - marginLeft,),
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(title, overflow: TextOverflow.ellipsis, maxLines: 1, style: ThemeText.subtitle,),
                    SizedBox(height: spacingUnit(1)),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.start, children: [
                      /// PROPERTIES
                      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        /// LOCATION
                        Row(children: [
                          Icon(Icons.location_on, size: 14, color: colorScheme(context).onSurfaceVariant),
                          SizedBox(width: 4),
                          Text(location, style: ThemeText.paragraph.copyWith(color: colorScheme(context).onSurfaceVariant)),
                        ]),
                        SizedBox(height: 4),
                  
                        /// RATING
                        RichText(
                          text: TextSpan(
                            text: rating.toStringAsFixed(1),
                            style: ThemeText.paragraphBold.copyWith(color: colorScheme(context).onSurface),
                            children: [
                              TextSpan(
                                text: '/10 ',
                                style: ThemeText.paragraph.copyWith(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: setValue(rating),
                                style: ThemeText.paragraph,
                              ),
                              TextSpan(
                                text: ' (${reviews.toStringAsFixed(0)} reviews)',
                                style: ThemeText.paragraph.copyWith(
                                  color: colorScheme(context).onSurfaceVariant,
                                ),
                              ),
                            ],
                          ),
                        ),
                        
                        /// FACILITIES
                        Row(children: [
                          facility1 != null ? _facilityTag(context, facility1!, colorScheme(context).primaryContainer) : Container(),
                          SizedBox(width: 4),
                          facility2 != null ? _facilityTag(context, facility2!, colorScheme(context).secondaryContainer) : Container(),
                        ])
                      ]),
                  
                      /// PRICE
                      Column(crossAxisAlignment: CrossAxisAlignment.end, mainAxisAlignment: MainAxisAlignment.end, children: [
                        additionalWidget != null ? additionalWidget! : Container(),
                        SizedBox(height: 4),
                        discount > 0 ? Padding(
                          padding: const EdgeInsets.only(bottom: 4.0),
                          child: Text('\$${price.toStringAsFixed(2)}', style: ThemeText.paragraph.copyWith(decoration: TextDecoration.lineThrough, color: colorScheme(context).onSurfaceVariant)),
                        ) : Container(),
                        Text(finalPrice(), style: ThemeText.subtitle)
                      ]),
                    ])
                  ]),
                ),
              ],
            )
          )
        ),
      ),

      /// IMAGE THUMBNAIL
      SizedBox(
        width: thumbSize,
        child: ClipRRect(
          borderRadius: ThemeRadius.small,
          child: Stack(
            children: [
              /// IMAGE
              Image.network(
                image,
                fit: BoxFit.cover,
                width: thumbSize,
                height: thumbSize,
                loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) return child;
                  return SizedBox(
                    width: thumbSize,
                    height: thumbSize,
                    child: ShimmerPreloader()
                  );
                },
              ),
        
              /// LEFT LABEL
              label != null ? Positioned(
                top: spacingUnit(1),
                left: spacingUnit(1),
                child: ClipRRect(
                  borderRadius: ThemeRadius.small,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                      decoration: BoxDecoration(
                        borderRadius: ThemeRadius.small,
                        color: colorScheme(context).surface.withValues(alpha: 0.65),
                      ),
                      child: Text(label!, style: ThemeText.caption.copyWith(fontWeight: FontWeight.w600),)
                    )
                  ),
                ),
              ) : Container(),
        
              /// DISCOUNT LABEL
              discount > 0 ? Positioned(
                top: 0,
                right: 0,
                child: Container(
                  width: 50,
                  height: 50,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: ThemePalette.tertiaryLight,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(60),
                    )
                  ),
                  child: Text('$discount% OFF', textAlign: TextAlign.end, style: ThemeText.paragraphBold.copyWith(color: ThemePalette.primaryMain, height: 1.1))
                )
              ) : SizedBox.shrink(),
            ],
          ),
        ),
      ),
    ]);
  }

  Widget _facilityTag(BuildContext context, String facility, Color color) {
    return Container(
      margin: EdgeInsets.only(top: 4),
      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      decoration: BoxDecoration(
        color: color,
        borderRadius: ThemeRadius.medium
      ),
      child: Text(facility, textAlign: TextAlign.center, overflow: TextOverflow.ellipsis, maxLines: 1, style: ThemeText.caption.copyWith(color: colorScheme(context).onSurface.withValues(alpha: 0.75))),
    );
  }
}