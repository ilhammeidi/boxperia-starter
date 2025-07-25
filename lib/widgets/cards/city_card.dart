import 'package:booking_app/ui/themes/theme_radius.dart';
import 'package:booking_app/ui/themes/theme_shadow.dart';
import 'package:booking_app/ui/themes/theme_spacing.dart';
import 'package:booking_app/ui/themes/theme_text.dart';
import 'package:booking_app/utils/shimmer_preloader.dart';
import 'package:flutter/material.dart';

class CityCard extends StatelessWidget {
  const CityCard({super.key, required this.photo, required this.name, required this.totalHotel, required this.totalHomestay, required this.totalWorkspace});

  final String photo;
  final String name;
  final double totalHotel;
  final double totalHomestay;
  final double totalWorkspace;

  @override
  Widget build(BuildContext context) {
    final double thumbSize = 50;

    return Padding(
      padding: EdgeInsets.all(2),
      child: Row(
        children: [
          /// PHOTO
          Container(
            width: thumbSize,
            height: thumbSize,
            decoration: BoxDecoration(
              borderRadius: ThemeRadius.small,
              boxShadow: [ThemeShade.shadeMedium(context)],
            ),
            child: ClipRRect(
              borderRadius: ThemeRadius.small,
              child: Image.network(
                photo,
                fit: BoxFit.cover,
                loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) return child;
                  return SizedBox(
                    width: thumbSize,
                    height: thumbSize,
                    child: ShimmerPreloader()
                  );
                },
              ),
            ),
          ),
          SizedBox(width: spacingUnit(1),),

          /// TEXT
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(name, style: ThemeText.paragraphBold),
            const SizedBox(height: 4),
            Row(children: [
              Icon(Icons.business_outlined, size: 14),
              Text(' ${totalHotel.toString()}', style: ThemeText.caption,),
              SizedBox(width: spacingUnit(1),),

              Icon(Icons.home_outlined, size: 14,),
              Text(' ${totalHomestay.toString()}', style: ThemeText.caption,),
              SizedBox(width: spacingUnit(1),),

              Icon(Icons.home_work_outlined, size: 14,),
              Text(' ${totalWorkspace.toString()}', style: ThemeText.caption,),
            ])
          ],)
        ],
      ),
    );
  }
}