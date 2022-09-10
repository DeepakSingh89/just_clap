import 'package:get/get.dart';
import 'package:justclap/app/domain/repositories/cms_repository.dart';

class PrivacypolicyController extends GetxController {
  final ICMSRepository repository;
  PrivacypolicyController({required this.repository});
  final privacyData = "".obs;
  final loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getPrivacy();
  }

  getPrivacy() {
    loading.value = true;
    repository.getPrivacy().then((value) {
      loading.value = false;
      if (value.data != null) {
        privacyData.value = value.data?.data?.policy ?? "";
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
