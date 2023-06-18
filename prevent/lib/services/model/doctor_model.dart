class Doctor {
  List<Doctors>? doctors;
  String? message;

  Doctor({this.doctors, this.message});

  Doctor.fromJson(Map<String, dynamic> json) {
    if (json['doctors'] != null) {
      doctors = <Doctors>[];
      json['doctors'].forEach((v) {
        doctors!.add(Doctors.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (doctors != null) {
      data['doctors'] = doctors!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class Doctors {
  int? iD;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? email;
  String? password;
  String? fullName;
  String? displayName;
  String? nik;
  String? gender;
  String? birthPlace;
  String? birthDate;
  String? religion;
  String? alumnus;
  String? jurusan;
  String? work;
  String? gradYear;
  String? alumnus2;
  String? jurusan2;
  String? gradYear2;
  String? dateOfEntry;
  String? dateOfOut;
  String? practiceAddress;
  int? price;
  int? balance;
  String? photo;
  String? cv;
  String? ijazah;
  String? str;
  String? sip;
  bool? statusOnline;
  String? status;
  String? strNumber;
  String? specialist;
  String? description;

  Doctors(
      {this.iD,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.email,
      this.password,
      this.fullName,
      this.displayName,
      this.nik,
      this.gender,
      this.birthPlace,
      this.birthDate,
      this.religion,
      this.alumnus,
      this.jurusan,
      this.work,
      this.gradYear,
      this.alumnus2,
      this.jurusan2,
      this.gradYear2,
      this.dateOfEntry,
      this.dateOfOut,
      this.practiceAddress,
      this.price,
      this.balance,
      this.photo,
      this.cv,
      this.ijazah,
      this.str,
      this.sip,
      this.statusOnline,
      this.status,
      this.strNumber,
      this.specialist,
      this.description});

  Doctors.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    createdAt = json['CreatedAt'];
    updatedAt = json['UpdatedAt'];
    deletedAt = json['DeletedAt'];
    email = json['email'];
    password = json['password'];
    fullName = json['full_name'];
    displayName = json['display_name'];
    nik = json['nik'];
    gender = json['gender'];
    birthPlace = json['birth_place'];
    birthDate = json['birth_date'];
    religion = json['religion'];
    alumnus = json['alumnus'];
    jurusan = json['jurusan'];
    work = json['work'];
    gradYear = json['grad_year'];
    alumnus2 = json['alumnus2'];
    jurusan2 = json['jurusan2'];
    gradYear2 = json['grad_year2'];
    dateOfEntry = json['date_of_entry'];
    dateOfOut = json['date_of_out'];
    practiceAddress = json['practice_address'];
    price = json['price'];
    balance = json['balance'];
    photo = json['photo'];
    cv = json['cv'];
    ijazah = json['ijazah'];
    str = json['str'];
    sip = json['sip'];
    statusOnline = json['status_online'];
    status = json['status'];
    strNumber = json['str_number'];
    specialist = json['specialist'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = iD;
    data['CreatedAt'] = createdAt;
    data['UpdatedAt'] = updatedAt;
    data['DeletedAt'] = deletedAt;
    data['email'] = email;
    data['password'] = password;
    data['full_name'] = fullName;
    data['display_name'] = displayName;
    data['nik'] = nik;
    data['gender'] = gender;
    data['birth_place'] = birthPlace;
    data['birth_date'] = birthDate;
    data['religion'] = religion;
    data['alumnus'] = alumnus;
    data['jurusan'] = jurusan;
    data['work'] = work;
    data['grad_year'] = gradYear;
    data['alumnus2'] = alumnus2;
    data['jurusan2'] = jurusan2;
    data['grad_year2'] = gradYear2;
    data['date_of_entry'] = dateOfEntry;
    data['date_of_out'] = dateOfOut;
    data['practice_address'] = practiceAddress;
    data['price'] = price;
    data['balance'] = balance;
    data['photo'] = photo;
    data['cv'] = cv;
    data['ijazah'] = ijazah;
    data['str'] = str;
    data['sip'] = sip;
    data['status_online'] = statusOnline;
    data['status'] = status;
    data['str_number'] = strNumber;
    data['specialist'] = specialist;
    data['description'] = description;
    return data;
  }
}
