import 'package:get/get.dart';
import 'package:justclap/app/domain/entities/profile/get_reviews_response/rating.dart';

import '../../../domain/repositories/iprofile_repository.dart';

class ReviewsController extends GetxController {
  final IProfileRepository repository;
  ReviewsController({required this.repository});

  @override
  void onInit() {
    super.onInit();
    getallReviews();
  }

  final loading = false.obs;
  final allReviews = <Rating>[].obs;

  getallReviews() {
    loading.value = true;
    repository.allReviews().then((value) {
      loading.value = false;
      if (value.data != null) {
        allReviews.value = value.data?.ratings ?? [];
      }
    }, onError: (onError) {
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
