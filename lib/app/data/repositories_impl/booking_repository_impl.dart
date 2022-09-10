import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:justclap/app/core/utils/app_utils.dart';
import 'package:justclap/app/domain/entities/base_response/base_response.dart';
import 'package:justclap/app/domain/params/rate_booking_params.dart';
import 'package:justclap/app/domain/entities/bookings/rate_booking_response/rate_booking_response.dart';
import 'package:justclap/app/domain/repositories/ibooking_repository.dart';

import '../../domain/entities/bookings/get_booking_response/get_booking_response.dart';

class BookingRepositoryImpl extends IBookingRepository {
  @override
  Future<DataState<GetBookingResponse>> getBookings() async {
    try {
      final httpResponse = await CommonRepository.getApiService().getBookings();
      log("response ${httpResponse.data.toJson()}");
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      }
      return DataFailed(
        DioError(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          requestOptions: httpResponse.response.requestOptions,
          type: DioErrorType.response,
        ),
      );
    } on DioError catch (e) {
      debugPrint("DioError ${e.response.toString()}");
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<RateBookingResponse>> rateBooking(
      RateBookingParams params) async {
    try {
      final httpResponse =
          await CommonRepository.getApiService().rateBooking(params);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      }
      return DataFailed(
        DioError(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          requestOptions: httpResponse.response.requestOptions,
          type: DioErrorType.response,
        ),
      );
    } on DioError catch (e) {
      debugPrint("DioError ${e.response.toString()}");
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<BaseResponse>> acceptRejectBooking(
      String id, bool accept) async {
    try {
      final map = <String,bool>{};
      map["accept"]= accept;
      final httpResponse =
          await CommonRepository.getApiService().acceptRejectBooking(id,map);
      log("response ${httpResponse.data.toJson()}");
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      }
      return DataFailed(
        DioError(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          requestOptions: httpResponse.response.requestOptions,
          type: DioErrorType.response,
        ),
      );
    } on DioError catch (e) {
      debugPrint("DioError ${e.response.toString()}");
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<BaseResponse>> completeBooking(String id) async {
    try {
      final httpResponse =
          await CommonRepository.getApiService().completeBooking(id);
      log("response ${httpResponse.data.toJson()}");
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      }
      return DataFailed(
        DioError(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          requestOptions: httpResponse.response.requestOptions,
          type: DioErrorType.response,
        ),
      );
    } on DioError catch (e) {
      debugPrint("DioError ${e.response.toString()}");
      return DataFailed(e);
    }
  }
}
