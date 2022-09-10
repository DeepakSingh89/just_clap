import 'data.dart';

class GetTncResponse {
  String? msg;
  Data? data;

  GetTncResponse({this.msg, this.data});

  factory GetTncResponse.fromJson(Map<String, dynamic> json) {
    return GetTncResponse(
      msg: json['msg'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'msg': msg,
        'data': data?.toJson(),
      };
}
