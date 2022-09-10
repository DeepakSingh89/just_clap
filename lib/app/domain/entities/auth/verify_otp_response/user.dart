class User {
  String? id;
  dynamic name;
  dynamic email;
  String? number;
  int? v;

  User({this.id, this.name, this.email, this.number, this.v});

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['_id'] as String?,
        name: json['name'] as dynamic,
        email: json['email'] as dynamic,
        number: json['number'] as String?,
        v: json['__v'] as int?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'email': email,
        'number': number,
        '__v': v,
      };
}
