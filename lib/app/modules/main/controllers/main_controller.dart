import 'package:get/get.dart';

class MainController extends GetxController {
  DateTime? currentBackPressTime;
  final currentIndex = 1.obs;

  @override
  void onInit() {
    super.onInit();
  }

  changeIndex(index) {
    currentIndex.value = index;
  }

  @override
  void onClose() {}
}
