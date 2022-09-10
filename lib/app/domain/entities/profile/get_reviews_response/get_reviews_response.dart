import 'rating.dart';

class GetReviewsResponse {
  String? msg;
  List<Rating>? ratings;

  GetReviewsResponse({this.msg, this.ratings});

  factory GetReviewsResponse.fromJson(Map<String, dynamic> json) {
    return GetReviewsResponse(
      msg: json['msg'] as String?,
      ratings: (json['ratings'] as List<dynamic>?)
          ?.map((e) => Rating.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'msg': msg,
        'ratings': ratings?.map((e) => e.toJson()).toList(),
      };
}
