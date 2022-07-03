import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MessagesStream extends StatelessWidget {
  MessagesStream({Key? key}) : super(key: key);

  final firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: StreamBuilder<QuerySnapshot>(
          stream: firestore.collection("messages").snapshots(),
          builder: (context, snapshot) {
            List<Text> messageWidgets = [];
            if (snapshot.hasData) {
              final messages = snapshot.data?.docs;

              for (var msg in messages!) {
                final messageText = msg.get("text");
                final messageSender = msg.get("sender");
                final messageWidget = Text("$messageText from $messageSender");
                messageWidgets.add(messageWidget);
              }

              print("dsddd: $messages");
            }

            //return Text("fgfg");

            return Column(
             
              children: messageWidgets,
            );
          }),
    );
  }
}
