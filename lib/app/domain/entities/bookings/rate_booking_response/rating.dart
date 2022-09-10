class Rating {
  String? serviceProvider;
  String? review;
  int? rating;
  String? id;
  String? user;
  int? v;

  Rating({
    this.serviceProvider,
    this.review,
    this.rating,
    this.id,
    this.user,
    this.v,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        serviceProvider: json['serviceProvider'] as String?,
        review: json['review'] as String?,
        rating: json['rating'] as int?,
        id: json['_id'] as String?,
        user: json['user'] as String?,
        v: json['__v'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'serviceProvider': serviceProvider,
        'review': review,
        'rating': rating,
        '_id': id,
        'user': user,
        '__v': v,
      };
}
