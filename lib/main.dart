import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/auth/check_page.dart';
import 'package:flutter_application_1/data/workout_data.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'pages/login_page.dart';

 void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
     );
    runApp(const MyApp());
 }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WorkoutData(),
      child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CheckPage(),
      ),
    );
  }
}