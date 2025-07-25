import 'package:booking_app/app/app_link.dart';
import 'package:booking_app/models/city.dart';
import 'package:booking_app/ui/themes/theme_palette.dart';
import 'package:booking_app/ui/themes/theme_radius.dart';
import 'package:booking_app/ui/themes/theme_spacing.dart';
import 'package:booking_app/widgets/cards/city_card.dart';
import 'package:booking_app/widgets/title/title_basic.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class CityDestinations extends StatelessWidget {
  const CityDestinations({super.key});

  @override
  Widget build(BuildContext context) {
    final List<City> recomendedCityList = cityList.sublist(4, 20);

    return Container(
      decoration: BoxDecoration(
        color: colorScheme(context).surfaceContainerLowest,
        borderRadius: ThemeRadius.medium
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
            child: const TitleBasic(title: 'Popular Destinations'),
          ),
          SizedBox(
            height: 180,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(spacingUnit(2)),
              separatorBuilder: (context, index) => SizedBox(width: spacingUnit(1)),
              itemCount: 6,
              itemBuilder: (context, index) {
                final City topItem = recomendedCityList[index * 2];
                final City bottomItem = recomendedCityList[index * 2 + 1];
                final double cardWidth = 210;
      
                return Column(
                  children: [
                    SizedBox(
                      width: cardWidth,
                      child: InkWell(
                        onTap: () {
                          Get.toNamed(AppLink.search);
                        },
                        child: CityCard(
                          photo: topItem.photos[0],
                          name: topItem.name,
                          totalHotel: topItem.totalHotel,
                          totalHomestay: topItem.totalHomestay,
                          totalWorkspace: topItem.totalWorkspace
                        )
                      ),
                    ),
                    SizedBox(height: spacingUnit(1),),
                    SizedBox(
                      width: cardWidth,
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(AppLink.search);
                        },
                        child: CityCard(
                          photo: bottomItem.photos[0],
                          name: bottomItem.name,
                          totalHotel: bottomItem.totalHotel,
                          totalHomestay: bottomItem.totalHomestay,
                          totalWorkspace: bottomItem.totalWorkspace
                        )
                      ),
                    ),
                  ],
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}