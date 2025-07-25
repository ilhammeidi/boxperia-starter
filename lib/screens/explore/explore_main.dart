import 'package:booking_app/constants/img_api.dart';
import 'package:booking_app/widgets/explore/promo_list_slider.dart';
import 'package:booking_app/widgets/homestay/basic_home_slider.dart';
import 'package:booking_app/widgets/hotel/basic_hotel_slider.dart';
import 'package:booking_app/widgets/workspace/basic_workspace_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:booking_app/widgets/explore/ads_banner.dart';
import 'package:booking_app/ui/themes/theme_spacing.dart';
import 'package:booking_app/widgets/explore/banner.dart';
import 'package:booking_app/widgets/explore/header.dart';
import 'package:booking_app/widgets/explore/search.dart';

class ExploreMain extends StatelessWidget {
  const ExploreMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: Stack(
            alignment: Alignment.topCenter,
            children: [
              /// BANNER ILLLUSTRATION
              BannerExplore(),
              /// HEADER
              Positioned(
                child: SizedBox(child: HeaderExplore())
              ),
            ],
          )),
          /// MINI MAP
          SliverStickyHeader.builder(
            builder: (context, state) {
              /// SEARCH
              return const SearchExplore();
            },
            /// PROMO AND EVENT LIST
            sliver: SliverList(delegate: SliverChildListDelegate([
              /// PROMO
              const VSpace(),
              const PromoListSlider(),

              /// EXPLORE HOTEL
              const BasicHotelSlider(),
              const VSpace(),
              AdsBanner(img: ImgApi.photo[200]),
              const VSpaceBig(),
              
              /// EXPLORE HOMESTAY
              const BasicHomeSlider(),
              const VSpace(),
              AdsBanner(img: ImgApi.photo[196]),
              const VSpaceBig(),

              /// EXPLORE WORKSPACE
              const BasicWorkspaceSlider(),
              AdsBanner(img: ImgApi.photo[205]),
              const VSpaceBig(),
            ]))
          ),
        ],
      )
    );
  }
}