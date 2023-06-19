class Doctor {
  final int id;
  final String createdAt;
  final String updatedAt;
  final String? deletedAt;
  final String email;
  final String password;
  final String fullName;
  final String displayName;
  final String nik;
  final String gender;
  final String birthPlace;
  final String birthDate;
  final String religion;
  final String alumnus;
  final String jurusan;
  final String work;
  final String gradYear;
  final String alumnus2;
  final String jurusan2;
  final String gradYear2;
  final String dateOfEntry;
  final String dateOfOut;
  final String practiceAddress;
  final int price;
  final int balance;
  final String photo;
  final String cv;
  final String ijazah;
  final String str;
  final String sip;
  final bool statusOnline;
  final String status;
  final String strNumber;
  final String specialist;
  final String description;
  final dynamic chatWithUser;

  Doctor({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.email,
    required this.password,
    required this.fullName,
    required this.displayName,
    required this.nik,
    required this.gender,
    required this.birthPlace,
    required this.birthDate,
    required this.religion,
    required this.alumnus,
    required this.jurusan,
    required this.work,
    required this.gradYear,
    required this.alumnus2,
    required this.jurusan2,
    required this.gradYear2,
    required this.dateOfEntry,
    required this.dateOfOut,
    required this.practiceAddress,
    required this.price,
    required this.balance,
    required this.photo,
    required this.cv,
    required this.ijazah,
    required this.str,
    required this.sip,
    required this.statusOnline,
    required this.status,
    required this.strNumber,
    required this.specialist,
    required this.description,
    required this.chatWithUser,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['ID'],
      createdAt: json['CreatedAt'],
      updatedAt: json['UpdatedAt'],
      deletedAt: json['DeletedAt'],
      email: json['email'],
      password: json['password'],
      fullName: json['full_name'],
      displayName: json['display_name'],
      nik: json['nik'],
      gender: json['gender'],
      birthPlace: json['birth_place'],
      birthDate: json['birth_date'],
      religion: json['religion'],
      alumnus: json['alumnus'],
      jurusan: json['jurusan'],
      work: json['work'],
      gradYear: json['grad_year'],
      alumnus2: json['alumnus2'],
      jurusan2: json['jurusan2'],
      gradYear2: json['grad_year2'],
      dateOfEntry: json['date_of_entry'],
      dateOfOut: json['date_of_out'],
      practiceAddress: json['practice_address'],
      price: json['price'],
      balance: json['balance'],
      photo: json['photo'],
      cv: json['cv'],
      ijazah: json['ijazah'],
      str: json['str'],
      sip: json['sip'],
      statusOnline: json['status_online'],
      status: json['status'],
      strNumber: json['str_number'],
      specialist: json['specialist'],
      description: json['description'],
      chatWithUser: json['ChatwithUser'],
    );
  }
}
