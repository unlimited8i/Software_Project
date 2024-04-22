import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserAccount extends StatefulWidget {
  const UserAccount({super.key});

  @override
  State<UserAccount> createState() => _UserAccountState();
}

class _UserAccountState extends State<UserAccount> {

  
  final user = FirebaseAuth.instance.currentUser!;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Signed in as: ' + user.email!),
          MaterialButton(onPressed: (){
            FirebaseAuth.instance.signOut();
          },
          color: Colors.blue,
          child: Text('sign out'),
          )
        ],
      )),
    );
  }
}