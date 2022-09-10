import 'package:get/get.dart';

import '../../../domain/repositories/cms_repository.dart';

class TermofuseController extends GetxController {
  final ICMSRepository repository;
  TermofuseController({required this.repository});
  final tncData = "".obs;
  final loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getTnc();
  }

  getTnc() {
    loading.value = true;
    repository.getTnc().then((value) {
      loading.value = false;
      if (value.data != null) {
        tncData.value = value.data?.data?.field ?? "";
      }
    }, onError: (err) {
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
