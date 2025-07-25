import 'package:booking_app/app/app_link.dart';
import 'package:booking_app/utils/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:booking_app/constants/app_const.dart';
import 'package:booking_app/ui/themes/theme_palette.dart';
import 'package:booking_app/widgets/cards/paper_card.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:booking_app/ui/themes/theme_spacing.dart';
import 'package:booking_app/ui/themes/theme_text.dart';
import 'package:booking_app/widgets/settings/account_info.dart';
import 'package:booking_app/widgets/title/title_basic.dart';

class SettingList extends StatelessWidget {
  SettingList({super.key}) {
     _getThemeStatus();
  }

  final RxString _themeMode = 'auto'.obs;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  _getThemeStatus() async {
    var mode = _prefs.then((SharedPreferences prefs) {
      return prefs.getString('appTheme') ?? 'auto';
    }).obs;

    _themeMode.value = await mode.value;
  }

  _saveThemeStatus(val) async {
    SharedPreferences pref = await _prefs;

    _themeMode.value = val;

    switch(val) {
      case 'dark':
        pref.setString('appTheme', val);
        Get.changeThemeMode(ThemeMode.dark);
      break;
      case 'light':
        pref.setString('appTheme', 'light');
        Get.changeThemeMode(ThemeMode.light);
      break;
      default:
        pref.setString('appTheme', 'auto');
        pref.remove('appTheme');
        
        var brightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;
        bool isDarkMode = brightness == Brightness.dark;
        Get.changeThemeMode(isDarkMode ? ThemeMode.dark : ThemeMode.light);
      break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.all(spacingUnit(2)),
      children: [
        /// UI SETTINGS
        const TitleBasicSmall(title: 'UI Settings'),
        PaperCard(content:
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              ListTile(
                leading: Icon(Icons.brightness_6_outlined, color: colorScheme(context).onSurface),
                title: const Text('Auto'),
                onTap: () {
                  _saveThemeStatus('auto');
                },
                trailing: Obx(() => _themeMode.value == 'auto' ?  Icon(Icons.check_circle, color: ThemePalette.primaryMain) : const Icon(Icons.circle_outlined)),
              ),
              const LineList(),
              ListTile(
                leading: Icon(Icons.dark_mode, color: colorScheme(context).onSurface),
                title: const Text('Dark Mode'),
                onTap: () {
                  _saveThemeStatus('dark');
                },
                trailing: Obx(() => _themeMode.value == 'dark' ? Icon(Icons.check_circle, color: ThemePalette.primaryMain) : const Icon(Icons.circle_outlined)),
              ),
              const LineList(),
              ListTile(
                leading: Icon(Icons.light_mode, color: colorScheme(context).onSurface),
                title: const Text('Light Mode'),
                onTap: () {
                  _saveThemeStatus('light');
                },
                trailing: Obx(() => _themeMode.value == 'light' ? Icon(Icons.check_circle, color: ThemePalette.primaryMain) : const Icon(Icons.circle_outlined) ),
              ),
            ]),
          )
        ),
        const VSpace(),

        /// AUTH PAGES
        const TitleBasicSmall(title: 'Auth Pages'),
        PaperCard(content:
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
               ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.waving_hand_outlined),
                title: const Text('Welcome Page'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed('/welcome');
                },
               ),
               const LineList(),
               ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.account_circle_outlined),
                title: const Text('Login'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed('/login');
                },
               ),
               const LineList(),
               ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.account_box_outlined),
                title: const Text('Register'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed('/register');
                },
               ),
               const LineList(),
               ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.pin),
                title: const Text('Pin OTP'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed('/otp');
                },
               ),
               const LineList(),
               ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.key_sharp),
                title: const Text('Reset Password'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed('/reset-password');
                },
               ),
            ])
          )
         ),
         const VSpace(),

        /// ACCOUNT SETTING
        const TitleBasicSmall(title: 'Help and Account'),
        PaperCard(content:
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.person),
                title: const Text('Account Information'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      return const Wrap(
                        children: [
                          AccountInfo()
                        ],
                      );
                    }
                  );
                },
              ),
              const LineList(),
              ListTile(
                onTap: () {
                  Get.toNamed('/faq');
                },
                leading: Icon(color: colorScheme(context).onSurface, Icons.help_outline),
                title: const Text('FAQ'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
              ),
              const LineList(),
              ListTile(
                onTap: () {
                  Get.toNamed('/contact');
                },
                leading: Icon(color: colorScheme(context).onSurface, Icons.message_outlined),
                title: const Text('Contact Admin'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
              ),
              const LineList(),
              ListTile(
                onTap: () {
                  Get.toNamed('/terms-conditions');
                },
                leading: Icon(color: colorScheme(context).onSurface, Icons.insert_drive_file_outlined),
                title: const Text('Terms and Conditions'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
              ),
            ]),
          )
        ),
        const VSpace(),

        /// GENERAL PAGES
        const TitleBasicSmall(title: 'General Pages'),
        PaperCard(content:
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
               ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.notifications_on_rounded),
                title: const Text('Notification'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.notification);
                },
               ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.flag),
                title: const Text('Intro'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.intro);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.store_mall_directory),
                title: const Text('Home Page'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.home);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.explore_outlined),
                title: const Text('Explore'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.explore);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.search),
                title: const Text('Search'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.search);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.search),
                title: const Text('Search List'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.searchList);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.crop_square_sharp),
                title: const Text('Not Found'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.notFound);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.search_off),
                title: const Text('Search Not Found'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.searchNotFound);
                },
              ),
            ])
          )
         ),
         const VSpace(),
      
        /// PAGE HOTEL
        const TitleBasicSmall(title: 'Hotel'),
        PaperCard(content:
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.list_alt),
                title: const Text('Hotel List'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.hotelList);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.apartment),
                title: const Text('Hotel Detail'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.hotelDetail);
                }
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.list_sharp),
                title: const Text('Room Hotel List'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.roomHotelList);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.meeting_room_outlined),
                title: const Text('Room Hotel Detail'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.roomHotelDetail);
                }
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.photo_library_sharp),
                title: const Text('Hotel Gallery'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.hotelGallery);
                }
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.person_outline),
                title: const Text('Booking Hotel Step1 Contact'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.bookingHotelStep1);
                }
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.grid_view),
                title: const Text('Booking Hotel Step2 Amenities'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.bookingHotelStep2);
                }
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.fact_check_outlined),
                title: const Text('Booking Hotel Step3 Review'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.bookingHotelStep3);
                }
              ),
            ]),
          )
        ),
        const VSpace(),

        /// PAGE HOMESTAY
        const TitleBasicSmall(title: 'Homestay'),
        PaperCard(content:
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.home_filled),
                title: const Text('Homestay List'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.homestayList);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.home_outlined),
                title: const Text('Homestay Detail'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.homestayDetail);
                }
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.photo_library_sharp),
                title: const Text('Homestay Gallery'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.homestayGallery);
                }
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.person_outline),
                title: const Text('Booking Homestay Step1 Contact'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.bookingHomestayStep1);
                }
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.grid_view),
                title: const Text('Booking Homestay Step2 Amenities'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.bookingHomestayStep2);
                }
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.fact_check_outlined),
                title: const Text('Booking Homestay Step3 Review'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.bookingHomestayStep3);
                }
              ),
            ]),
          )
        ),
        const VSpace(),

        /// PAGE WORKSPACE
        const TitleBasicSmall(title: 'Workspace'),
        PaperCard(content:
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.blur_linear_sharp),
                title: const Text('Workspace List'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.workspaceList);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.home_work),
                title: const Text('Workspace Detail'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.workspaceDetail);
                }
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.photo_library_sharp),
                title: const Text('Workspace Gallery'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.workspaceGallery);
                }
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.home_work_outlined),
                title: const Text('Room Workspace'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.roomWorkspaceDetail);
                }
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.calendar_month),
                title: const Text('Booking Workspace Step1 Schedule'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.bookingWorkspaceStep1);
                }
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.grid_view),
                title: const Text('Booking Workspace Step2 Amenities'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.bookingWorkspaceStep2);
                }
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.fact_check_outlined),
                title: const Text('Booking Workspace Step3 Review'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.bookingWorkspaceStep3);
                }
              ),
            ]),
          )
        ),
        const VSpace(),

        /// TICKET
        const TitleBasicSmall(title: 'Booking'),
        PaperCard(content: 
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.collections_bookmark_rounded),
                title: const Text('My Booking'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.myBooking);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.history),
                title: const Text('Booking History'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.bookingHistory);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.apartment),
                title: const Text('Booked Hotel Detail'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.bookedHotelDetail);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.home_filled),
                title: const Text('Booked Homestay Detail'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.bookedHomestayDetail);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.home_work),
                title: const Text('Booked Workspace Detail'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.bookedWorkspaceDetail);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.book_outlined),
                title: const Text('E-Ticket Hotel'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.eTicketHotel);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.receipt_long),
                title: const Text('E-Ticket Homestay'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.eTicketHomestay);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.receipt),
                title: const Text('E-Ticket Workspace'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.eTicketWorkspace);
                },
              ),
            ])
          )
        ),
        const VSpace(),

        /// PAYMENT
        const TitleBasicSmall(title: 'Payment'),
        PaperCard(content: 
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.monetization_on_outlined),
                title: const Text('Payment'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.payment);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.credit_card),
                title: const Text('Payment Credit Card'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.paymentCc);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.wallet),
                title: const Text('Payment E-Wallet'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.paymentEWallet);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.account_balance),
                title: const Text('Payment Transfer'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.paymentTransfer);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.contacts_rounded),
                title: const Text('Payment Virtual Account'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.paymentVac);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.check_circle_outline),
                title: const Text('Payment Status'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.paymentStatus);
                },
              ),
            ])
          )
        ),
        const VSpace(),

        /// PROMO
        const TitleBasicSmall(title: 'Promo'),
        PaperCard(content: 
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.campaign),
                title: const Text('Promo'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.promo);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.campaign_outlined),
                title: const Text('Promo Detail'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.promoDetail);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.discount),
                title: const Text('Voucher Detail'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.voucherDetail);
                },
              ),
            ])
          )
        ),
        const VSpace(),

        /// UI LIST
        const TitleBasicSmall(title: 'UI List'),
        PaperCard(content:
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.ads_click),
                title: const Text('Buttons'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.buttonCollection);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.rounded_corner),
                title: const Text('Shadow and Border Radius'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.shadowRoundedCollection);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.abc),
                title: const Text('Typography'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.typographyCollection);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.palette_outlined),
                title: const Text('Colors and Gradient'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.colorCollection);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.format_list_bulleted),
                title: const Text('Form Input'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.formSample);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.collections_outlined),
                title: const Text('Card Collection'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.cardCollection);
                },
              ),
            ]),
          )
        ),
        const VSpace(),

        /// FOOTER
        SizedBox(
          height: 50,
          child: FilledButton(
            onPressed: () {
              confirmDialog(
                context, title: 'Logout',
                content: Text('Are you sure want to logout?', textAlign: TextAlign.center),
                confirmText: 'Yes, I\'m sure',
                confirmAction: () {
                  Get.toNamed(AppLink.welcome);
                }
              );
            }, 
            style: FilledButton.styleFrom(
              backgroundColor: Colors.red
            ),
            child: const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text('LOGOUT'),
              SizedBox(width: 4),
              Icon(Icons.exit_to_app)
            ])
          ),
        ),
        const VSpace(),
        Center(child: Text('${branding.name} Version: ${branding.version}', style: ThemeText.caption)),
        const VSpaceBig(),
      ]
    );
  }
}