import 'package:flutter/material.dart';

class MessageBuble extends StatefulWidget {
  late String text;
  late String sender;
  late String currentUser;

  MessageBuble({required this.text, required this.sender, required this.currentUser});

  @override
  State<MessageBuble> createState() => _MessageBubleState();
}

class _MessageBubleState extends State<MessageBuble> {
  

  @override
  Widget build(BuildContext context) {
    return Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                 
                  crossAxisAlignment: 
                  widget.currentUser == widget.sender ?
                  
                  CrossAxisAlignment.start : CrossAxisAlignment.end,
                  children: [
                    //Text("sender: " + widget.sender + " userEmail: "+widget.currentUser),
                    Text(widget.sender),
                    Container(
                      decoration: widget.currentUser == widget.sender
                          ? const BoxDecoration(
                              color: Colors.lightBlue,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(15),
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(
                                      15)), // BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 195, 189, 189),
                                  blurRadius: 2.0,
                                  spreadRadius: 1,
                                  offset: Offset(
                                      2, 2), // shadow direction: bottom right
                                )
                              ],
                            )
                          : const BoxDecoration(
                              color: Color.fromARGB(255, 227, 102, 6),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(
                                      15)), // BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 195, 189, 189),
                                  blurRadius: 2.0,
                                  spreadRadius: 1,
                                  offset: Offset(
                                      2, 2), // shadow direction: bottom right
                                )
                              ],
                            ),
                      padding: const EdgeInsets.all(5),
                      margin: const EdgeInsets.all(5),
                      child: Text(
                        widget.text,
                        style: const TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
    
  }
}
