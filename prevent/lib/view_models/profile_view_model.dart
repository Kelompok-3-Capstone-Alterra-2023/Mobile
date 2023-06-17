import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:prevent/models/profile_model.dart';
import 'package:prevent/services/profile_api.dart';

class ProfileViewModel extends ChangeNotifier {
  ProfileApiService service = ProfileApiService();
  ProfileViewModel() {
    getProfile();
  }
  late UserProfile _userProfile;
  UserProfile get userProfile => _userProfile;
  bool isLoading = true;
  String errorMessage = '';
  Future<void> getProfile() async {
    try {
      _userProfile = await service.getProfile();
      isLoading = false;
      errorMessage = '';
      notifyListeners();
    } on DioException catch (e) {
      errorMessage = e.response!.data['message'];
    } finally {
      notifyListeners();
    }
  }

  Future updateProfile(UserProfile newUserProfile) async {
    try {
      isLoading = true;
      await service.updateProfile(newUserProfile);
      getProfile();
    } catch (e) {
      notifyListeners();
      rethrow;
    } finally {
      notifyListeners();
    }
  }
}
