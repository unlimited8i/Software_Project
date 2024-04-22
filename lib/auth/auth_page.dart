import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:flutter_application_1/pages/register_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key,}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  //intially show the login page
  bool showLoginPage = true;


  void toggleScreens() {
    setState(() {
      showLoginPage = !showLoginPage; //becuase it is toggle it will be reverse (not)
      
    });

  }

  @override
  Widget build(BuildContext context) {
    if(showLoginPage){
      return LoginPage(showRegisterPage: toggleScreens);
    } else {
      return RegisterPage(showLoginPage:toggleScreens);

    }
  }
}