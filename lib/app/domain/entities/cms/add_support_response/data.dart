class Data {
  String? name;
  String? email;
  String? id;

  Data({this.name, this.email, this.id});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json['name'] as String?,
        email: json['email'] as String?,
        id: json['_id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        '_id': id,
      };
}
