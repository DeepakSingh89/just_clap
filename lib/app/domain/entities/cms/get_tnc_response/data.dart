class Data {
  String? id;
  String? field;
  String? createdAt;
  String? updatedAt;
  int? v;

  Data({this.id, this.field, this.createdAt, this.updatedAt, this.v});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json['_id'] as String?,
        field: json['field'] as String?,
        createdAt: json['createdAt'] as String?,
        updatedAt: json['updatedAt'] as String?,
        v: json['__v'] as int?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'field': field,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        '__v': v,
      };
}
