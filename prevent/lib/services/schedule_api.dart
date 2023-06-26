import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../util/common.dart';

class ScheduleApiService {
  Dio dio = Dio();
  ScheduleApiService() {
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

  Future<void> postSchedule(int doctorId, String schedule, int serviceFee,
      int price, String method, String paymentMethod) async {
    try {
      final response = await dio.post(
        '${Urls.baseUrl}${Urls.users}/doctor/$doctorId/order',
        data: {
          'schedule': schedule,
          'service_fee': serviceFee,
          'price': price,
          'method': method,
          'payment_method': paymentMethod
        },
      );

      if (response.statusCode == 200) {
        debugPrint('Schedule posted successfully');
      } else {
        throw Exception('Failed to post schedule');
      }
    } catch (e) {
      DioException;
    }
  }
}
