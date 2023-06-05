import 'package:flutter/material.dart';

import '../util/common.dart';

// import '../util/common.dart';

class SettingsViewModel extends ChangeNotifier {
  // void listDeleteAccount(BuildContext context) {
  //   List<String> list = [
  //     AppLocalizations.of(context)!.reasonDeleteAccountOne,
  //     AppLocalizations.of(context)!.reasonDeleteAccountTwo,
  //     AppLocalizations.of(context)!.reasonDeleteAccountThree,
  //     // 'Saya ingin menghapus profil',
  //     // "Saya tidak akan menggunakan lagi",
  //     // "Lainnya"
  //   ];
  // }

  // AppLocalizations.of(context)!.inputReason
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
  // String termsAndConditionsThirder = AppLocalizations.of(context)!.onBoardingOneTitle;

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
