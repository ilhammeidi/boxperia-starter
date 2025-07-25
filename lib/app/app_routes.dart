import 'package:booking_app/screens/booking/booking_list_screen.dart';
import 'package:booking_app/screens/explore/explore_main.dart';
import 'package:booking_app/screens/intro/intro_screen.dart';
import 'package:booking_app/screens/intro/start_screen.dart';
import 'package:booking_app/screens/profile/profile_main.dart';
import 'package:booking_app/screens/promo/promo_screen.dart';
import 'package:booking_app/ui/layouts/general_layout.dart';
import 'package:booking_app/ui/layouts/home_layout.dart';
import 'package:get/route_manager.dart';
import 'package:booking_app/app/app_link.dart';

const int pageTransitionDuration = 200;

final List<GetPage> appRoutes = [
  /// HOME
  GetPage(
    name: AppLink.home,
    page: () => const StartScreen(),
    transition: Transition.fadeIn,
    transitionDuration: const Duration(milliseconds: pageTransitionDuration)
  ),
  GetPage(
    name: AppLink.intro,
    page: () => GeneralLayout(content: IntroScreen(saveIntroStatus: () {})),
  ),

  /// EXPLORE
  GetPage(
    name: AppLink.explore,
    page: () => const HomeLayout(content: ExploreMain()),
    transition: Transition.fadeIn,
    transitionDuration: const Duration(milliseconds: pageTransitionDuration)
  ),

  /// BOOKING
  GetPage(
    name: AppLink.myBooking,
    page: () => const HomeLayout(content: BookingListScreen()),
    transition: Transition.fadeIn,
    transitionDuration: const Duration(milliseconds: pageTransitionDuration)
  ),

  /// PROMO
  GetPage(
    name: AppLink.promo,
    page: () => const HomeLayout(content: PromoScreen()),
    transition: Transition.fadeIn,
    transitionDuration: const Duration(milliseconds: pageTransitionDuration)
  ),

  /// PROFILE
 GetPage(
    name: AppLink.profile,
    page: () => const HomeLayout(content: ProfileMain()),
    transition: Transition.fadeIn,
    transitionDuration: const Duration(milliseconds: pageTransitionDuration)
  ),
];