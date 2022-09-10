import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';

import 'package:get/get.dart';
import 'package:justclap/app/data/datasources/local/app_database.dart';

import '../../../config/routes/app_pages.dart';
import '../../../core/resources/app_resources.dart';
import '../../../core/utils/app_utils.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    Future.delayed(Duration(seconds: 4), () {
      debugPrint("token splash ${LocalStorage.readToken()}");
      CommonRepository.setApiService();
      if (LocalStorage.readToken().isEmpty) {
        Get.offNamed(Routes.PHONESIGNIN);
      } else {
        Get.offNamed(Routes.MAIN);
      }
    });
    return Scaffold(
      backgroundColor: scaffoldBgColor,
      body: Container(
        width: width,
        height: height,
        child: Stack(
          children: [
            FadeIn(
              duration: Duration(seconds: 3),
              child: Container(
                width: width,
                height: height,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icon.png',
                      width: 150.0,
                      height: 150.0,
                      fit: BoxFit.cover,
                    ),
                    height20Space,
                    Text(
                      'Provider',
                      style: grey16MediumTextStyle,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
