class User {
  String? id;
  String? name;
  String? email;
  String? number;

  User({this.id, this.name, this.email, this.number});

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['_id'] as String?,
        name: json['name'] as String?,
        email: json['email'] as String?,
        number: json['number'] as String?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'email': email,
        'number': number,
      };
}
