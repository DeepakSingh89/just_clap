class AddSupportParams {
  String? name;
  String? email;
  String? message;

  AddSupportParams({this.name, this.email, this.message});

  factory AddSupportParams.fromJson(Map<String, dynamic> json) {
    return AddSupportParams(
      name: json['name'] as String?,
      email: json['email'] as String?,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'message': message,
      };
}
