import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class SendText extends StatefulWidget {
  @override
  State<SendText> createState() => _SendTextState();
}

class _SendTextState extends State<SendText> {
  final messageTextController = TextEditingController();

  late String messageText;

  final firestore = FirebaseFirestore.instance;

  final _auth = FirebaseAuth.instance;

  late String? userEmail;

 
  void currentUser() async {
    User? user = await _auth.currentUser;
   
   // print("user: " + user.toString());
   userEmail = user?.email.toString();
   // print("user: " + userEmail!);
    
  }

  @override
  void initState() {
    super.initState();
    currentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kMessageContainerDecoration,
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 50,
              //width: 50,
              child: TextField(
                controller: messageTextController,

                /*
                       onChanged: (value) {
                          messageText = value;
                        },
                       */

                decoration: kMessageTextFieldDecoration,
              ),
            ),
          ),
          TextButton(
              onPressed: () {
                currentUser();
                //   print("User: " + user);

                if (messageTextController.text != "") {
                  firestore.collection('messages').add({
                    'text': messageTextController.text.toString().trim(),
                    'sender': userEmail,
                    "date": FieldValue.serverTimestamp(), //loggedInUser.email,
                  });
                }
                messageTextController.clear();
              },
              child: Text("Send")),
          // Text("data")
        ],
      ),
    );
  }
}
