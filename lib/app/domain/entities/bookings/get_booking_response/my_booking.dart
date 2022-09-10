import 'booking_id.dart';
import 'provider_id.dart';

class MyBooking {
  String? id;
  BookingId? bookingId;
  int? v;
  DateTime? createdAt;
  ProviderId? providerId;
  DateTime? updatedAt;

  MyBooking({
    this.id,
    this.bookingId,
    this.v,
    this.createdAt,
    this.providerId,
    this.updatedAt,
  });

  factory MyBooking.fromJson(Map<String, dynamic> json) => MyBooking(
        id: json['_id'] as String?,
        bookingId: json['bookingId'] == null
            ? null
            : BookingId.fromJson(json['bookingId'] as Map<String, dynamic>),
        v: json['__v'] as int?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        providerId: json['providerId'] == null
            ? null
            : ProviderId.fromJson(json['providerId'] as Map<String, dynamic>),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'bookingId': bookingId?.toJson(),
        '__v': v,
        'createdAt': createdAt?.toIso8601String(),
        'providerId': providerId?.toJson(),
        'updatedAt': updatedAt?.toIso8601String(),
      };
}
