import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/resources/app_resources.dart';
import '../controllers/support_controller.dart';

class SupportView extends GetView<SupportController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBgColor,
      appBar: AppBar(
        centerTitle: true,
        elevation: 1.0,
        backgroundColor: whiteColor,
        title: Text(
          controller.type,
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
          heightSpace,
          buildTextField("Name", controller.name),
          heightSpace,
          buildTextField("Email", controller.email),
          heightSpace,
          buildTextField("Write here", controller.message),
          SizedBox(height: 30.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
            child: InkWell(
              borderRadius: BorderRadius.circular(20.0),
              onTap: () {
                controller.send();
              },
              child: Container(
                padding: EdgeInsets.all(fixPadding * 1.0),
                alignment: Alignment.center,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: primaryColor),
                child: Text(
                  'Submit',
                  style: white14BoldTextStyle,
                ),
              ),
            ),
          )
        ],
      ).paddingAll(10),
    );
  }

  TextField buildTextField(String hint, TextEditingController controller) {
    return TextField(
      style: black16MediumTextStyle,
      keyboardType: TextInputType.text,
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: grey16MediumTextStyle,
        fillColor: scaffoldBgColor,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: primaryColor, width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.grey[400]!, width: 1.5),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.grey[400]!, width: 1.5),
        ),
      ),
    );
  }
}
