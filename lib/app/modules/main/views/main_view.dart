import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:justclap/app/modules/bookings/views/bookings_view.dart';
import 'package:justclap/app/modules/chats/views/chats_view.dart';
import 'package:justclap/app/modules/profile/views/profile_view.dart';
import 'package:justclap/app/modules/reviews/views/reviews_view.dart';

import '../../../core/resources/app_resources.dart';
import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Material(
        elevation: 1.0,
        child: Container(
          width: double.infinity,
          color: whiteColor,
          padding: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              bottomBarItem(Icons.date_range, 1),
              bottomBarItem(Icons.chat, 2),
              bottomBarItem(Icons.thumbs_up_down, 3),
              bottomBarItem(Icons.person, 4),
            ],
          ),
        ),
      ),
      body: Obx(() => WillPopScope(
            child: (controller.currentIndex.value == 1)
                ? BookingsView()
                : (controller.currentIndex.value == 2)
                    ? ChatsView()
                    : (controller.currentIndex.value == 3)
                        ? ReviewsView()
                        : ProfileView(),
            onWillPop: () async {
              bool backStatus = onWillPop();
              if (backStatus) {
                exit(0);
              }
              return false;
            },
          )),
    );
  }

  onWillPop() {
    DateTime now = DateTime.now();
    if (controller.currentBackPressTime == null ||
        now.difference(controller.currentBackPressTime!) >
            Duration(seconds: 2)) {
      controller.currentBackPressTime = now;
      Get.snackbar("Exit app", 'Press Back Once Again to Exit.');
      return false;
    } else {
      return true;
    }
  }

  bottomBarItem(icon, index) {
    return IconButton(
      icon: Obx(() => Icon(
            icon,
            size: 24.0,
            color: (index == controller.currentIndex.value)
                ? primaryColor
                : greyColor,
          )),
      onPressed: () => controller.changeIndex(index),
    );
  }
}
