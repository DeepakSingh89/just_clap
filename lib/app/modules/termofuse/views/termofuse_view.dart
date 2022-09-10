import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/resources/app_resources.dart';
import '../../../core/utils/app_utils.dart';
import '../controllers/termofuse_controller.dart';

class TermofuseView extends GetView<TermofuseController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBgColor,
      appBar: AppBar(
        centerTitle: true,
        elevation: 1.0,
        backgroundColor: whiteColor,
        title: Text(
          'Terms of use',
          style: black18BoldTextStyle,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: blackColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Obx(() {
          return controller.loading.value
              ? LoadingIndicator()
              : Text(
                  controller.tncData.value,
                  style: black14MediumTextStyle,
                  textAlign: TextAlign.justify,
                );
        }),
      ),
    );
  }
}
