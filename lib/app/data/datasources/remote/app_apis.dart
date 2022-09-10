import 'dart:developer';
import 'dart:io';
import 'package:justclap/app/domain/entities/auth/send_otp_response/send_otp_response.dart';
import 'package:justclap/app/domain/entities/auth/verify_otp_response/verify_otp_response.dart';
import 'package:justclap/app/domain/entities/cms/get_privacy_response/get_privacy_response.dart';
import 'package:justclap/app/domain/entities/cms/get_tnc_response/get_tnc_response.dart';
import 'package:justclap/app/domain/entities/profile/get_reviews_response/get_reviews_response.dart';
import 'package:justclap/app/domain/params/verify_otp_params.dart';
import 'package:retrofit/retrofit.dart';
import '../../../config/server/app_server.dart';
import 'package:dio/dio.dart';
import '../../../domain/entities/base_response/base_response.dart';
import '../../../domain/entities/bookings/get_booking_response/get_booking_response.dart';
import '../../../domain/entities/bookings/rate_booking_response/rate_booking_response.dart';
import '../../../domain/entities/profile/get_profile_response/get_profile_response.dart';
import '../../../domain/params/add_support_params.dart';
import '../../../domain/params/rate_booking_params.dart';

part 'app_apis.g.dart';

@RestApi(baseUrl: serverBaseUrl)
abstract class AppApis {
  factory AppApis(Dio dio, {String baseUrl}) = _AppApis;

  @POST("provider-send-otp")
  Future<HttpResponse<SendOtpResponse>> sendOTP(
      @Body() Map<String, String> body);

  @POST("provider-varify-otp")
  Future<HttpResponse<VerifyOtpResponse>> verifyOTP(
      @Body() VerifyOtpParams body);

  @GET("my-booking")
  Future<HttpResponse<GetBookingResponse>> getBookings();

  @GET("user")
  Future<HttpResponse<GetProfileResponse>> getProfile();

  @MultiPart()
  @PUT("user")
  Future<HttpResponse<BaseResponse>> updateProfile(
      @Part(name: 'name') String name,
      @Part(name: 'email') String? email,
      @Part(name: 'number') String? alternateNumber,
      @Part(name: 'myField') File? image);

  @GET("rating")
  Future<HttpResponse<GetReviewsResponse>> getAllReviews();

  @POST("add-rating")
  Future<HttpResponse<RateBookingResponse>> rateBooking(
      @Body() RateBookingParams params);

  @GET("privacy")
  Future<HttpResponse<GetPrivacyResponse>> getPrivacy();

  @GET("tnc")
  Future<HttpResponse<GetTncResponse>> getTnc();

  @POST("support")
  Future<HttpResponse<BaseResponse>> addSupport(
      @Body() AddSupportParams params);

  @POST("report")
  Future<HttpResponse<BaseResponse>> addReport(@Body() AddSupportParams params);

  @PUT("complete-booking/{id}")
  Future<HttpResponse<BaseResponse>> completeBooking(@Path("id") String id);

  @PUT("aceept-booking/{id}")
  Future<HttpResponse<BaseResponse>> acceptRejectBooking(
      @Path("id") String id, @Body() Map<String, bool> body);
}
