class ServiceId {
  String? id;
  String? categoryId;
  String? name;
  int? price;
  int? discountedPrice;
  String? image;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  ServiceId({
    this.id,
    this.categoryId,
    this.name,
    this.price,
    this.discountedPrice,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory ServiceId.fromJson(Map<String, dynamic> json) => ServiceId(
        id: json['_id'] as String?,
        categoryId: json['categoryId'] as String?,
        name: json['name'] as String?,
        price: json['price'] as int?,
        discountedPrice: json['discountedPrice'] as int?,
        image: json['image'] as String?,
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
        'categoryId': categoryId,
        'name': name,
        'price': price,
        'discountedPrice': discountedPrice,
        'image': image,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
      };
}
