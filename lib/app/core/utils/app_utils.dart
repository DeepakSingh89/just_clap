import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import '../../data/datasources/local/app_database.dart';
import '../../data/datasources/remote/app_apis.dart';

showToastMessage({required String title, required String message}) {
  Get.snackbar(title, message, duration: Duration(seconds: 1));
}

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoActivityIndicator(),
    );
  }
}

abstract class DataState<T> {
  final T? data;
  final DioError? error;

  const DataState({this.data, this.error});
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  DataFailed(DioError error) : super(error: error) {
    debugPrint("error ${error.response.toString()}");
    if (Get.isDialogOpen == true) {
      Get.back();
    }
    showToastMessage(
        title: "Error",
        message:
            json.decode(error.response.toString())["error"] ?? error.message);
  }
}

class CommonRepository {
  static late AppApis _apiService;
  static setApiService() {
    _apiService = AppApis(getDio());
  }

  static AppApis loginApiService() {
    return _apiService = AppApis(Dio());
  }

  static AppApis getApiService() {
    return _apiService;
  }

  static Dio getDio() {
    var token = LocalStorage.readToken();
    debugPrint("token getdio ${token}");
    return Dio(
      BaseOptions(
          contentType: 'application/json',
          headers: {"Authorization": "Bearer $token"}),
    );
  }
}
