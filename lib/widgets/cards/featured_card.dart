import 'dart:ui';

import 'package:booking_app/ui/themes/theme_palette.dart';
import 'package:booking_app/ui/themes/theme_radius.dart';
import 'package:booking_app/ui/themes/theme_spacing.dart';
import 'package:booking_app/ui/themes/theme_text.dart';
import 'package:booking_app/utils/shimmer_preloader.dart';
import 'package:booking_app/widgets/cards/paper_card.dart';
import 'package:flutter/material.dart';

class FeaturedCard extends StatelessWidget {
  const FeaturedCard({
    super.key,
    this.label, required this.image, this.discount = 0,
    required this.title,
    required this.location, required this.rating, required this.reviews,
    this.additionalWidget, required this.price,
    this.facility1, this.facility2,
    this.biggerThumb = false,
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
  final bool biggerThumb;

  @override
  Widget build(BuildContext context) {
    double thumbHeight = biggerThumb ? 150 : 120;
    double cardHeight = biggerThumb ? 230 : 200;

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

    return Stack(children: [
      /// CARD CONTENT
      Container(
        margin: EdgeInsets.only(top: 20),
        height: cardHeight,
        child: PaperCard(
          content: Padding(
            padding: EdgeInsets.all(spacingUnit(1)),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.end, children: [
              SizedBox(height: 80),
              Text(title, overflow: TextOverflow.ellipsis, maxLines: 1, style: ThemeText.paragraphBold,),
              SizedBox(height: spacingUnit(1)),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.end, children: [
                /// PROPERTIES
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    /// LOCATION
                    Row(children: [
                      Icon(Icons.location_on, size: 14, color: colorScheme(context).onSurfaceVariant),
                      SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          location,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: ThemeText.caption.copyWith(color: colorScheme(context).onSurfaceVariant)
                        ),
                      ),
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
                            style: ThemeText.caption.copyWith(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: setValue(rating),
                            style: ThemeText.caption,
                          ),
                          TextSpan(
                            text: ' (${reviews.toStringAsFixed(0)} reviews)',
                            style: ThemeText.caption.copyWith(
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
                ),
                SizedBox(width: 4),

                /// PRICE
                Column(crossAxisAlignment: CrossAxisAlignment.end, mainAxisAlignment: MainAxisAlignment.end, children: [
                  additionalWidget != null ? additionalWidget! : Container(),
                  SizedBox(height: 4),
                  discount > 0 ? Text('\$${price.toStringAsFixed(2)}', style: ThemeText.caption.copyWith(decoration: TextDecoration.lineThrough, color: colorScheme(context).onSurfaceVariant)) : Container(),
                  Text(finalPrice(), style: ThemeText.subtitle2)
                ]),
              ])
            ])
          )
        ),
      ),

      /// IMAGE THUMBNAIL
      Padding(
        padding: EdgeInsets.symmetric(horizontal: spacingUnit(1)),
        child: ClipRRect(
          borderRadius: ThemeRadius.small,
          child: Stack(
            children: [
              /// IMAGE
              Image.network(
                image,
                fit: BoxFit.cover,
                width: double.infinity,
                height: thumbHeight,
                loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) return child;
                  return SizedBox(
                    width: double.infinity,
                    height: thumbHeight,
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
                      child: Text(label!, style: biggerThumb ? ThemeText.paragraphBold : ThemeText.caption.copyWith(fontWeight: FontWeight.w600),)
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
                  child: Text('${discount.toStringAsFixed(0)}% OFF', textAlign: TextAlign.end, style: ThemeText.paragraphBold.copyWith(color: ThemePalette.primaryMain, height: 1.1))
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
      constraints: BoxConstraints(maxWidth: biggerThumb ? double.infinity : 80),
      margin: EdgeInsets.only(top: 4),
      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: ThemeRadius.medium
      ),
      child: Text(facility, textAlign: TextAlign.center, overflow: TextOverflow.ellipsis, maxLines: 1, style: ThemeText.caption.copyWith(color: colorScheme(context).onSurface)),
    );
  }
}