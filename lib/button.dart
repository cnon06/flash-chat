import 'package:flutter/material.dart';

class Button extends StatelessWidget {

  final String label;
  final Function action;

  // ignore: use_key_in_widget_constructors
  const Button({Key? key, required this.label,  required this.action});



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () => action(context),
        // =>  Navigator.pushNamed(context, navigate),
        child: Container(
          
          // width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(30),
          ),

          child:  Center(
            child: Text(
              label, //"Login",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),

        ),
      ),
    );
  }
}
