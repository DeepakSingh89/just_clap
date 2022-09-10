import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:justclap/app/config/routes/app_pages.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../gen/assets.gen.dart';
import '../../../core/resources/app_resources.dart';
import '../../../core/utils/app_utils.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBgColor,
      appBar: AppBar(
        centerTitle: true,
        elevation: 1.0,
        backgroundColor: whiteColor,
        title: Text(
          'Profile',
          style: appBarTextStyle,
        ),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          aboutUser(),
          about(),
          app(),
          InkWell(
            onTap: () => logoutDialog(),
            child: Padding(
              padding: const EdgeInsets.all(fixPadding * 2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.exit_to_app,
                    size: 22.0,
                    color: redColor,
                  ),
                  widthSpace,
                  Text(
                    'Logout',
                    style: red14MediumTextStyle,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  aboutUser() {
    return Padding(
      padding: const EdgeInsets.all(fixPadding * 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Obx(() => controller.loading.value
              ? LoadingIndicator()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(35.0),
                      child:
                          controller.response.value.getuser?.profilePicture ==
                                  null
                              ? Image.asset(
                                  Assets.user.user1.path,
                                  width: 70.0,
                                  height: 70.0,
                                )
                              : Image.network(
                                  (controller
                                      .response.value.getuser?.profilePicture)!,
                                  loadingBuilder: (_, child, loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return LoadingIndicator();
                                  },
                                  errorBuilder: (_, child, error) {
                                    return Image.asset(
                                      Assets.user.user1.path,
                                      width: 70.0,
                                      height: 70.0,
                                    );
                                  },
                                  width: 70.0,
                                  height: 70.0,
                                  fit: BoxFit.cover,
                                ),
                    ),
                    widthSpace,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.response.value.getuser?.name ?? "n/a",
                          style: black16BoldTextStyle,
                        ),
                        10.heightBox,
                        Text(
                          controller.response.value.getuser?.number
                                  ?.replaceAll(' ', '') ??
                              "n/a",
                          style: black16BoldTextStyle,
                        ),
                      ],
                    ),
                  ],
                )),
          InkWell(
            onTap: () {
              Get.toNamed(Routes.EDITPROFILE,
                      arguments: controller.response.value)
                  ?.then((value) {
                controller.getProfile();
              });
            },
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
              width: 40.0,
              height: 40.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: primaryColor,
              ),
              child: Icon(
                Icons.edit,
                size: 24.0,
                color: whiteColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  about() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        height20Space,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
          child: Text(
            'About'.toUpperCase(),
            style: black12RegularTextStyle,
          ),
        ),
        heightSpace,
        InkWell(
          onTap: () {
            Get.toNamed(Routes.PRIVACYPOLICY);
          },
          child: settingTile('Privacy Policy'),
        ),
        InkWell(
          onTap: () {
            Get.toNamed(Routes.TERMOFUSE);
          },
          child: settingTile('Terms of use'),
        ),
      ],
    );
  }

  app() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        height20Space,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
          child: Text(
            'App'.toUpperCase(),
            style: black12RegularTextStyle,
          ),
        ),
        heightSpace,
        InkWell(
          onTap: () {
            Get.toNamed(Routes.SUPPORT, arguments: "Support");
          },
          child: settingTile('Support'),
        ),
        InkWell(
          onTap: () {
            Get.toNamed(Routes.SUPPORT, arguments: "Report");
          },
          child: settingTile('Report a Bug'),
        ),
        InkWell(
          onTap: () {},
          child: settingTile('App Version 1.0'),
        ),
      ],
    );
  }

  settingTile(title) {
    return Container(
      padding: EdgeInsets.fromLTRB(
          fixPadding * 2.0, fixPadding, fixPadding * 2.0, 0.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: black14MediumTextStyle,
              ),
              Icon(
                Icons.keyboard_arrow_right,
                size: 16.0,
                color: blackColor,
              ),
            ],
          ),
          heightSpace,
          Container(
            width: double.infinity,
            height: 1.0,
            color: greyColor,
          ),
        ],
      ),
    );
  }

  logoutDialog() {
    showDialog(
      context: Get.context!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // return object of type Dialog
        double width = MediaQuery.of(context).size.width;
        return Dialog(
          elevation: 0.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Wrap(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(fixPadding * 2.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'You sure want to logout?',
                      style: black16BoldTextStyle,
                      textAlign: TextAlign.center,
                    ),
                    heightSpace,
                    heightSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            width: (width - fixPadding * 14.0) / 2,
                            padding: EdgeInsets.symmetric(vertical: fixPadding),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                width: 1.0,
                                color: primaryColor,
                              ),
                              color: whiteColor,
                            ),
                            child: Text(
                              'Cancel',
                              style: black14MediumTextStyle,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.toNamed(Routes.PHONESIGNIN);
                          },
                          child: Container(
                            width: (width - fixPadding * 14.0) / 2,
                            padding: EdgeInsets.symmetric(vertical: fixPadding),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: primaryColor,
                            ),
                            child: Text(
                              'Logout',
                              style: white14MediumTextStyle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
