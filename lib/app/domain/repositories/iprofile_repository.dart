import 'dart:io';

import 'package:justclap/app/domain/entities/profile/get_profile_response/get_profile_response.dart';
import 'package:justclap/app/domain/entities/profile/get_reviews_response/get_reviews_response.dart';

import '../../core/utils/app_utils.dart';
import '../entities/base_response/base_response.dart';
import '../params/update_profile_params.dart';

abstract class IProfileRepository {
  Future<DataState<GetProfileResponse>> getProfile();
  Future<DataState<BaseResponse>> updateProfile(
      String name, String number, String email, File? image);
  Future<DataState<GetReviewsResponse>> allReviews();
}
