import 'package:get/get.dart';
import 'package:justclap/app/domain/repositories/cms_repository.dart';
import 'package:justclap/app/domain/repositories/iprofile_repository.dart';

import '../../../data/repositories_impl/cms_repository_impl.dart';
import '../controllers/privacypolicy_controller.dart';

class PrivacypolicyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ICMSRepository>(() => CMSRepositoryImpl());
    Get.lazyPut<PrivacypolicyController>(
      () => PrivacypolicyController(repository: Get.find()),
    );
  }
}
