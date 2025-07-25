import 'package:booking_app/app/app_link.dart';
import 'package:booking_app/constants/img_api.dart';
import 'package:booking_app/models/booking_homestay.dart';
import 'package:booking_app/models/booking_hotel.dart';
import 'package:booking_app/models/booking_workspace.dart';
import 'package:booking_app/ui/themes/theme_breakpoints.dart';
import 'package:booking_app/ui/themes/theme_button.dart';
import 'package:booking_app/ui/themes/theme_palette.dart';
import 'package:booking_app/ui/themes/theme_spacing.dart';
import 'package:booking_app/ui/themes/theme_text.dart';
import 'package:booking_app/utils/no_data.dart';
import 'package:booking_app/widgets/booking/booked_list.dart';
import 'package:booking_app/widgets/booking/tag_filter.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class BookingListScreen extends StatefulWidget {
  const BookingListScreen({super.key});

  @override
  State<BookingListScreen> createState() => _BookingListScreenState();
}

class _BookingListScreenState extends State<BookingListScreen> {
  String _selected = 'All';

  @override
  Widget build(BuildContext context) {
    final bool isDark = Get.isDarkMode;
    final bool wideScreen = ThemeBreakpoints.smUp(context);
    final double filterHeight = 70;

    return Scaffold(
      extendBody: true,
      body: CustomScrollView(
        slivers: <Widget>[
          /// SLIVER APPBAR AND BANNER
          SliverAppBar(
            expandedHeight: 220,
            collapsedHeight: 110,
            floating: true,
            pinned: true,
            toolbarHeight: 80,
            centerTitle: false,
            backgroundColor: colorScheme(context).surfaceDim,
            automaticallyImplyLeading: false,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    colorScheme(context).primaryContainer,
                    isDark ? ThemePalette.tertiaryDark : ThemePalette.secondaryLight,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight
                ),
              ),
              child: FlexibleSpaceBar(
                titlePadding: EdgeInsets.all(spacingUnit(2)),
                background: Image.asset(
                  wideScreen ? ImgApi.myTicketBannerBig : ImgApi.myTicketBanner,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              )
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(filterHeight),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// INFO
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: spacingUnit(2), vertical: spacingUnit(1)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('My Bookings', style: ThemeText.title),
                            SizedBox(
                              width: 32,
                              height: 32,
                              child: IconButton(
                                onPressed: () {
                                  Get.toNamed(AppLink.bookingHistory);
                                },
                                style: ThemeButton.iconBtn(context),
                                icon: Icon(Icons.history, size: 24, color: colorScheme(context).onSurface)
                              ),
                            )
                          ],
                        ),
                        Text(
                          'All your active bookings and waiting for payment',
                          textAlign: TextAlign.start,
                          style: ThemeText.headline
                        ),
                      ],
                    ),
                  ),
              
                  /// TAG FILTER AND DECORATION
                  Container(
                    height: filterHeight,
                    decoration: BoxDecoration(
                      color: colorScheme(context).surfaceContainerLowest,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: colorScheme(context).surfaceContainerLowest,
                          offset: const Offset(0, 2),
                          blurRadius: 0,
                          spreadRadius: 0
                        )
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: spacingUnit(2)),
                      child: TagFilter(
                        selected: _selected,
                        onPress: (String item) {
                          setState(() {
                            _selected = item;
                          });
                        },
                      ),
                    )
                  )
                ],
              ),
            ),
          ),

          /// CONTENT
          SliverToBoxAdapter(
            child: ListView(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              children: [
                SizedBox(height: spacingUnit(1)),
                bookingHotelList.isEmpty && bookingHomestayList.isEmpty && bookingWorkspaceList.isEmpty ?
                  NoData(
                    image: ImgApi.emptyBooking,
                    title: 'No Booking Yet',
                    desc: 'Nulla condimentum pulvinar arcu a pellentesque.',
                  ) : Container(),
                _selected == 'Hotels' || _selected == 'All' ? BookedHotelList(bookingList: bookingHotelList.sublist(1, 2), detailLink: AppLink.bookedHotelDetail, eVoucheLink: AppLink.eTicketHotel) : Container(),
                _selected == 'Homestays' || _selected == 'All' ? BookedHomestayList(bookingList: bookingHomestayList.sublist(0, 1), detailLink: AppLink.bookedHomestayDetail, eVoucheLink: AppLink.eTicketHomestay) : Container(),
                _selected == 'Workspaces' || _selected == 'All' ? BookedWorkspaceList(bookingList: bookingWorkspaceList.sublist(1, 2), detailLink: AppLink.bookedWorkspaceDetail, eVoucheLink: AppLink.eTicketWorkspace) : Container(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {
                      Get.toNamed(AppLink.search);
                    },
                    style: ThemeButton.btnBig.merge(ThemeButton.outlinedPrimary(context)),
                    child: Text('FIND PLACE & ADD MORE BOOKING', style: ThemeText.subtitle2,)
                  ),
                ),
                VSpaceBig(),
              ],
            )
          )
        ],
      ),
    );
  }
}