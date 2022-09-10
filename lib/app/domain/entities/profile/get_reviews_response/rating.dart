import 'user.dart';

class Rating {
  String? id;
  String? review;
  int? rating;
  User? user;
  String? createdAt;

  Rating({this.id, this.review, this.rating, this.user, this.createdAt});

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        id: json['_id'] as String?,
        review: json['review'] as String?,
        rating: json['rating'] as int?,
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
        createdAt: json['createdAt'] as String?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'review': review,
        'rating': rating,
        'user': user?.toJson(),
        'createdAt': createdAt
      };
}
