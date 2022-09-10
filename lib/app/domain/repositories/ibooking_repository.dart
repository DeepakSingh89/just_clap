import 'package:justclap/app/domain/entities/bookings/rate_booking_response/rate_booking_response.dart';
import 'package:justclap/app/domain/params/rate_booking_params.dart';

import '../../core/utils/app_utils.dart';
import '../entities/base_response/base_response.dart';
import '../entities/bookings/get_booking_response/get_booking_response.dart';

abstract class IBookingRepository {
  Future<DataState<GetBookingResponse>> getBookings();
  Future<DataState<RateBookingResponse>> rateBooking(RateBookingParams params);
  Future<DataState<BaseResponse>> acceptRejectBooking(String id,bool accept);
  Future<DataState<BaseResponse>> completeBooking(String id);
}
