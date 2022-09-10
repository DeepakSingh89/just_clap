import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:justclap/gen/assets.gen.dart';
import '../../../core/resources/app_resources.dart';
import '../controllers/editprofile_controller.dart';

class EditprofileView extends GetView<EditprofileController> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: scaffoldBgColor,
      appBar: AppBar(
        centerTitle: true,
        elevation: 1.0,
        backgroundColor: whiteColor,
        title: Text(
          'Edit Profile',
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
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(fixPadding * 2.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 160.0,
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      Container(
                        width: width - fixPadding * 4.0,
                        alignment: Alignment.center,
                        child: Obx(() {
                          return Container(
                            width: 140.0,
                            height: 140.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(70.0),
                              image: DecorationImage(
                                image: controller.profilePicUrl.isNotEmpty &&
                                        controller.file.value.path.isEmpty
                                    ? NetworkImage(
                                        controller.profilePicUrl.value,
                                      )
                                    : controller.file.value.path.isNotEmpty
                                        ? FileImage(controller.file.value)
                                        : AssetImage(Assets.user.user1.path)
                                            as ImageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        }),
                      ),
                      Positioned(
                        bottom: 0.0,
                        child: Container(
                          width: width - fixPadding * 4.0,
                          alignment: Alignment.center,
                          child: InkWell(
                            onTap: () => _selectOptionBottomSheet(),
                            borderRadius: BorderRadius.circular(20.0),
                            child: Container(
                              width: 140.0,
                              padding: EdgeInsets.symmetric(
                                  vertical: fixPadding * 0.6),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.orange,
                                border: Border.all(
                                  width: 2.0,
                                  color: whiteColor,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.camera_alt,
                                    size: 16.0,
                                    color: whiteColor,
                                  ),
                                  SizedBox(width: 5.0),
                                  Text(
                                    'Change',
                                    style: white12MediumTextStyle,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                heightSpace,

                // Name Field Start
                Container(
                  padding: EdgeInsets.only(top: fixPadding, bottom: fixPadding),
                  child: Theme(
                    data: ThemeData(
                      primaryColor: greyColor,
                      textSelectionTheme: TextSelectionThemeData(
                        cursorColor: primaryColor,
                      ),
                    ),
                    child: TextField(
                      controller: controller.nameController,
                      keyboardType: TextInputType.text,
                      style: black14MediumTextStyle,
                      decoration: InputDecoration(
                        labelText: 'Name',
                        labelStyle: black14MediumTextStyle,
                        border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          borderSide: BorderSide(color: greyColor, width: 0.7),
                        ),
                      ),
                      onChanged: (value) {},
                    ),
                  ),
                ),
                // Name Field End

                // Email Field Start
                Container(
                  padding: EdgeInsets.only(top: fixPadding, bottom: fixPadding),
                  child: Theme(
                    data: ThemeData(
                      primaryColor: greyColor,
                      textSelectionTheme: TextSelectionThemeData(
                        cursorColor: primaryColor,
                      ),
                    ),
                    child: TextField(
                      controller: controller.emailController,
                      keyboardType: TextInputType.emailAddress,
                      style: black14MediumTextStyle,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: black14MediumTextStyle,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: greyColor, width: 0.7),
                        ),
                      ),
                      onChanged: (value) {},
                    ),
                  ),
                ),
                // Email Field End

                // Phone Number Field Start
                Container(
                  padding: EdgeInsets.only(top: fixPadding, bottom: fixPadding),
                  child: Theme(
                    data: ThemeData(
                      primaryColor: greyColor,
                      textSelectionTheme: TextSelectionThemeData(
                        cursorColor: primaryColor,
                      ),
                    ),
                    child: TextField(
                      controller: controller.phoneController,
                      keyboardType: TextInputType.number,
                      style: black14MediumTextStyle,
                      decoration: InputDecoration(
                        labelText: 'Phone Number',
                        labelStyle: black14MediumTextStyle,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: greyColor, width: 0.7),
                        ),
                      ),
                      onChanged: (value) {},
                    ),
                  ),
                ),
                // Phone Number Field End

                // Password Field Start
                // Container(
                //   padding: EdgeInsets.only(top: fixPadding, bottom: fixPadding),
                //   child: Theme(
                //     data: ThemeData(
                //       primaryColor: greyColor,
                //       textSelectionTheme: TextSelectionThemeData(
                //         cursorColor: primaryColor,
                //       ),
                //     ),
                //     child: TextField(
                //       controller: controller.passwordController,
                //       keyboardType: TextInputType.number,
                //       style: black14MediumTextStyle,
                //       decoration: InputDecoration(
                //         labelText: 'Password',
                //         labelStyle: black14MediumTextStyle,
                //         border: OutlineInputBorder(
                //           borderSide: BorderSide(color: greyColor, width: 0.7),
                //         ),
                //       ),
                //       obscureText: true,
                //       onChanged: (value) {},
                //     ),
                //   ),
                // ),
                // Password Field End
                heightSpace,
                // Save Button Start
                InkWell(
                  onTap: () {
                    controller.updateProfile();
                  },
                  borderRadius: BorderRadius.circular(7.0),
                  child: Container(
                    width: width,
                    padding: EdgeInsets.all(fixPadding * 1.5),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.0),
                      color: primaryColor,
                    ),
                    child: Text(
                      'Save',
                      style: white14BoldTextStyle,
                    ),
                  ),
                ),
                // Save Button End
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _selectOptionBottomSheet() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      File file = File(result.files.single.path!);
      controller.file.value = file;
    } else {}
  }
}
