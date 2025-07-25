import 'package:booking_app/constants/amenity_const.dart';
import 'package:booking_app/constants/booking_status.dart';
import 'package:booking_app/ui/themes/theme_palette.dart';
import 'package:booking_app/ui/themes/theme_radius.dart';
import 'package:booking_app/ui/themes/theme_spacing.dart';
import 'package:booking_app/ui/themes/theme_text.dart';
import 'package:booking_app/utils/shimmer_preloader.dart';
import 'package:booking_app/widgets/decorations/cut_deco.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:intl/intl.dart';

class TicketCard extends StatelessWidget {
  const TicketCard({
    super.key,
    /// TOP
    required this.dateOrder, required this.bookingCode, 
    required this.startDate, required this.endDate,
    this.color,

    /// COVER
    this.withCover = false, this.cover, this.coverTitle,
    this.type, this.trailing,

    /// BOTTOM
    required this.price, required this.status,
    required this.timeLeft,
    this.showEVoucher, this.showDetail,

    /// DETAIL
    this.withDetail = false,
    this.title, this.thumb,
    this.amenities, this.size,
    this.smoke = false, this.capacity = 1,
  });
  
  /// TOP PROPERTY
  final DateTime dateOrder;
  final String bookingCode;
  final DateTime startDate;
  final DateTime endDate;
  final Color? color;

  /// BOTTOM PROPERTY
  final BookStatus status;
  final String timeLeft;
  final double price;
  final Function()? showEVoucher;
  final Function()? showDetail;

  /// COVER
  final bool withCover;
  final String? cover;
  final String? title;
  final String? type;
  final Widget? trailing;

  /// INFO DETAIL
  final bool withDetail;
  final String? coverTitle;
  final String? thumb;
  final List<String>? amenities;
  final int? size;
  final bool smoke;
  final int capacity;

  @override
  Widget build(BuildContext context) {
    final Color cardColor = color ?? colorScheme(context).outline;
    final bool isDark = Get.isDarkMode;

    Color typeColor(String tp) {
      switch(tp) {
        case 'Hotel':
          return ThemePalette.primaryMain;
        case 'Homestay':
          return ThemePalette.secondaryDark;
        case 'Workspace':
          return ThemePalette.tertiaryDark;
        default:
          return Colors.black;
      }
    }

    return Column(
      children: [
        /// TOP PROPERTIES
        GestureDetector(
          onTap: showDetail,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(10),
              ),
              image: cover != null ? DecorationImage(image: NetworkImage(cover!), fit: BoxFit.cover, colorFilter: ColorFilter.mode(Colors.black.withValues(alpha: 0.35), BlendMode.darken)) : null
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                /// COVER
                withCover ? Padding(
                  padding: EdgeInsets.only(
                    left: spacingUnit(1),
                    right: spacingUnit(1),
                    top: spacingUnit(3),
                    bottom: 4
                  ),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                    Expanded(child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: ThemeRadius.xsmall,
                          ),
                          child: type != null ? Text(type!.toUpperCase(), style: ThemeText.caption.copyWith(fontWeight: FontWeight.bold, color: typeColor(type ?? ''))) : Container(),
                        ),
                        Expanded(child: Text(' $coverTitle ', maxLines: 1, overflow: TextOverflow.ellipsis, style: ThemeText.subtitle2.copyWith(color: Colors.white),)),
                      ],
                    )),
                    SizedBox(width: spacingUnit(1)),
                    trailing != null ? trailing! : Container(),
                  ]),
                ) : Container(),

                /// CARD CONTENTS
                Container(
                  decoration: BoxDecoration(
                    color: isDark ? ThemePalette.defaultDark : ThemePalette.paperLight,
                    boxShadow: [BoxShadow(
                    color: colorScheme(context).surfaceContainerLowest,
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                    offset: const Offset(0, 2),
                  )],
                    border: Border(
                      top: BorderSide(color: cardColor, width: 1),
                      left: BorderSide(color: cardColor, width: 1),
                      right: BorderSide(color: cardColor, width: 1),
                    ),
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(10),
                    )
                  ),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    /// TOP INFO
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: spacingUnit(2), vertical: spacingUnit(1)),
                      child: Row(children: [
                        Text('Date Order: ', style: ThemeText.caption.copyWith(color: colorScheme(context).onSurfaceVariant)),
                        Text(DateFormat.MMMEd().format(dateOrder), style: ThemeText.paragraph.copyWith(fontWeight: FontWeight.bold)),
                        const Spacer(),
                        status != BookStatus.waiting ? Text('Booking Code: ', style: ThemeText.caption.copyWith(color: colorScheme(context).onSurfaceVariant)) : Container(),
                        status != BookStatus.waiting ? Text(bookingCode, style: ThemeText.paragraph.copyWith(fontWeight: FontWeight.bold)) : Container(),
                      ]),
                    ),
                
                    /// BOOKING DETAIL
                    withDetail ? Padding(
                      padding: EdgeInsets.all(spacingUnit(2)),
                      child: Row(children: [
                        ClipRRect(
                          borderRadius: ThemeRadius.small,
                          child: Image.network(
                            thumb!,
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                            loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) return child;
                              return const SizedBox(
                                width: 80,
                                height: 80,
                                child: ShimmerPreloader()
                              );
                            },
                          ),
                        ),
                        SizedBox(width: spacingUnit(1)),
                        Expanded(
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            Text(title!, style: ThemeText.subtitle2,),
                            SizedBox(height: spacingUnit(1)),
                            Row(children: [
                              Icon(Icons.picture_in_picture_alt, size: 16, color: colorScheme(context).onSurface),
                              Text(' $size m\u00B2', style: ThemeText.paragraph,),
                              SizedBox(width: spacingUnit(2)),
                              smoke ? Icon(Icons.smoking_rooms, size: 16, color: colorScheme(context).onSurface) : Icon(Icons.smoke_free, size: 16, color: colorScheme(context).onSurface),
                              Text(smoke ? ' Smoking' : ' Non-smoking', style: ThemeText.paragraph,),
                            ]),
                            SizedBox(height: spacingUnit(1)),
                            Row(children: [
                              _buildFacilities(context, amenities!),
                              SizedBox(width: spacingUnit(2)),
                              Icon(Icons.group, size: 16, color: colorScheme(context).onSurface),
                              Text(' $capacity', style: ThemeText.paragraph,)
                            ]),
                          ]),
                        ),
                      ]),
                    ) : Container(),
                  ]),
                ),
              ],
            ),
          ),
        ),
    
        /// CUT DECO
        CutDeco(borderColor: cardColor),
    
        /// BOTTOM INFO
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: cardColor
          ),
          child: Column(
            children: [
              /// PRICE AND STATUS 
              GestureDetector(
                onTap: showDetail,
                child: Container(
                  padding: EdgeInsets.all(spacingUnit(1)),
                  decoration: BoxDecoration(
                    color: colorScheme(context).surfaceContainerLowest,
                    border: Border(
                      bottom: BorderSide(color: cardColor, width: 1),
                      left: BorderSide(color: cardColor, width: 1),
                      right: BorderSide(color: cardColor, width: 1),
                    ),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    )
                  ),
                  child: Row(crossAxisAlignment: CrossAxisAlignment.end, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    /// TIME LEFT AND STATUS
                    _ticketStatus(context, status),
                
                    /// PRICE
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('Total Price', textAlign: TextAlign.end, style: ThemeText.caption.copyWith(color: colorScheme(context).onSurfaceVariant)),
                        SizedBox(width: spacingUnit(1)),
                        Text('\$$price', textAlign: TextAlign.end, style: ThemeText.subtitle),
                      ],
                    ),
                  ]),
                ),
              ),

              /// SHOW E-TICKET BUTTON
              status == BookStatus.active ? GestureDetector(
                onTap: showEVoucher,
                child: Padding(
                  padding: EdgeInsets.all(spacingUnit(1)),
                  child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Icon(Icons.qr_code, size: 16),
                    SizedBox(width: spacingUnit(1)),
                    Text('SHOW E-TICKET', style: ThemeText.paragraph.copyWith(fontWeight: FontWeight.bold)),
                  ]),
                ),
              ) : Container()
            ],
          ),
        ),
      ],
    );
  }

  Widget _ticketStatus(BuildContext context, BookStatus status) {
    Color colorStatus(BookStatus st) {
      switch(st) {
        case BookStatus.active:
          return Colors.green;
        case BookStatus.waiting:
          return Colors.orange;
        case BookStatus.canceled:
          return Colors.red;
        default:
          return Colors.grey;
      }
    }

    switch(status) {
      case BookStatus.active:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Check in available in', textAlign: TextAlign.start, style: ThemeText.caption.copyWith(color: colorScheme(context).onSurfaceVariant)),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
              decoration: BoxDecoration(
                borderRadius: ThemeRadius.small,
                color: colorStatus(status).withValues(alpha: 0.15),
              ),
              child: Row(children: [
                const Icon(Icons.access_time, size: 16),
                const SizedBox(width: 4),
                Text(timeLeft, textAlign: TextAlign.center, style: ThemeText.subtitle),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                  decoration: BoxDecoration(
                    borderRadius: ThemeRadius.small,
                    color: colorStatus(status),
                  ),
                  child: Text(status.name.toUpperCase(), style: ThemeText.caption.copyWith(fontWeight: FontWeight.bold, color: Colors.white)),
                ),
              ]),
            )
          ],
        );
      case BookStatus.waiting:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Expired in', textAlign: TextAlign.start, style: ThemeText.caption.copyWith(color: colorScheme(context).onSurfaceVariant)),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
              decoration: BoxDecoration(
                borderRadius: ThemeRadius.small,
                color: colorStatus(status).withValues(alpha: 0.25),
              ),
              child: Row(children: [
                const Icon(Icons.access_time, size: 16),
                const SizedBox(width: 4),
                Text(timeLeft, textAlign: TextAlign.center, style: ThemeText.subtitle),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                  decoration: BoxDecoration(
                    borderRadius: ThemeRadius.small,
                    color: colorStatus(status),
                  ),
                  child: Text(status.name.toUpperCase(), style: ThemeText.caption.copyWith(fontWeight: FontWeight.bold, color: Colors.white)),
                ),
              ]),
            )
          ],
        );
      default:
        return Container(
          padding: EdgeInsets.all(spacingUnit(1)),
          decoration: BoxDecoration(
            borderRadius: ThemeRadius.small,
            color: colorStatus(status).withValues(alpha: 0.25),
          ),
          child: Text(status.name.toUpperCase(), style: ThemeText.caption.copyWith(fontWeight: FontWeight.bold),),
        );
    }
  }

   Widget _buildFacilities(BuildContext context, List<String> facilities) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: facilities.asMap().entries.map<Widget>((entry) {
      String item = entry.value;
      int index = entry.key;

      return index <= 5 ? Padding(
        padding: EdgeInsets.symmetric(horizontal: 4),
        child: Icon(amenityIcon[item], size: 16, color: colorScheme(context).onSurface)
      ) : Container();
    }).toList());
  }
}