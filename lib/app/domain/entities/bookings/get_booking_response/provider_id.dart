import 'service_id.dart';

class ProviderId {
  String? id;
  List<ServiceId>? serviceId;
  String? name;
  String? email;
  String? profile;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? number;

  ProviderId({
    this.id,
    this.serviceId,
    this.name,
    this.email,
    this.profile,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.number,
  });

  factory ProviderId.fromJson(Map<String, dynamic> json) => ProviderId(
        id: json['_id'] as String?,
        serviceId: (json['serviceId'] as List<dynamic>?)
            ?.map((e) => ServiceId.fromJson(e as Map<String, dynamic>))
            .toList(),
        name: json['name'] as String?,
        email: json['email'] as String?,
        profile: json['profile'] as String?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        v: json['__v'] as int?,
        number: json['number'] as String?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'serviceId': serviceId?.map((e) => e.toJson()).toList(),
        'name': name,
        'email': email,
        'profile': profile,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
        'number': number,
      };
}
