import 'package:get/get.dart';

import '../controllers/bookingrequest_controller.dart';

class BookingrequestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookingrequestController>(
      () => BookingrequestController(),
    );
  }
}
