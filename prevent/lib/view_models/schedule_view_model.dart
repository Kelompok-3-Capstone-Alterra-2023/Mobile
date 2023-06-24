import 'package:flutter/material.dart';
import 'package:prevent/services/schedule_api.dart';

class ScheduleOrderViewModel extends ChangeNotifier {
  final ScheduleApiService apiService = ScheduleApiService();

  Future<void> scheduleOrder(int doctorId, String schedule, int serviceFee,
      int price, String method) async {
    notifyListeners();

    try {
      final response = await apiService.postSchedule(
          doctorId, schedule, serviceFee, price, method);
      // Lakukan sesuatu dengan response jika perlu
      notifyListeners();
      return response;
    } catch (error) {
      // Lakukan sesuatu dengan error jika perlu

      notifyListeners();
      rethrow;
    }
  }
}
