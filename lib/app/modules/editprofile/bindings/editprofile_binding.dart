import 'package:get/get.dart';
import 'package:justclap/app/data/repositories_impl/auth_repository_impl.dart';
import 'package:justclap/app/data/repositories_impl/profile_repository_impl.dart';
import 'package:justclap/app/domain/repositories/auth_repository.dart';
import 'package:justclap/app/domain/repositories/iprofile_repository.dart';

import '../controllers/editprofile_controller.dart';

class EditprofileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IProfileRepository>(() => ProfileRepositoryImpl());
    Get.lazyPut<EditprofileController>(
      () => EditprofileController(repository: Get.find()),
    );
  }
}
