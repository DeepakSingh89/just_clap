class Getuser {
  String? id;
  String? name;
  String? email;
  String? number;
  int? v;
  String? profilePicture;
  List<dynamic>? jobs;

  Getuser({
    this.id,
    this.name,
    this.email,
    this.number,
    this.v,
    this.profilePicture,
    this.jobs,
  });

  factory Getuser.fromJson(Map<String, dynamic> json) => Getuser(
        id: json['_id'] as String?,
        name: json['name'] as String?,
        email: json['email'] as String?,
        number: json['number'] as String?,
        v: json['__v'] as int?,
        profilePicture: json['profile_picture'] as String?,
        jobs: json['jobs'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'email': email,
        'number': number,
        '__v': v,
        'profile_picture': profilePicture,
        'jobs': jobs,
      };
}
