import 'package:flutter/material.dart';

class MessageBuble extends StatelessWidget {
  late String text;

  MessageBuble({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      
      decoration: BoxDecoration(
        
        color: Colors.lightBlue,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
            BoxShadow(
                color: Color.fromARGB(255, 187, 181, 181),
                blurRadius: 2.0,
                spreadRadius: 1,
                offset: Offset(2, 2), // shadow direction: bottom right
            )
        ],
    
      ),
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(5),
      
      child: Text(text,
      style: TextStyle(
        fontSize: 18,
        color: Colors.white
      ),
      )
      );
  }
}
