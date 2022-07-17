import 'package:flutter/material.dart';
import 'package:untitled54/sendtext.dart';

import 'messagesStream.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);



 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat Screen"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
         
          Expanded(flex: 10, child: MessagesStream()),
         Expanded(
           flex: 1,
            child: SendText(),
          ),
        ],
      ),
    );
  }

/*
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
*/
  
}


