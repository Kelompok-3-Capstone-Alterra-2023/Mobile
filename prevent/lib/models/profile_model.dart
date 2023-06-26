class UserProfile {
  final int? id;
  final String? createdAt;
  final String? updatedAt;
  final dynamic deletedAt;
  final String email;
  final String username;
  final String fullname;
  final String telpon;
  final String alamat;
  final String gender;
  final String birthdate;

  UserProfile({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    required this.email,
    required this.username,
    required this.fullname,
    required this.telpon,
    required this.alamat,
    required this.gender,
    required this.birthdate,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        id: json["ID"],
        createdAt: json["CreatedAt"],
        updatedAt: json["UpdatedAt"],
        deletedAt: json["DeletedAt"],
        email: json["email"],
        username: json["username"],
        fullname: json["fullname"],
        telpon: json["telpon"],
        alamat: json["alamat"],
        gender: json["gender"],
        birthdate: json["birthdate"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "CreatedAt": createdAt,
        "UpdatedAt": updatedAt,
        "DeletedAt": deletedAt,
        "email": email,
        "username": username,
        "fullname": fullname,
        "telpon": telpon,
        "alamat": alamat,
        "gender": gender,
        "birthdate": birthdate,
      };
}
