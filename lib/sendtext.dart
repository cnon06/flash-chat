
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class SendText extends StatelessWidget {
  


  final messageTextController = TextEditingController();
  late String messageText;
  final firestore = FirebaseFirestore.instance;


  @override
  Widget build(BuildContext context) {
    return  Container(
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
            );
  }
}