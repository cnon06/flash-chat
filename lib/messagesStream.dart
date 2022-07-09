
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled54/messagebuble.dart';

class MessagesStream extends StatefulWidget {
  const MessagesStream({Key? key}) : super(key: key);

  @override
  State<MessagesStream> createState() => _MessagesStreamState();
}

class _MessagesStreamState extends State<MessagesStream> {
  final firestore = FirebaseFirestore.instance;

  final _auth = FirebaseAuth.instance;

  String? userEmail;

  Future<String?> currentUser() async {
  // ignore: await_only_futures
  User? user = await _auth.currentUser;
    
    return user?.email.toString();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
        future: currentUser(),
        builder: (context, snapshot) {
          var currenUser2 = snapshot.data;
          //  print("Current User2: "+currenUser2.toString());

          if (snapshot.hasData) {
            return StreamBuilder<QuerySnapshot>(
                stream: firestore
                    .collection("messages")
                    .orderBy("date", descending: true)
                    .startAfter([""]).snapshots(),
                builder: (context, snapshot) {
                  List<Row> messageWidgets = [];

                  if (snapshot.hasData) {
                    final messages = snapshot.data?.docs;

                    for (var msg in messages!) {
                      final messageText = msg.get("text");
                      final messageSender = msg.get("sender");

                      final messageWidget = MessageBuble(
                        text: messageText,
                        sender: messageSender,
                        currentUser: currenUser2.toString(),
                      );
                      messageWidgets.add(Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [messageWidget],
                      ));
                    }
                  }
                  return ListView(
                    reverse: true,
                    padding: const EdgeInsets.all(10),
                    children: messageWidgets,
                  );
                });
          } else {
              return const Text("There is an error");
          }
          
        });
  }
}
