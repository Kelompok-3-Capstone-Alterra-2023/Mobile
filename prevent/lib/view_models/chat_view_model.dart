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
  List<dynamic> _messages = [];
  List<dynamic> get messages => _messages;
  late SharedPreferences pref;
  late String? token;

  set messages(List value) {
    if (_messages != value) {
      _messages = value;
      notifyListeners();
    }
  }

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

  void sendMessage({required int idDoctor}) {
    if (controller.text.isNotEmpty) {
      final message = controller.text;
      _channel.sink.add('{"to": $idDoctor, "message": "$message"}');
      _messages.add({"to": idDoctor, "message": message});
      _messages.reversed;
      controller.clear();
      notifyListeners();
    }
  }
}
