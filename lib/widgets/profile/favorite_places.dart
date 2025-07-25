import 'package:booking_app/app/app_link.dart';
import 'package:booking_app/constants/img_api.dart';
import 'package:booking_app/ui/themes/theme_breakpoints.dart';
import 'package:booking_app/ui/themes/theme_palette.dart';
import 'package:booking_app/utils/shimmer_preloader.dart';
import 'package:booking_app/widgets/title/title_action.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:booking_app/ui/themes/theme_button.dart';
import 'package:booking_app/ui/themes/theme_radius.dart';
import 'package:booking_app/ui/themes/theme_spacing.dart';

class FavoritePlaces extends StatelessWidget {
  const FavoritePlaces({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> favThumbs = [ImgApi.photo[20], ImgApi.photo[65], ImgApi.photo[76], ImgApi.photo[81], ImgApi.photo[115], ImgApi.photo[130], ImgApi.photo[116], ImgApi.photo[131]];
    final bool wideScreen = ThemeBreakpoints.smUp(context);

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
          padding: EdgeInsets.all(spacingUnit(1)),
          decoration: BoxDecoration(
            borderRadius: ThemeRadius.small,
            color: colorScheme(context).surfaceDim
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(spacingUnit(1)),
                child: TitleAction(
                  title: 'Your Favorite Places',
                  textAction: '+ New Booking',
                  desc: 'You have ${favThumbs.length} items',
                  onTap: () {
                    Get.toNamed(AppLink.search);
                  }
                ),
              ),
              SizedBox(height: spacingUnit(1),),
              GridView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.only(
                  bottom: spacingUnit(2)
                ),
                physics: const ClampingScrollPhysics(),
                itemCount: wideScreen ? 8 : 6,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1,
                  crossAxisCount: wideScreen ? 4 : 3,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 2,
                ),
                itemBuilder: (context, index) {
                  String item = favThumbs[index];
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed(AppLink.hotelDetail);
                    },
                    child: ClipRRect(
                      borderRadius: ThemeRadius.xsmall,
                      child: Image.network(
                        item,
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                        loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const SizedBox(
                            width: 320,
                            height: 320,
                            child: ShimmerPreloader()
                          );
                        },
                      ),
                    )
                  );
                }
              ),
            ],
          )
        ),
        Container(
          padding: EdgeInsets.all(spacingUnit(1)),
          height: 100,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                colorScheme(context).surfaceContainerLowest.withValues(alpha: 0),
                colorScheme(context).surfaceContainerLowest,
              ]
            )
          ),
          alignment: Alignment.bottomCenter,
          child: FilledButton(
            onPressed: () {
              Get.toNamed(AppLink.favorites);
            },
            style: ThemeButton.invert(context),
            child: Text('Show All'.toUpperCase()),
          )
        )
      ],
    );
  }
}