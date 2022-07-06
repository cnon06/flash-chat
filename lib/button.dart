import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  String label;
  Function action;

  Button({required this.label,  required this.action});



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () => action(context),
        // =>  Navigator.pushNamed(context, navigate),
        child: Container(
          child: Center(
            child: Text(
              label, //"Login",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          // width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
