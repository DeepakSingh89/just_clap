class UpdateProfileParams {
  String? name;
  String? number;
  String? email;

  UpdateProfileParams({this.name, this.number, this.email});

  factory UpdateProfileParams.fromJson(Map<String, dynamic> json) {
    return UpdateProfileParams(
      name: json['name'] as String?,
      number: json['number'] as String?,
      email: json['email'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'number': number,
        'email': email,
      };
}
