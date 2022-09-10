import 'package:justclap/app/domain/entities/base_response/base_response.dart';
import 'package:justclap/app/domain/entities/cms/get_privacy_response/get_privacy_response.dart';
import 'package:justclap/app/domain/entities/cms/get_tnc_response/get_tnc_response.dart';
import '../../core/utils/app_utils.dart';
import '../entities/cms/add_support_response/add_support_response.dart';
import '../params/add_support_params.dart';

abstract class ICMSRepository {
  Future<DataState<GetTncResponse>> getTnc();
  Future<DataState<GetPrivacyResponse>> getPrivacy();
  Future<DataState<BaseResponse>> addSupport(AddSupportParams params);
  Future<DataState<BaseResponse>> addReport(AddSupportParams params);
}
