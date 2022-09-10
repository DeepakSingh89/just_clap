import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justclap/app/domain/params/add_support_params.dart';

import '../../../core/utils/app_utils.dart';
import '../../../domain/repositories/cms_repository.dart';

class SupportController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController message = TextEditingController();
  String type = "";
  final ICMSRepository repository;
  SupportController({required this.repository});

  @override
  void onInit() {
    super.onInit();
    type = Get.arguments;
  }

  send() {
    if (name.text.isEmpty || email.text.isEmpty || message.text.isEmpty) {
      showToastMessage(title: "Error", message: "Fields required");
      return;
    }
    Get.dialog(LoadingIndicator());
    AddSupportParams params = AddSupportParams(
        name: name.text, email: email.text, message: message.text);
    if (type == "Report") {
      repository.addReport(params).then((value) {
        Get.back();
        if (value.data != null) {
          Get.back();
          showToastMessage(
              title: "Error", message: "Report Added successfully");
        }
      });
    } else {
      repository.addReport(params).then((value) {
        Get.back();
        if (value.data != null) {
          Get.back();
          showToastMessage(
              title: "Error", message: "Support Added successfully");
        }
      });
    }
  }

  @override
  void onReady() {
    super.onReady();
  }
}
