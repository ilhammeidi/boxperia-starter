import 'package:booking_app/models/booking_homestay.dart';
import 'package:booking_app/models/booking_hotel.dart';
import 'package:booking_app/models/booking_workspace.dart';
import 'package:booking_app/ui/themes/theme_breakpoints.dart';
import 'package:booking_app/ui/themes/theme_spacing.dart';
import 'package:booking_app/ui/themes/theme_text.dart';
import 'package:booking_app/widgets/cards/ticket_card.dart';
import 'package:booking_app/widgets/cards/ticket_wide_card.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class BookedHotelList extends StatelessWidget {
  const BookedHotelList({super.key, required this.bookingList, this.detailLink, this.eVoucheLink});

  final List<BookingHotel> bookingList;
  final String? detailLink;
  final String? eVoucheLink; 

  @override
  Widget build(BuildContext context) {
    final bool wideScreen = ThemeBreakpoints.smUp(context);

    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
      physics: const ClampingScrollPhysics(),
      itemCount: bookingList.length,
      itemBuilder: ((BuildContext context, int index) {
        BookingHotel item = bookingList[index];
        return Padding(
          padding: EdgeInsets.only(bottom: spacingUnit(2)),
          child: wideScreen ? TicketWideCard(
            dateOrder: item.dateOrder,
            bookingCode: 'ABCDE${item.id}',
            startDate: item.checkin,
            endDate: item.checkout,
            status: item.status,
            timeLeft: '2d 11h',
            price: item.price,
            withDetail: true,
            title: item.room!.name,
            thumb: item.room!.photos[0],
            amenities: item.room!.amenities,
            size: item.room!.size,
            capacity: item.room!.maxGuest,
            withCover: true,
            cover: item.hotel!.thumbnail,
            coverTitle: item.hotel!.name,
            type: 'Hotel',
            trailing: Row(children: [
              Icon(Icons.star, color: Colors.white, size: 16),
              Text(' ${item.hotel!.stars}', style: ThemeText.subtitle2.copyWith(color: Colors.white),)
            ]),
            showDetail: () {
              if (detailLink != null) {
                Get.toNamed(detailLink!);
              }
            },
            showEVoucher: () {
              if (eVoucheLink != null) {
                Get.toNamed(eVoucheLink!);
              }
            },
          ) : TicketCard(
            dateOrder: item.dateOrder,
            bookingCode: 'ABCDE${item.id}',
            startDate: item.checkin,
            endDate: item.checkout,
            status: item.status,
            timeLeft: '2d 11h',
            price: item.price,
            withDetail: true,
            title: item.room!.name,
            thumb: item.room!.photos[0],
            amenities: item.room!.amenities,
            size: item.room!.size,
            capacity: item.room!.maxGuest,
            withCover: true,
            cover: item.hotel!.thumbnail,
            coverTitle: item.hotel!.name,
            type: 'Hotel',
            trailing: Row(children: [
              Icon(Icons.star, color: Colors.white, size: 16),
              Text(' ${item.hotel!.stars}', style: ThemeText.subtitle2.copyWith(color: Colors.white),)
            ]),
            showDetail: () {
              if (detailLink != null) {
                Get.toNamed(detailLink!);
              }
            },
            showEVoucher: () {
              if (eVoucheLink != null) {
                Get.toNamed(eVoucheLink!);
              }
            },
          ),
        );
      }),
    );
  }
}

class BookedHomestayList extends StatelessWidget {
  const BookedHomestayList({super.key, required this.bookingList, this.detailLink, this.eVoucheLink});

  final List<BookingHomestay> bookingList;
  final String? detailLink;
  final String? eVoucheLink; 

  @override
  Widget build(BuildContext context) {
    final bool wideScreen = ThemeBreakpoints.smUp(context);

    int setSize(String size) {
      switch(size) {
        case 'xsmall':
          return 40;
        case 'small':
          return 60;
        case 'medium':
          return 100;
        case 'large':
          return 200;
        case 'xlarge':
          return 500;
        default:
          return 50;
      }
    }

    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
      physics: const ClampingScrollPhysics(),
      itemCount: bookingList.length,
      itemBuilder: ((BuildContext context, int index) {
        BookingHomestay item = bookingList[index];
        return Padding(
          padding: EdgeInsets.only(bottom: spacingUnit(2)),
          child: wideScreen ? TicketWideCard(
            dateOrder: item.dateOrder,
            bookingCode: 'ABCDE${item.id}',
            startDate: item.checkin,
            endDate: item.checkout,
            status: item.status,
            timeLeft: '2d 11h',
            price: item.price,
            withDetail: true,
            title: '3 Guests - ${item.homestay!.bedRooms} Beds',
            thumb: item.homestay!.thumbnail,
            amenities: item.homestay!.facilities,
            size: setSize(item.homestay!.size),
            capacity: item.homestay!.capacity,
            withCover: true,
            cover: item.homestay!.thumbnail,
            coverTitle: item.homestay!.name,
            type: 'Homestay',
            showDetail: detailLink != null ? () {
              Get.toNamed(detailLink!);
            } : null,
            showEVoucher: eVoucheLink != null ? () {
              Get.toNamed(eVoucheLink!);
            } : null,
          ) : TicketCard(
            dateOrder: item.dateOrder,
            bookingCode: 'ABCDE${item.id}',
            startDate: item.checkin,
            endDate: item.checkout,
            status: item.status,
            timeLeft: '2d 11h',
            price: item.price,
            withDetail: true,
            title: '3 Guests - ${item.homestay!.bedRooms} Beds',
            thumb: item.homestay!.thumbnail,
            amenities: item.homestay!.facilities,
            size: setSize(item.homestay!.size),
            capacity: item.homestay!.capacity,
            withCover: true,
            cover: item.homestay!.thumbnail,
            coverTitle: item.homestay!.name,
            type: 'Homestay',
            showDetail: detailLink != null ? () {
              Get.toNamed(detailLink!);
            } : null,
            showEVoucher: eVoucheLink != null ? () {
              Get.toNamed(eVoucheLink!);
            } : null,
          ),
        );
      }),
    );
  }
}

class BookedWorkspaceList extends StatelessWidget {
  const BookedWorkspaceList({super.key, required this.bookingList, this.detailLink, this.eVoucheLink});

  final List<BookingWorkspace> bookingList;
  final String? detailLink;
  final String? eVoucheLink; 

  @override
  Widget build(BuildContext context) {
    final bool wideScreen = ThemeBreakpoints.smUp(context);

    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
      physics: const ClampingScrollPhysics(),
      itemCount: bookingList.length,
      itemBuilder: ((BuildContext context, int index) {
        BookingWorkspace item = bookingList[index];
        return Padding(
          padding: EdgeInsets.only(bottom: spacingUnit(2)),
          child: wideScreen ? TicketWideCard(
            dateOrder: item.dateOrder,
            bookingCode: 'ABCDE${item.id}',
            startDate: item.startDate,
            endDate: item.endDate,
            status: item.status,
            timeLeft: '2d 11h',
            price: item.price,
            withDetail: true,
            title: item.room!.name,
            thumb: item.room!.photos[0],
            amenities: item.room!.facilities,
            size: item.room!.size,
            capacity: item.room!.guests,
            withCover: true,
            cover: item.workspace!.thumbnail,
            coverTitle: item.workspace!.name,
            type: 'Workspace',
            showDetail: detailLink != null ? () {
              Get.toNamed(detailLink!);
            } : null,
            showEVoucher: eVoucheLink != null ? () {
              Get.toNamed(eVoucheLink!);
            } : null,
          ) : TicketCard(
            dateOrder: item.dateOrder,
            bookingCode: 'ABCDE${item.id}',
            startDate: item.startDate,
            endDate: item.endDate,
            status: item.status,
            timeLeft: '2d 11h',
            price: item.price,
            withDetail: true,
            title: item.room!.name,
            thumb: item.room!.photos[0],
            amenities: item.room!.facilities,
            size: item.room!.size,
            capacity: item.room!.guests,
            withCover: true,
            cover: item.workspace!.thumbnail,
            coverTitle: item.workspace!.name,
            type: 'Workspace',
            showDetail: detailLink != null ? () {
              Get.toNamed(detailLink!);
            } : null,
            showEVoucher: eVoucheLink != null ? () {
              Get.toNamed(eVoucheLink!);
            } : null,
          ),
        );
      }),
    );
  }
}