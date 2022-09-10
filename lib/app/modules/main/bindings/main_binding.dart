import 'package:get/get.dart';
import 'package:justclap/app/data/repositories_impl/profile_repository_impl.dart';
import 'package:justclap/app/domain/repositories/iprofile_repository.dart';
import 'package:justclap/app/modules/bookings/controllers/bookings_controller.dart';
import 'package:justclap/app/modules/chats/controllers/chats_controller.dart';
import 'package:justclap/app/modules/profile/controllers/profile_controller.dart';
import 'package:justclap/app/modules/reviews/controllers/reviews_controller.dart';

import '../../../data/repositories_impl/booking_repository_impl.dart';
import '../../../domain/repositories/ibooking_repository.dart';
import '../controllers/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IBookingRepository>(() => BookingRepositoryImpl());
    Get.lazyPut<IProfileRepository>(() => ProfileRepositoryImpl());
    Get.lazyPut<ProfileController>(
        () => ProfileController(repository: Get.find()));
    Get.lazyPut<ReviewsController>(
        () => ReviewsController(repository: Get.find()));
    Get.lazyPut<ChatsController>(() => ChatsController());
    Get.lazyPut<BookingsController>(
        () => BookingsController(repository: Get.find()));
    Get.lazyPut<MainController>(
      () => MainController(),
    );
  }
}
