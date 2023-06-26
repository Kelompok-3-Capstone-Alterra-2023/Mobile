class RecipeModel {
  final String? message;
  final Recipt recipt;

  RecipeModel({
    this.message,
    required this.recipt,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) => RecipeModel(
        message: json["message"],
        recipt: Recipt.fromJson(json["recipt"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "recipt": recipt.toJson(),
      };
}

class Recipt {
  final int? id;
  final String? createdAt;
  final String? updatedAt;
  final dynamic deletedAt;
  final List<Drug>? drugs;
  final int? doctorId;
  final int? userId;

  Recipt({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.drugs,
    this.doctorId,
    this.userId,
  });

  factory Recipt.fromJson(Map<String, dynamic> json) => Recipt(
        id: json["ID"],
        createdAt: json["CreatedAt"],
        updatedAt: json["UpdatedAt"],
        deletedAt: json["DeletedAt"],
        drugs: json["drugs"] == null
            ? []
            : List<Drug>.from(json["drugs"]!.map((x) => Drug.fromJson(x))),
        doctorId: json["doctor_id"],
        userId: json["UserID"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "CreatedAt": createdAt,
        "UpdatedAt": updatedAt,
        "DeletedAt": deletedAt,
        "drugs": drugs == null
            ? []
            : List<dynamic>.from(drugs!.map((x) => x.toJson())),
        "doctor_id": doctorId,
        "UserID": userId,
      };
}

class Drug {
  final int? id;
  final String? createdAt;
  final String? updatedAt;
  final dynamic deletedAt;
  final String? nama;

  Drug({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.nama,
  });

  factory Drug.fromJson(Map<String, dynamic> json) => Drug(
        id: json["ID"],
        createdAt: json["CreatedAt"],
        updatedAt: json["UpdatedAt"],
        deletedAt: json["DeletedAt"],
        nama: json["nama"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "CreatedAt": createdAt,
        "UpdatedAt": updatedAt,
        "DeletedAt": deletedAt,
        "nama": nama,
      };
}
