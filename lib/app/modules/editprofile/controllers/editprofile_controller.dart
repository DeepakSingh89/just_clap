import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justclap/app/domain/repositories/iprofile_repository.dart';
import '../../../core/utils/app_utils.dart';
import '../../../domain/entities/profile/get_profile_response/get_profile_response.dart';

class EditprofileController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final file = File("").obs;
  final profilePicUrl = "".obs;
  final IProfileRepository repository;
  EditprofileController({required this.repository});

  @override
  void onInit() {
    super.onInit();
    final getProfileResponse = Get.arguments as GetProfileResponse;
    nameController.text = getProfileResponse.getuser?.name ?? "";
    emailController.text = getProfileResponse.getuser?.email ?? "";
    phoneController.text = getProfileResponse.getuser?.number ?? "";
    profilePicUrl.value = getProfileResponse.getuser?.profilePicture ?? "";
  }

  updateProfile() {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        phoneController.text.isEmpty) {
      showToastMessage(title: "Error", message: "Fields required");
    }
    Get.dialog(LoadingIndicator());
    repository
        .updateProfile(nameController.text, phoneController.text,
            emailController.text, file.value.path.isEmpty ? null : file.value)
        .then((value) {
      if (value.data != null) {
        Get.back();
        Get.back();
        showToastMessage(title: "Success", message: "Profile updated");
      }
    });
  }

  @override
  void onClose() {}
}
