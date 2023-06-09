class Doctor {
  int id;
  String email;
  String password;
  String fullName;
  String displayName;
  String nik;
  String gender;
  String birthPlace;
  DateTime birthDate;
  String religion;
  String alumnus;
  String jurusan;
  int workExperience;
  String work;
  String gradYear;
  String alumnus2;
  String jurusan2;
  String gradYear2;
  String yearEntry;
  String yearOut;
  String practiceAddress;
  int price;
  int balance;
  String propic;
  String cv;
  String ijazah;
  String str;
  String sip;
  bool statusOnline;
  String status;
  String strNumber;
  String specialist;
  String description;
  dynamic chatWithUser;

  Doctor({
    required this.id,
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
    required this.workExperience,
    required this.work,
    required this.gradYear,
    required this.alumnus2,
    required this.jurusan2,
    required this.gradYear2,
    required this.yearEntry,
    required this.yearOut,
    required this.practiceAddress,
    required this.price,
    required this.balance,
    required this.propic,
    required this.cv,
    required this.ijazah,
    required this.str,
    required this.sip,
    required this.statusOnline,
    required this.status,
    required this.strNumber,
    required this.specialist,
    required this.description,
    this.chatWithUser,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['ID'],
      email: json['email'],
      password: json['password'],
      fullName: json['full_name'],
      displayName: json['display_name'],
      nik: json['nik'],
      gender: json['gender'],
      birthPlace: json['birth_place'],
      birthDate: DateTime.parse(json['birth_date']),
      religion: json['religion'],
      alumnus: json['alumnus'],
      jurusan: json['jurusan'],
      workExperience: json['work_experience'],
      work: json['work'],
      gradYear: json['grad_year'],
      alumnus2: json['alumnus2'],
      jurusan2: json['jurusan2'],
      gradYear2: json['grad_year2'],
      yearEntry: json['year_entry'],
      yearOut: json['year_out'],
      practiceAddress: json['practice_address'],
      price: json['price'],
      balance: json['balance'],
      propic: json['propic'],
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
