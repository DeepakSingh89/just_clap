import 'package:get/get.dart';
import 'package:justclap/app/domain/repositories/cms_repository.dart';

import '../../../data/repositories_impl/cms_repository_impl.dart';
import '../controllers/termofuse_controller.dart';

class TermofuseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ICMSRepository>(() => CMSRepositoryImpl());
    Get.lazyPut<TermofuseController>(
      () => TermofuseController(repository: Get.find()),
    );
  }
}
