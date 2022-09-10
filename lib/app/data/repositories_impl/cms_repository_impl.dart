import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:justclap/app/domain/entities/base_response/base_response.dart';
import 'package:justclap/app/domain/entities/cms/get_privacy_response/get_privacy_response.dart';
import 'package:justclap/app/core/utils/app_utils.dart';
import 'package:justclap/app/domain/params/add_support_params.dart';
import '../../domain/entities/cms/get_tnc_response/get_tnc_response.dart';
import '../../domain/repositories/cms_repository.dart';
import 'package:dio/dio.dart';

class CMSRepositoryImpl implements ICMSRepository {
  @override
  Future<DataState<GetPrivacyResponse>> getPrivacy() async {
    try {
      final httpResponse = await CommonRepository.getApiService().getPrivacy();
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
  Future<DataState<GetTncResponse>> getTnc() async {
    try {
      final httpResponse = await CommonRepository.getApiService().getTnc();
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
  Future<DataState<BaseResponse>> addReport(AddSupportParams params) async {
    try {
      final httpResponse =
          await CommonRepository.getApiService().addReport(params);
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
  Future<DataState<BaseResponse>> addSupport(AddSupportParams params) async {
    try {
      final httpResponse =
          await CommonRepository.getApiService().addReport(params);
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
