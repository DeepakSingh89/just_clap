import 'dart:developer';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:justclap/app/core/utils/app_utils.dart';
import 'package:justclap/app/domain/entities/bookings/get_booking_response/my_booking.dart';

import '../../../domain/repositories/ibooking_repository.dart';

class BookingrequestdetailsController extends GetxController {
  late MyBooking getbooking;
  final IBookingRepository repository = Get.find();
  final bookingAccepted = false.obs;
  final bookingCompleted = false.obs;
  @override
  void onInit() {
    super.onInit();
    getbooking = Get.arguments as MyBooking;
    bookingAccepted.value = getbooking.bookingId?.accept ?? false;
    bookingCompleted.value =
        (getbooking.bookingId?.orderstatus?.value == "complete" ? true : false);
  }

  String getAddress() {
    return (getbooking.bookingId?.address?.houseno ?? "n/a") +
        ", " +
        (getbooking.bookingId?.address?.landmark ?? "n/a") +
        ", " +
        (getbooking.bookingId?.address?.city ?? "n/a") +
        ", " +
        (getbooking.bookingId?.address?.state ?? "n/a");
  }

  String getDate() {
    return '${DateFormat('E, dd MMM').format((getbooking.bookingId?.date?.toLocal())!)} : ${getbooking.bookingId?.time}';
  }

  acceptBooking(bool accept) async {
    Get.dialog(LoadingIndicator());
    try {
      await repository.acceptRejectBooking(
          getbooking.bookingId?.id ?? "", accept);
      Get.back();
      showToastMessage(title: "Success", message: "Booking accepted");
      bookingAccepted.value = true;
      getbooking.bookingId?.orderstatus?.value = "accept";
      getbooking.bookingId?.accept = true;
    } catch (e) {
      log("e $e");
      Get.back();
    }
  }

  completeBooking() async {
    Get.dialog(LoadingIndicator());
    try {
      await repository.completeBooking(getbooking.bookingId?.id ?? "");
      Get.back();
      showToastMessage(title: "Success", message: "Booking completed");
      getbooking.bookingId?.orderstatus?.value = "Completed";
      bookingCompleted.value = true;
    } catch (e) {
      log("e $e");
      Get.back();
    }
  }

  @override
  void onClose() {}
}
