import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled54/messagebuble.dart';

class MessagesStream extends StatefulWidget {
  MessagesStream({Key? key}) : super(key: key);

  @override
  State<MessagesStream> createState() => _MessagesStreamState();
}

class _MessagesStreamState extends State<MessagesStream> {
  final firestore = FirebaseFirestore.instance;
  

  @override
 

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(

        //db.collection('things').orderBy('createdAt').startAfter(today)
        stream: firestore
            .collection("messages")
            .orderBy("date", descending: true)
            .startAfter([
          ""
        ]).snapshots(), //firestore.collection("messages").snapshots(),
        builder: (context, snapshot) {
          List<Row> messageWidgets = [];

          if (snapshot.hasData) {
            final messages = snapshot.data?.docs;

            for (var msg in messages!) {
              final messageText = msg.get("text");
              final messageSender = msg.get("sender");
              //final messageWidget = Text("$messageText from $messageSender");
              final messageWidget =
                  MessageBuble(text:messageText, sender: messageSender);
              messageWidgets.add(Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [messageWidget],
              ));
            }
          }
          return ListView(
            reverse: true,
            padding: EdgeInsets.all(10),
            children: messageWidgets,
          );
        });
  }
}
