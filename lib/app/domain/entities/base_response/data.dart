class Data {
  String? id;
  String? name;
  String? email;
  String? number;
  int? v;

  Data({this.id, this.name, this.email, this.number, this.v});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json['_id'] as String?,
        name: json['name'] as String?,
        email: json['email'] as String?,
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
