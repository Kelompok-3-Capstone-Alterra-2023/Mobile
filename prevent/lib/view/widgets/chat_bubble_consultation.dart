import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/material.dart';

class ChatBubbleConsultation extends StatelessWidget {
  const ChatBubbleConsultation(
      {super.key, required this.text, required this.isSender});
  final String text;
  final bool isSender;
  @override
  Widget build(BuildContext context) {
    return BubbleNormal(
      // bubbleRadius: 10,
      text: text,
      tail: true,
      isSender: isSender,
      color: isSender ? const Color(0xFFACE46D) : const Color(0xFFC9EAA4),
    );
  }
}
