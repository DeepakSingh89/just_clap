import 'data.dart';

class GetPrivacyResponse {
  String? message;
  Data? data;

  GetPrivacyResponse({this.message, this.data});

  factory GetPrivacyResponse.fromJson(Map<String, dynamic> json) {
    return GetPrivacyResponse(
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'data': data?.toJson(),
      };
}
