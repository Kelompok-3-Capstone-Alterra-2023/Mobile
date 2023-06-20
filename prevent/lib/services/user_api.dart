import 'package:dio/dio.dart';
import 'package:prevent/util/common.dart';

class UserApiService {
  final Dio dio = Dio();

  Future<String> loginUser(String email, String password) async {
    try {
      final response = await dio.post(
        '${Urls.baseUrl}${Urls.users}/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        // Jika login berhasil, kembalikan token
        final token = response.data['token'];
        return token;
      } else {
        // Jika login gagal, throw error
        throw Exception('Login failed');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> registerUser(
      String email, String username, String password) async {
    try {
      final response = await dio.post(
        '${Urls.baseUrl}${Urls.users}/register',
        data: {'email': email, 'username': username, 'password': password},
      );

      if (response.statusCode == 200) {
        // Register success, redirect to VerificationCodeScreen
        return true;
      } else {
        // Register failed
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> checkOtp(
      String email, String username, String password, String otp) async {
    try {
      final response = await dio.post(
        '${Urls.baseUrl}${Urls.users}/register',
        data: {
          'email': email,
          'username': username,
          'password': password,
          'otp': otp
        },
      );
      if (response.statusCode == 200) {
        // OTP verification success
        return true;
      } else if (response.statusCode == 400) {
        return false;
      } else {
        // OTP verification failed
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }
}
