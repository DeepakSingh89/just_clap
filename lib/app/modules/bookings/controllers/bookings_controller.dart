import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justclap/app/core/utils/app_utils.dart';
import 'package:justclap/app/domain/entities/bookings/get_booking_response/my_booking.dart';
import 'package:justclap/app/domain/params/rate_booking_params.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../domain/repositories/ibooking_repository.dart';

class BookingsController extends GetxController {
  final IBookingRepository repository;
  BookingsController({required this.repository});
  final bookingsList = <MyBooking>[].obs;
  final isBookingLoading = false.obs;
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  onLoading() async {
    // monitor network fetch
    log("loading");
  }

  @override
  void onInit() {
    super.onInit();
    getAllBookings();
  }

  onRefresh() async {
    log("on refesh");
    getAllBookings();
  }

  getAllBookings() {
    isBookingLoading.value = true;
    repository.getBookings().then((value) {
      if (value.data != null) {
        bookingsList.value = value.data?.myBooking ?? [];
      }
      refreshController.loadComplete();
      isBookingLoading.value = false;
    });
  }

  rateBooking(String id, String comment, String rating) {
    RateBookingParams params =
        RateBookingParams(serviceProvider: id, review: comment, rating: rating);
    repository.rateBooking(params).then((value) {
      if (value.data != null) {
        showToastMessage(title: "Success", message: "Rated successfully");
      }
    });
  }

  @override
  void onClose() {}
}
