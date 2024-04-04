import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';


 Future<void> main() async {
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: SimpleprProject(),
    );
  }
}

class SimpleprProject extends StatelessWidget {
  const SimpleprProject({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 8,
          title: Text('E-Workout'),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.menu,
                size: 33,
              )),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.add,
                  size: 33,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.message,
                  size: 33,
                ))
          ],
        ),
        body: Center(
            child: Text(
          '09:55 flutter  Text  widget12:44 Text  widget (maxLines)14:20 Text  widget (TextOverflow)16:00 Text  widget (textAlign)',
          maxLines: 3,
          overflow: TextOverflow.fade,
          style: TextStyle(fontSize: 25),
        )));
  }
}
