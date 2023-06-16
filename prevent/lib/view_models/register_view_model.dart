import 'package:flutter/material.dart';

import '../services/user_api.dart';

class RegisterViewModel extends ChangeNotifier {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  TextEditingController tanggalController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final primaryColor = const Color(0xff7CA153);

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  // tanggal
  List<DateTime?> _date = [
    DateTime.now(),
  ];
  final currentDate = DateTime.now();
  List<DateTime?> get date => _date;

  final UserApiService apiService = UserApiService();

  void toggleObscurePassword() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }

  void toggleObscureConfirmPassword() {
    obscureConfirmPassword = !obscureConfirmPassword;
    notifyListeners();
  }

  void setDate(List<DateTime?> value) {
    _date = value;
    notifyListeners();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isLoadingOtp = false;
  bool get isLoadingOtp => _isLoadingOtp;

  bool _isRegisterSuccess = false;
  bool _isOTPVerificationSuccess = false;

  bool get isRegisterSuccess => _isRegisterSuccess;
  bool get isOTPVerificationSuccess => _isOTPVerificationSuccess;

  Future<void> registerUser(
      String email, String username, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      _isRegisterSuccess =
          await apiService.registerUser(email, username, password);

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      rethrow;
    }
  }

  Future<void> checkOtp(
      String email, String username, String password, String otp) async {
    _isLoadingOtp = true;
    notifyListeners();

    try {
      _isOTPVerificationSuccess =
          await apiService.checkOtp(email, username, password, otp);

      _isLoadingOtp = false;
      notifyListeners();
    } catch (e) {
      _isLoadingOtp = false;
      notifyListeners();
      rethrow;
    }
  }

  // Future<void> checkOtp(
  //     String email, String username, String password, String otp) async {
  //   try {
  //     verificationOtp = await apiService.checkOtp(email, username, password, otp);
  //     _isLoading = true;
  //     notifyListeners();
  //     return verificationOtp;
  //   } catch (e) {
  //     _isLoading = false;
  //     notifyListeners();
  //     rethrow;
  //   }
  // }
}
