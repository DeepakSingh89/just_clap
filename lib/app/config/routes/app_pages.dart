import 'package:get/get.dart';

import '../../modules/bookingrequest/bindings/bookingrequest_binding.dart';
import '../../modules/bookingrequest/views/bookingrequest_view.dart';
import '../../modules/bookingrequestdetails/bindings/bookingrequestdetails_binding.dart';
import '../../modules/bookingrequestdetails/views/bookingrequestdetails_view.dart';
import '../../modules/bookings/bindings/bookings_binding.dart';
import '../../modules/bookings/views/bookings_view.dart';
import '../../modules/chats/bindings/chats_binding.dart';
import '../../modules/chats/views/chats_view.dart';
import '../../modules/editprofile/bindings/editprofile_binding.dart';
import '../../modules/editprofile/views/editprofile_view.dart';
import '../../modules/home/bindings/home_binding.dart';
import '../../modules/home/views/home_view.dart';
import '../../modules/main/bindings/main_binding.dart';
import '../../modules/main/views/main_view.dart';
import '../../modules/otpverify/bindings/otpverify_binding.dart';
import '../../modules/otpverify/views/otpverify_view.dart';
import '../../modules/phonesignin/bindings/phonesignin_binding.dart';
import '../../modules/phonesignin/views/phonesignin_view.dart';
import '../../modules/privacypolicy/bindings/privacypolicy_binding.dart';
import '../../modules/privacypolicy/views/privacypolicy_view.dart';
import '../../modules/profile/bindings/profile_binding.dart';
import '../../modules/profile/views/profile_view.dart';
import '../../modules/reviews/bindings/reviews_binding.dart';
import '../../modules/reviews/views/reviews_view.dart';
import '../../modules/splash/bindings/splash_binding.dart';
import '../../modules/splash/views/splash_view.dart';
import '../../modules/support/bindings/support_binding.dart';
import '../../modules/support/views/support_view.dart';
import '../../modules/termofuse/bindings/termofuse_binding.dart';
import '../../modules/termofuse/views/termofuse_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.PHONESIGNIN,
      page: () => PhonesigninView(),
      binding: PhonesigninBinding(),
    ),
    GetPage(
      name: _Paths.OTPVERIFY,
      page: () => OtpverifyView(),
      binding: OtpverifyBinding(),
    ),
    GetPage(
      name: _Paths.CHATS,
      page: () => ChatsView(),
      binding: ChatsBinding(),
    ),
    GetPage(
      name: _Paths.BOOKINGS,
      page: () => BookingsView(),
      binding: BookingsBinding(),
    ),
    GetPage(
      name: _Paths.BOOKINGREQUEST,
      page: () => BookingrequestView(),
      binding: BookingrequestBinding(),
    ),
    GetPage(
      name: _Paths.BOOKINGREQUESTDETAILS,
      page: () => BookingrequestdetailsView(),
      binding: BookingrequestdetailsBinding(),
    ),
    GetPage(
      name: _Paths.EDITPROFILE,
      page: () => EditprofileView(),
      binding: EditprofileBinding(),
    ),
    GetPage(
      name: _Paths.PRIVACYPOLICY,
      page: () => PrivacypolicyView(),
      binding: PrivacypolicyBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.SUPPORT,
      page: () => SupportView(),
      binding: SupportBinding(),
    ),
    GetPage(
      name: _Paths.TERMOFUSE,
      page: () => TermofuseView(),
      binding: TermofuseBinding(),
    ),
    GetPage(
      name: _Paths.REVIEWS,
      page: () => ReviewsView(),
      binding: ReviewsBinding(),
    ),
    GetPage(
      name: _Paths.MAIN,
      page: () => MainView(),
      binding: MainBinding(),
    ),
  ];
}
