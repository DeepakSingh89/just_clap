class Address {
  String? id;
  String? houseno;
  String? landmark;
  String? city;
  String? state;
  String? user;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Address({
    this.id,
    this.houseno,
    this.landmark,
    this.city,
    this.state,
    this.user,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json['_id'] as String?,
        houseno: json['houseno'] as String?,
        landmark: json['landmark'] as String?,
        city: json['city'] as String?,
        state: json['State'] as String?,
        user: json['user'] as String?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        v: json['__v'] as int?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'houseno': houseno,
        'landmark': landmark,
        'city': city,
        'State': state,
        'user': user,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
      };
}
