class User {
  String? id;
  bool? isregistered;
  String? number;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? email;
  String? image;
  String? name;

  User({
    this.id,
    this.isregistered,
    this.number,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.email,
    this.image,
    this.name,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['_id'] as String?,
        isregistered: json['isregistered'] as bool?,
        number: json['number'] as String?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        v: json['__v'] as int?,
        email: json['email'] as String?,
        image: json['image'] as String?,
        name: json['name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'isregistered': isregistered,
        'number': number,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
        'email': email,
        'image': image,
        'name': name,
      };
}
