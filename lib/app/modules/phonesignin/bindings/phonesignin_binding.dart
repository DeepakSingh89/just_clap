import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:justclap/app/data/repositories_impl/auth_repository_impl.dart';

import '../../../domain/repositories/auth_repository.dart';
import '../controllers/phonesignin_controller.dart';

class PhonesigninBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetStorage>(() => GetStorage());
    Get.lazyPut<IAuthRepository>(() => AuthRepositoryImpl());
    Get.lazyPut<PhonesigninController>(
      () => PhonesigninController(repository: Get.find()),
    );
  }
}
