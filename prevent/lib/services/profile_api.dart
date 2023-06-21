import 'package:dio/dio.dart';
import 'package:prevent/models/profile_model.dart';
import 'package:prevent/util/common.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileApiService {
  final Dio dio = Dio();
  ProfileApiService() {
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
  Future<UserProfile> getProfile() async {
    try {
      final respone = await dio.get(
        '${Urls.baseUrl}${Urls.users}/',
      );
      return UserProfile.fromJson(respone.data);
    } on DioException {
      rethrow;
    }
  }

  Future<Object> updateProfile(UserProfile newUserProfile) async {
    try {
      final repsone = await dio.put('${Urls.baseUrl}${Urls.users}/',
          data: newUserProfile.toJson());
      return repsone;
    } on DioException {
      rethrow;
    }
  }
}
