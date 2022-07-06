import 'package:flutter/material.dart';

class MessageBuble extends StatelessWidget {
  late String text;

  MessageBuble({required this.text});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        
        decoration: BoxDecoration(
          
          color: Colors.lightBlue,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15) ),// BorderRadius.circular(20),
          boxShadow: [
              BoxShadow(
                  color: Color.fromARGB(255, 195, 189, 189),
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
          fontSize: 15,
          color: Colors.white
        ),
        )
        ),
    );
  }
}
