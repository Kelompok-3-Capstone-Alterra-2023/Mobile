import 'package:flutter/material.dart';

class SettingsViewModel extends ChangeNotifier {
  List<String> list = [
    'Saya ingin menghapus profil',
    "Saya tidak akan menggunakan lagi",
    "Lainnya"
  ];

  bool isStrechedDropDown = false;

  int? groupValue;
  String title = 'Pilih alasan yang sesuai';

  String termsAndConditionsFirst =
      'Jadwal konsultasi yang masih aktif menjadi tidak tersedia dan tidak dapat dikembalikan.';

  String termsAndConditionsSecond = 'Semua Profil akan dihapus.';
  String termsAndConditionsThird =
      'Semua Riwayat pesanan menjadi tidak tersedia.';

  bool agreeToTheTermsAndConditions = false;

  String? selectedCause = "";

  final List<String> causeList = [
    'Saya ingin menghapus profil',
    'Saya tidak akan menggunakan lagi',
    'Lainnya'
  ];

  void toggleTermsAndConditions() {
    agreeToTheTermsAndConditions = !agreeToTheTermsAndConditions;
    notifyListeners();
  }

  void isStrechedDropDownTrue() {
    isStrechedDropDown = !isStrechedDropDown;
    notifyListeners();
  }

  void firstState() {
    selectedCause = causeList[0];
    notifyListeners();
  }
}
