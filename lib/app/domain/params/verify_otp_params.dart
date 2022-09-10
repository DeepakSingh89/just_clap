class VerifyOtpParams {
  String? number;
  String? otp;

  VerifyOtpParams({this.number, this.otp});

  factory VerifyOtpParams.fromJson(Map<String, dynamic> json) {
    return VerifyOtpParams(
      number: json['number'] as String?,
      otp: json['otp'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'number': number,
        'otp': otp,
      };
}
