import 'my_booking.dart';

class GetBookingResponse {
  String? message;
  List<MyBooking>? myBooking;

  GetBookingResponse({this.message, this.myBooking});

  factory GetBookingResponse.fromJson(Map<String, dynamic> json) {
    return GetBookingResponse(
      message: json['message'] as String?,
      myBooking: (json['myBooking'] as List<dynamic>?)
          ?.map((e) => MyBooking.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'myBooking': myBooking?.map((e) => e.toJson()).toList(),
      };
}
