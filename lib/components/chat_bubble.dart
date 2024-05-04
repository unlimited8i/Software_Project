import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isCurrentUser;

  const ChatBubble({
    super.key,
    required this.message,
    required this.isCurrentUser,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isCurrentUser ? Colors.blue : Colors.grey,
        borderRadius: BorderRadius.circular(12)
       ),
       padding: const EdgeInsets.all(16),
       margin: EdgeInsets.symmetric(vertical: 5 ,horizontal: 20),
      child: Text(
        message,
        style: TextStyle(color: Colors.white),),
    );
  }
}
