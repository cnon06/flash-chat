//import 'dart:html';

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:untitled54/messagesStream.dart';

import 'constants.dart';

//qqqqqfff

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final firestore = FirebaseFirestore.instance;
  final messageTextController = TextEditingController();
  late String messageText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("widget.title"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(flex: 10, child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: MessagesStream(),
          )),
          //Text("data"),

          Expanded(
            flex: 1,
            child: Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      //width: 50,
                      child: TextField(
                        controller: messageTextController,
                        onChanged: (value) {
                          messageText = value;
                        },
                        decoration: kMessageTextFieldDecoration,
                      ),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        messageTextController.clear();
                       
                        if (messageText != "") 
                        {
                          firestore.collection('messages').add({
                          'text': messageText,
                          'sender': "sinan", //loggedInUser.email,
                        });
                        }
                         messageText = "";
            
                       
                      },
                      child: Text("Send")),
                  // Text("data")
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
