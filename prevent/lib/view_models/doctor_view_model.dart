import 'package:flutter/material.dart';
import 'package:prevent/services/doctor_api.dart';

import '../services/model/doctor_model.dart';

class DoctorViewModel extends ChangeNotifier {
  final DoctorApiService apiService = DoctorApiService();

  List<Doctor> _doctors = [];
  List<Doctor> get doctors => _doctors;

  Future<void> fetchDoctors() async {
    try {
      _doctors = await apiService.fetchDoctors();
      debugPrint(_doctors[0].email);
      notifyListeners();
    } catch (error) {
      debugPrint('Failed to fetch doctors: $error');
    }
  }
}
