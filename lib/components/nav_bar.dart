// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/account_page.dart';
import 'package:flutter_application_1/pages/chat_page.dart';
import 'package:flutter_application_1/pages/history_page.dart';
import 'package:flutter_application_1/pages/home_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    UserHome(),
    UserChat(),
    UserHistory(),
    UserAccount()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 163, 163, 163),
        title: Center(
          child: Text("E-workout",style: TextStyle(color: Colors.white)) ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromARGB(255, 54, 157, 241),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home ,color: Colors.white,), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.message,color: Colors.white), label: 'message'),
          BottomNavigationBarItem(icon: Icon(Icons.history,color: Colors.white), label: 'history'),
          BottomNavigationBarItem(icon: Icon(Icons.person,color: Colors.white), label: 'Account'),
          
        ],
      ),
    );
  }
}