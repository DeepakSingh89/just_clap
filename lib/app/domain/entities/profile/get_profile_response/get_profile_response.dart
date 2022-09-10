import 'getuser.dart';

class GetProfileResponse {
  String? msg;
  Getuser? getuser;

  GetProfileResponse({this.msg, this.getuser});

  factory GetProfileResponse.fromJson(Map<String, dynamic> json) {
    return GetProfileResponse(
      msg: json['msg'] as String?,
      getuser: json['getuser'] == null
          ? null
          : Getuser.fromJson(json['getuser'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'msg': msg,
        'getuser': getuser?.toJson(),
      };
}
