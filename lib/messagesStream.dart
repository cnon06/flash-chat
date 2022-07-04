import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled54/messagebuble.dart';

class MessagesStream extends StatelessWidget {
  MessagesStream({Key? key}) : super(key: key);

  final firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: firestore.collection("messages").snapshots(),
        builder: (context, snapshot) {
          List<Row> messageWidgets = [];

          if (snapshot.hasData) {
            final messages = snapshot.data?.docs;

            for (var msg in messages!) {
              final messageText = msg.get("text");
              final messageSender = msg.get("sender");
              //final messageWidget = Text("$messageText from $messageSender");
              final messageWidget =
                  MessageBuble(text: "$messageText from $messageSender");
              messageWidgets.add(Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [messageWidget ],
              ));
            }
          }
          return ListView(
            padding: EdgeInsets.all(10),
            children: messageWidgets,
          );
        });
  }
}
