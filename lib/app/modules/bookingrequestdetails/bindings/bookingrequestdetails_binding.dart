import 'package:get/get.dart';

import '../controllers/bookingrequestdetails_controller.dart';

class BookingrequestdetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookingrequestdetailsController>(
      () => BookingrequestdetailsController(),
    );
  }
}
