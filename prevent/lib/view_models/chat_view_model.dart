import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class ChatViewModel extends ChangeNotifier {
  ChatViewModel() {
    initializeWebSocket();
  }
  TextEditingController controller = TextEditingController();
  late WebSocketChannel _channel;
  final List<dynamic> _messages = [];
  List<dynamic> get messages => _messages;
  late SharedPreferences pref;
  late String? token;

  Future initializeWebSocket() async {
    pref = await SharedPreferences.getInstance();
    token = pref.getString('token');

    _channel = IOWebSocketChannel.connect(
      'wss://capstone-project.duckdns.org:8080/chat',
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    _channel.stream.listen((message) {
      final pesan = jsonDecode(message);
      _messages.add(pesan);
      notifyListeners();
    });
  }

  void sendMessage() {
    if (controller.text.isNotEmpty) {
      final message = controller.text;
      _channel.sink.add('{"to": 47, "message": "$message"}');
      _messages.add({"to": 47, "message": message});
      _messages.reversed;
      controller.clear();
      notifyListeners();
    }
  }
}
