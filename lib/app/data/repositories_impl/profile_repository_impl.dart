import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:justclap/app/domain/entities/base_response/base_response.dart';
import 'package:justclap/app/domain/entities/profile/get_profile_response/get_profile_response.dart';
import 'package:justclap/app/core/utils/app_utils.dart';
import 'package:justclap/app/domain/entities/profile/get_reviews_response/get_reviews_response.dart';
import 'package:justclap/app/domain/repositories/iprofile_repository.dart';

class ProfileRepositoryImpl implements IProfileRepository {
  @override
  Future<DataState<GetProfileResponse>> getProfile() async {
    try {
      debugPrint("profile");
      final httpResponse = await CommonRepository.getApiService().getProfile();
      debugPrint("httpResponse: " + httpResponse.data.toJson().toString());
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
  Future<DataState<GetReviewsResponse>> allReviews() async {
    try {
      final httpResponse =
          await CommonRepository.getApiService().getAllReviews();
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
  Future<DataState<BaseResponse>> updateProfile(
      String name, String number, String email, File? image) async {
    try {
      final httpResponse = await CommonRepository.getApiService()
          .updateProfile(name, email, number, image);
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
