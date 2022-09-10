import 'package:justclap/app/domain/entities/auth/send_otp_response/send_otp_response.dart';
import 'package:justclap/app/domain/entities/auth/verify_otp_response/verify_otp_response.dart';
import 'package:justclap/app/domain/params/verify_otp_params.dart';

import '../../core/utils/app_utils.dart';
import '../entities/base_response/base_response.dart';
import '../params/update_profile_params.dart';

abstract class IAuthRepository {
  Future<DataState<VerifyOtpResponse>> verifyOTP(VerifyOtpParams params);
  Future<DataState<SendOtpResponse>> sendOTP(String number);
}
