import 'package:dio/dio.dart';
import 'package:prevent/models/recipe_medicine.dart';
import 'package:prevent/util/common.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/doctor_model.dart';

class DoctorApiService {
  Dio dio = Dio();
  DoctorApiService() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          SharedPreferences pref = await SharedPreferences.getInstance();
          final String? token = pref.getString('token');
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
      ),
    );
  }

  Future<List<Doctor>> fetchDoctors() async {
    try {
      final response = await dio.get(
        'https://capstone-project.duckdns.org:8080/user/doctors',
      );

      final Map<String, dynamic> data = response.data;
      final List<dynamic> doctorData = data['doctors'];

      final List<Doctor> doctors =
          doctorData.map((json) => Doctor.fromJson(json)).toList();

      return doctors;
    } catch (error) {
      throw Exception('Failed to fetch doctors: $error');
    }
  }

  Future<RecipeModel> getRecipeMedicine({required int idDoctor}) async {
    try {
      final response = await dio.get('${Urls.baseUrl}user/recipt/2');

      final RecipeModel recipe = RecipeModel.fromJson(response.data);
      return recipe;
    } catch (error) {
      rethrow;
    }
  }
}
