class RateBookingParams {
  String? serviceProvider;
  String? review;
  String? rating;

  RateBookingParams({this.serviceProvider, this.review, this.rating});

  factory RateBookingParams.fromJson(Map<String, dynamic> json) {
    return RateBookingParams(
      serviceProvider: json['serviceProvider'] as String?,
      review: json['review'] as String?,
      rating: json['rating'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'serviceProvider': serviceProvider,
        'review': review,
        'rating': rating,
      };
}
