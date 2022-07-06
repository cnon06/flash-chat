//import 'dart:html';

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:untitled54/messagesStream.dart';
import 'package:untitled54/register.dart';
import 'package:untitled54/sendtext.dart';

import 'chatscreen.dart';
import 'constants.dart';
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
        '/login' : (context) => Login(),
      '/chatScreen' : (context) => ChatScreen(),
       // '/first' : (context) => screen1(),
       // '/second' : (context) => screen2(),
      },
    );
  }
}

