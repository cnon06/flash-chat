
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
                    
                        if (messageTextController.text != "") 
                        {
                          firestore.collection('messages').add({
                          'text': messageTextController.text.toString().trim(),
                          'sender': "sinan",
                          "date" : FieldValue.serverTimestamp(), //loggedInUser.email,
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