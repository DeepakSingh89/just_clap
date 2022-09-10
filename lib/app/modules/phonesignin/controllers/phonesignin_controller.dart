import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:justclap/app/config/routes/app_pages.dart';
import 'package:justclap/app/core/utils/app_utils.dart';

import '../../../domain/repositories/auth_repository.dart';

class PhonesigninController extends GetxController {
  DateTime? currentBackPressTime;
  final phoneNumber = ''.obs;
  final phoneIsoCode = "".obs;
  final TextEditingController controller = TextEditingController();

  IAuthRepository repository;
  PhonesigninController({required this.repository});

  sendOTP() {
    if (controller.text.isEmpty) {
      showToastMessage(title: "Error", message: "Fields required");
      return;
    }
    Get.dialog(LoadingIndicator());
    repository.sendOTP(controller.text).then((value) {
      if (value.data != null) {
        Get.back();
        showToastMessage(title: "Success", message: "OTP Send successfully");
        Get.toNamed(Routes.OTPVERIFY, arguments: {
          "otp": value.data?.otp ?? "",
          "number": controller.text
        });
      }
    });
  }

  void onPhoneNumberChange(
      String number, String internationalizedPhoneNumber, String isoCode) {
    phoneNumber.value = number;
    phoneIsoCode.value = isoCode;
  }

  @override
  void onClose() {}
}
