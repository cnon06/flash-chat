import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'button.dart';
import 'constants.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _auth = FirebaseAuth.instance;

  //late String email;
  late String password;

  final emailTextController = TextEditingController();

  final passwordTextController = TextEditingController();

  String errorMessages = "";

  void action(BuildContext context) async {
    try {
      final user = await _auth.signInWithEmailAndPassword(
          //  email: "hubew4@gmail.com", password: "123456");
          email: emailTextController.text.toString().trim(),
          password: passwordTextController.text.toString().trim());
      // ignore: unnecessary_null_comparison
      if (user != null) {
        emailTextController.clear();
        passwordTextController.clear();
        // ignore: use_build_context_synchronously
        Navigator.pushNamed(context, '/chatScreen');
      }
    } catch (e) {
      setState(() {
        errorMessages= e.toString();
      });
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
            padding: const EdgeInsets.all(10),
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
            padding: const EdgeInsets.all(10),
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
          Padding(
            padding: const EdgeInsets.all(10),
            child: Center(child: Text(
              errorMessages == "" ? errorMessages : errorMessages.substring(errorMessages.indexOf(']')+1),
              textAlign: TextAlign.center,
              style: const TextStyle(
                
                color:  Colors.red,
              ),
              )
              ),
          ),
          Button(
            label: "Login",
            action: action,
            // navigate: '/chatScreen',
          ),
          
        ],
      ),
    );
  }
}
