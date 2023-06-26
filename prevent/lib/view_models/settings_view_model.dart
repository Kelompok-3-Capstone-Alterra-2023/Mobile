import 'package:flutter/material.dart';

import '../services/user_api.dart';

// import '../util/common.dart';

class SettingsViewModel extends ChangeNotifier {
  final UserApiService apiService = UserApiService();

  List<String> list = [
    'Saya ingin menghapus profil',
    "Saya tidak akan menggunakan lagi",
    "Lainnya"
  ];

  bool isStrechedDropDown = false;

  int? groupValue;
  String _title = 'Pilih alasan yang sesuai';
  String get title => _title;
  // String titlee =   AppLocalizations.of(context)!.dropDownFirst;

  String termsAndConditionsFirst =
      'Jadwal konsultasi yang masih aktif menjadi tidak tersedia dan tidak dapat dikembalikan.';

  String termsAndConditionsSecond = 'Semua Profil akan dihapus.';
  String termsAndConditionsThird =
      'Semua Riwayat pesanan menjadi tidak tersedia.';

  bool agreeToTheTermsAndConditions = false;

  String? selectedCause = "";

  bool _isDeleteSuccess = false;

  bool get isRegisterSuccess => _isDeleteSuccess;

  final List<String> causeList = [
    'Saya ingin menghapus profil',
    'Saya tidak akan menggunakan lagi',
    'Lainnya'
  ];
  set title(String value) {
    if (_title != value) {
      _title = value;
      notifyListeners();
    }
  }

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

  Future<void> deleteUser() async {
    try {
      _isDeleteSuccess = await apiService.deleteUser();
      notifyListeners();
    } catch (e) {
      notifyListeners();
      throw Exception('Failed to delete account: $e');
    }
  }
}
