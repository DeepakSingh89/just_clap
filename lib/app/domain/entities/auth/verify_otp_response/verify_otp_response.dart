import 'user.dart';

class VerifyOtpResponse {
  String? msg;
  User? user;
  String? token;

  VerifyOtpResponse({this.msg, this.user, this.token});

  factory VerifyOtpResponse.fromJson(Map<String, dynamic> json) {
    return VerifyOtpResponse(
      msg: json['msg'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'msg': msg,
        'user': user?.toJson(),
        'token': token,
      };
}
