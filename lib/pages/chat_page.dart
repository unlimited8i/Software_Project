import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/user_tile.dart';
import 'package:flutter_application_1/pages/conversation_page.dart';
import 'package:flutter_application_1/services/auth/auth_page.dart';
import 'package:flutter_application_1/services/chat/chat_service.dart';


class UserChat extends StatelessWidget {

  // chat & auth services
  final ChatService _chatService = ChatService();
  final AuthPage _authPage = AuthPage();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: _buliduserList(),
        );

  }

  // bulid a list of users exept for the current logged in user
  Widget _buliduserList() {
    return StreamBuilder(
      stream: _chatService.getUserStream()
    , builder: (context, snapshot) {
      if (snapshot.hasError) {
        return const Text("Erorr");
      }

      if (snapshot.connectionState == ConnectionState.waiting){
        return const Text("loding..");
      }

      return ListView(
        children: snapshot.data!.map<Widget>((userData) => _buliduserListItem(userData,context)).toList(),

      );
    },);
  }

  // build individual list tile for user
  Widget _buliduserListItem(Map<String,dynamic> userData, BuildContext context){
    //display all users exept current user
    return UserTile(
      text: userData['email'],
      onTap:() {
        //tapped on user -> go to chat page
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => ConversationPage(
            receiverEmail: userData["email"],
          ),
          )
        );
      }
    );
  }
}