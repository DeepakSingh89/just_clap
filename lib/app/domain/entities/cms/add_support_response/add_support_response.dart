import 'data.dart';

class AddSupportResponse {
  String? message;
  Data? data;

  AddSupportResponse({this.message, this.data});

  factory AddSupportResponse.fromJson(Map<String, dynamic> json) {
    return AddSupportResponse(
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
