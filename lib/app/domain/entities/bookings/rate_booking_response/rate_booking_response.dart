import 'rating.dart';

class RateBookingResponse {
  String? msg;
  Rating? rating;

  RateBookingResponse({this.msg, this.rating});

  factory RateBookingResponse.fromJson(Map<String, dynamic> json) {
    return RateBookingResponse(
      msg: json['msg'] as String?,
      rating: json['Rating'] == null
          ? null
          : Rating.fromJson(json['Rating'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'msg': msg,
        'Rating': rating?.toJson(),
      };
}
