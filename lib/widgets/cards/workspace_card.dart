import 'package:booking_app/ui/themes/theme_palette.dart';
import 'package:booking_app/ui/themes/theme_radius.dart';
import 'package:booking_app/ui/themes/theme_spacing.dart';
import 'package:booking_app/ui/themes/theme_text.dart';
import 'package:booking_app/utils/shimmer_preloader.dart';
import 'package:flutter/material.dart';

class WorkspaceCard extends StatelessWidget {
  const WorkspaceCard({
    super.key,
    this.label,
    required this.image,
    required this.price,
    required this.title,
    required this.location,
    required this.rating,
    required this.reviews,
  });

  final String? label;
  final String image;
  final double price;
  final String title;
  final String location;
  final double rating;
  final double reviews;

  @override
  Widget build(BuildContext context) {

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      /// IMAGE THUMBNAIL
      Stack(
        children: [
          ClipRRect(
            borderRadius: ThemeRadius.small,
            child: Image.network(
              image,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 100,
              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) return child;
                return const SizedBox(
                  width: double.infinity,
                  height: 100,
                  child: ShimmerPreloader()
                );
              },
            ),
          ),
          Positioned(
            top: spacingUnit(1),
            right: spacingUnit(1),
            child: label != null ? Container(
              decoration: BoxDecoration(
                color: colorScheme(context).secondaryContainer,
                borderRadius: ThemeRadius.small,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: spacingUnit(1), vertical: 2),
                child: Text(label!, style: ThemeText.caption.copyWith(color: colorScheme(context).onSecondaryContainer),)
              ),
            ) : Container(),
          ),
        ],
      ),
      SizedBox(height: spacingUnit(1)),
      
      /// CARD CONTENT
      Text(title, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, height: 1.2), maxLines: 1, overflow: TextOverflow.ellipsis),
      SizedBox(height: spacingUnit(1)),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.end, children: [
        /// WORKSPACE PROPERTIES
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              Icon(Icons.location_on, size: 12, color: colorScheme(context).onSurfaceVariant),
              Expanded(child: Text(location, maxLines: 1, overflow: TextOverflow.ellipsis,  style: ThemeText.caption.copyWith(color: colorScheme(context).onSurfaceVariant))),
            ]),
            SizedBox(height: 4),
            RichText(
              text: TextSpan(
                text: rating.toStringAsFixed(1),
                style: ThemeText.caption.copyWith(fontWeight: FontWeight.bold, color: colorScheme(context).onSurface),
                children: [
                  TextSpan(
                    text: '/5',
                    style: ThemeText.caption.copyWith(fontWeight: FontWeight.bold),
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
          ]),
        ),

        /// PRICE & DISCOUNT
        Column(crossAxisAlignment: CrossAxisAlignment.end, mainAxisAlignment: MainAxisAlignment.end, children: [
          Text('Start from', style: ThemeText.caption.copyWith(color: colorScheme(context).onSurfaceVariant)),
          SizedBox(height: 4),
          Text('\$${price.toStringAsFixed(2)}', style: ThemeText.subtitle2.copyWith(height: 1))
        ]),
      ])
    ]);
  }
}