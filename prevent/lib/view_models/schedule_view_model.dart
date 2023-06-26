import 'package:flutter/material.dart';
import 'package:prevent/services/schedule_api.dart';
import 'package:weekly_date_picker/datetime_apis.dart';

class ScheduleOrderViewModel extends ChangeNotifier {
  final ScheduleApiService apiService = ScheduleApiService();
  DateTime _selectedDay = DateTime.now();

  DateTime get selectedDay => _selectedDay;

  void changeDay(DateTime value) {
    final now = DateTime.now();
    if (value.isAfter(now) || value.isSameDateAs(now)) {
      _selectedDay = value;
      notifyListeners();
    }
  }

  Future<void> scheduleOrder(int doctorId, String schedule, int serviceFee,
      int price, String method, String paymentMethod) async {
    notifyListeners();

    try {
      final response = await apiService.postSchedule(
          doctorId, schedule, serviceFee, price, method, paymentMethod);
      notifyListeners();
      return response;
    } catch (error) {
      notifyListeners();
      rethrow;
    }
  }
}
