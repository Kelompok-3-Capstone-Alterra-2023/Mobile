import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import '../models/consultation_history_model.dart';

class ConsultationViewModel extends ChangeNotifier {
  List<ConsultationHistory> history = [];
  List<ConsultationRunning> running = [];

  List<ConsultationHistory> filteredConsultations = [];
  List<ConsultationRunning> filteredPayments = [];

  String searchText = '';

  Future<void> getConsulHistory() async {
    try {
      final jsonString =
          await rootBundle.loadString('assets/json/consultation_history.json');
      final jsonList = json.decode(jsonString)['consultation_history'];
      history = jsonList
          .map<ConsultationHistory>(
              (json) => ConsultationHistory.fromJson(json))
          .toList();
    } catch (error) {
      debugPrint('Failed to load consultations: $error');
    }
    // Set data awal yang tidak difilter
    filteredConsultations = history;
    filteredPayments = running;

    notifyListeners();
  }

  Future<void> getConsulRunning() async {
    try {
      final jsonString =
          await rootBundle.loadString('assets/json/consultation_history.json');
      final jsonList = json.decode(jsonString)['consultation_running'];
      running = jsonList
          .map<ConsultationRunning>(
              (json) => ConsultationRunning.fromJson(json))
          .toList();
    } catch (error) {
      debugPrint('Failed to load payments: $error');
    }

    notifyListeners();
  }

  void setSearchText(String text) {
    searchText = text;
    filterData();
  }

  void filterData() {
    filteredConsultations = history.where((consultation) {
      final doctor = consultation.doctorName.toLowerCase();
      final date = consultation.dateTime.toLowerCase();
      final searchLower = searchText.toLowerCase();

      return doctor.contains(searchLower) || date.contains(searchLower);
    }).toList();

    filteredPayments = running.where((payment) {
      final doctor = payment.doctorName.toLowerCase();
      final date = payment.dateTime.toLowerCase();
      final dateTime = payment.dateTime.toLowerCase();
      final searchLower = searchText.toLowerCase();

      return doctor.contains(searchLower) ||
          date.contains(searchLower) ||
          dateTime.contains(searchLower);
    }).toList();

    notifyListeners();
  }
}
