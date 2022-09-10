import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/resources/app_resources.dart';
import '../controllers/phonesignin_controller.dart';

class PhonesigninView extends GetView<PhonesigninController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBgColor,
      body: ListView(
        children: [
          SizedBox(height: 100.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icon.png',
                width: 150.0,
                height: 150.0,
                fit: BoxFit.cover,
              ),
              heightSpace,
              Text(
                'Provider',
                style: grey14MediumTextStyle,
              ),
              SizedBox(height: 30.0),
              Text(
                'Signin with phone number',
                style: grey14BoldTextStyle,
              ),
              VxTextField(
                hint: 'Enter 10 digit Phone Number',
                controller: controller.controller,
                keyboardType: TextInputType.number,
                borderType: VxTextFieldBorderType.roundLine,
                borderRadius: 8,
                textAlign: TextAlign.center,
                //selectorType: PhoneInputSelectorType.DIALOG,
              ).marginOnly(top: 10, bottom: 10, left: 20, right: 20),
              heightSpace,
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
                child: InkWell(
                  onTap: () {
                    controller.sendOTP();
                  },
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                    width: double.infinity,
                    height: 50.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: primaryColor,
                    ),
                    child: Text(
                      'Continue',
                      style: white14BoldTextStyle,
                    ),
                  ),
                ),
              ),
              heightSpace,
              Text(
                'We’ll send otp for verification',
                style: black14MediumTextStyle,
              ),
              height20Space,
            ],
          ),
        ],
      ),
    );
  }

  onWillPop() {
    DateTime now = DateTime.now();
    if (controller.currentBackPressTime == null ||
        now.difference(controller.currentBackPressTime!) >
            Duration(seconds: 2)) {
      controller.currentBackPressTime = now;
      Get.snackbar("Exit app", "Press Back Once Again to Exit");
      return false;
    } else {
      return true;
    }
  }
}
