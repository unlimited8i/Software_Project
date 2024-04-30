import 'package:flutter/material.dart';

class ConversationPage extends StatelessWidget {
  final String receiverEmail;
  const ConversationPage({super.key,
   required this.receiverEmail
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(receiverEmail)),
    );
  }
}