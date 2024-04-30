import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatService{

  // get instance of firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // get user stream
  /*
  explain \/\/\/
  <List<Map<String,dynamic>> =

  [
  {
    'email': ahmad@gmail.com
    id:...
  }
  {
    'email': abdullah@gmail.com
    id:...
  }
  ]

  stream gonna lisen to our firebase
  */
  Stream<List<Map<String,dynamic>>>getUserStream() {
    return _firestore.collection('Users').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        // go through each individual user
        final user = doc.data();

        return user;
      }).toList();
    });
  } 

  // send message

  // get message
}