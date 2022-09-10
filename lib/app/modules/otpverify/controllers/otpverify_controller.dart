import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justclap/app/config/routes/app_pages.dart';
import 'package:justclap/app/core/utils/app_utils.dart';
import 'package:justclap/app/data/datasources/local/app_database.dart';
import 'package:justclap/app/domain/params/verify_otp_params.dart';

import '../../../domain/repositories/auth_repository.dart';

class OtpverifyController extends GetxController {
  var firstController = TextEditingController();
  var secondController = TextEditingController();
  var thirdController = TextEditingController();
  var fourthController = TextEditingController();
  FocusNode secondFocusNode = FocusNode();
  FocusNode thirdFocusNode = FocusNode();
  FocusNode fourthFocusNode = FocusNode();
  final IAuthRepository repository = Get.find();
  String number = "", otp = "";

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments as Map<String, String>?;
    if (args != null) {
      otp = args["otp"] as String;
      debugPrint("otp ${otp}");
      number = args["number"] as String;
      if (otp.isNotEmpty) {
        firstController.text = otp.characters.elementAt(0);
        secondController.text = otp.characters.elementAt(1);
        thirdController.text = otp.characters.elementAt(2);
        fourthController.text = otp.characters.elementAt(3);
        Future.delayed(Duration(seconds: 2), () {
          verifyOTP();
        });
      }
    }
  }

  verifyOTP() {
    otp = firstController.text +
        secondController.text +
        thirdController.text +
        fourthController.text;
    if (otp.isEmpty) {
      showToastMessage(title: "Error", message: "Enter the otp");
      return;
    }
    Get.dialog(LoadingIndicator());
    VerifyOtpParams params = VerifyOtpParams(number: number, otp: otp);
    repository.verifyOTP(params).then((value) {
      if (value.data != null) {
        Get.back();
        debugPrint("verifyOTP ${(value.data?.token)!}");
        LocalStorage.saveToken((value.data?.token)!);
        LocalStorage.saveUserId((value.data?.user?.id)!);
        CommonRepository.setApiService();
        Future.delayed(Duration(seconds: 2), () {
          Get.offAllNamed(Routes.MAIN);
        });
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
