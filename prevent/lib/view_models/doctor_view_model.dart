import 'package:flutter/material.dart';
import 'package:prevent/services/doctor_api.dart';

import '../services/model/doctor_model.dart';

class DoctorViewModel extends ChangeNotifier {
  final DoctorApiService apiService = DoctorApiService();

  List<Doctor> _doctors = [];
  List<Doctor> get doctors => _doctors;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchDoctors() async {
    _isLoading = true;
    notifyListeners();

    try {
      // Panggil API untuk mengambil data dokter
      final response = await apiService.fetchDoctors();

      // Jika berhasil, perbarui _doctors
      _doctors = response;
    } catch (error) {
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
