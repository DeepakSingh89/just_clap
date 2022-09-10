import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justclap/app/domain/entities/profile/get_profile_response/get_profile_response.dart';
import 'package:justclap/app/domain/repositories/iprofile_repository.dart';

class ProfileController extends GetxController {
  final IProfileRepository repository;
  ProfileController({required this.repository});
  final response = GetProfileResponse().obs;

  @override
  void onInit() {
    super.onInit();
    getProfile();
  }

  final loading = false.obs;

  getProfile() {
    loading.value = true;
    debugPrint("mkmkk");
    repository.getProfile().then((value) {
      loading.value = false;
      if (value.data != null) {
        response.value = value.data!;
      }
    }, onError: (err) {
      debugPrint("getting $err");
      loading.value = false;
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
