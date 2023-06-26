import 'package:flutter/material.dart';
import 'package:prevent/models/recipe_medicine.dart';
import 'package:prevent/services/doctor_api.dart';

import '../models/doctor_model.dart';

class DoctorViewModel extends ChangeNotifier {
  final DoctorApiService apiService = DoctorApiService();

  List<Doctor> _doctors = [];
  List<Doctor> get doctors => _doctors;

  Future<void> fetchDoctors() async {
    try {
      _doctors = await apiService.fetchDoctors();
      notifyListeners();
    } catch (error) {
      debugPrint('Failed to fetch doctors: $error');
    }
  }

  Future<RecipeModel> getRecipe({required int idDoctor}) async {
    RecipeModel recipeMedicine = await apiService.getRecipeMedicine(idDoctor: idDoctor);
    notifyListeners();
    return recipeMedicine;
  }
}
