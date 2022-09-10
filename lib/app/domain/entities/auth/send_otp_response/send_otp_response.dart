import 'data.dart';

class SendOtpResponse {
  String? message;
  Data? data;
  String? otp;

  SendOtpResponse({this.message, this.data, this.otp});

  factory SendOtpResponse.fromJson(Map<String, dynamic> json) {
    return SendOtpResponse(
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      otp: json['OTP'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'data': data?.toJson(),
        'OTP': otp,
      };
}
