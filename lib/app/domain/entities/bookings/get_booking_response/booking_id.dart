import 'package:get/get.dart';

import 'address.dart';
import 'user.dart';

class BookingId {
  String? id;
  String? serviceId;
  DateTime? date;
  String? time;
  Address? address;
  String? paymentStatus;
  String? booking;
  bool? accept;
  int? price;
  int? paybaleprice;
  String? stripeOrderId;
  User? user;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? assiggned;
  RxString? orderstatus;
  String? provider;

  BookingId({
    this.id,
    this.serviceId,
    this.date,
    this.time,
    this.address,
    this.paymentStatus,
    this.booking,
    this.accept,
    this.price,
    this.paybaleprice,
    this.stripeOrderId,
    this.user,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.assiggned,
    this.orderstatus,
    this.provider,
  });

  factory BookingId.fromJson(Map<String, dynamic> json) => BookingId(
        id: json['_id'] as String?,
        serviceId: json['serviceId'] as String?,
        date: json['date'] == null
            ? null
            : DateTime.parse(json['date'] as String),
        time: json['time'] as String?,
        address: json['address'] == null
            ? null
            : Address.fromJson(json['address'] as Map<String, dynamic>),
        paymentStatus: json['payment_status'] as String?,
        booking: json['booking'] as String?,
        accept: json['accept'] as bool?,
        price: json['price'] as int?,
        paybaleprice: json['paybaleprice'] as int?,
        stripeOrderId: json['stripe_order_id'] as String?,
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        v: json['__v'] as int?,
        assiggned: json['assiggned'] as String?,
        orderstatus: RxString(json['orderstatus'] as String),
        provider: json['provider'] as String?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'serviceId': serviceId,
        'date': date?.toIso8601String(),
        'time': time,
        'address': address?.toJson(),
        'payment_status': paymentStatus,
        'booking': booking,
        'accept': accept,
        'price': price,
        'paybaleprice': paybaleprice,
        'stripe_order_id': stripeOrderId,
        'user': user?.toJson(),
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
        'assiggned': assiggned,
        'orderstatus': orderstatus,
        'provider': provider,
      };
}
