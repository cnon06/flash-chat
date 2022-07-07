import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'button.dart';
import 'constants.dart';

class Login extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  //late String email;
  late String password;
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  void action(BuildContext context) async {
    print("${emailTextController.text.toString()}");
    print("${passwordTextController.text.toString().trim()}");

    //_auth.createUserWithEmailAndPassword(email: "sinan@gmail.com", password: "123456");


try {
      final user = await _auth.signInWithEmailAndPassword(
          //  email: "hubew4@gmail.com", password: "123456");
          email: emailTextController.text.toString().trim(),
          password: passwordTextController.text.toString().trim());
      if (user != null) {
        //Navigator.pushNamed(context, ChatScreen.id);
        Navigator.pushNamed(context, '/chatScreen');
        emailTextController.clear();
        passwordTextController.clear();
      }
    } catch (e) {
      print(e);
    }


    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: emailTextController,
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (value) {
                //  email = value;
              },
              decoration:
                  kTextFieldDecoration.copyWith(hintText: 'Enter your email'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: passwordTextController,
              obscureText: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                //  password = value;
              },
              decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter your password'),
            ),
          ),
          Button(
            label: "Login",
            action: action,
            // navigate: '/chatScreen',
          ),

          /*
           Button(
            label: "Register",
            navigate: '/register',
          ),
          */
        ],
      ),
    );
  }
}
