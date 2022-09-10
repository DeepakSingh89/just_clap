import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:justclap/app/domain/params/verify_otp_params.dart';

import 'package:justclap/app/domain/entities/auth/verify_otp_response/verify_otp_response.dart';

import 'package:justclap/app/domain/entities/auth/send_otp_response/send_otp_response.dart';
import 'package:dio/dio.dart';
import '../../core/utils/app_utils.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends IAuthRepository {
  @override
  Future<DataState<SendOtpResponse>> sendOTP(String number) async {
    try {
      Map<String, String> params = {};
      params["number"] = number;
      log("number $params");
      final httpResponse =
          await CommonRepository.getApiService().sendOTP(params);
      log("response ${httpResponse.data.toJson()}");
      if (httpResponse.response.statusCode == HttpStatus.created) {
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
  Future<DataState<VerifyOtpResponse>> verifyOTP(VerifyOtpParams params) async {
    try {
      final httpResponse =
          await CommonRepository.getApiService().verifyOTP(params);
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
