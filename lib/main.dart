//import 'dart:html';


import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:untitled54/register.dart';

import 'chatscreen.dart';
import 'loginscreen.dart';

//qqqqqfff

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/login",
      routes:
      {
        '/register' : (context) => Register(),
        '/login' : (context) => const Login(),
      '/chatScreen' : (context) => const ChatScreen(),
       // '/first' : (context) => screen1(),
       // '/second' : (context) => screen2(),
      },
    );
  }
}

