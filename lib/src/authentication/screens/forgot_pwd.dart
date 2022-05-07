//import 'dart:js';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_app/src/authentication/screens/login.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      showCupertinoDialog(
        context: this.context,
        builder: (context) {
          return CupertinoAlertDialog(
            content: Text('Password reset link sent! Check your email'),
            actions: [
              CupertinoDialogAction(
                child: const Text(
                  'OK',
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Login(
                        toggle: () {},
                      ),
                    ),
                  );
                },
              )
            ],
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      showCupertinoDialog(
        context: this.context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(
              e.message.toString(),
              style: TextStyle(
                fontFamily: 'Lato',
                fontSize: 15.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            actions: [
              CupertinoDialogAction(
                child: const Text(
                  'OK',
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff001d3d),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              'Enter your Email and we will send you a reset link',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter an email';
                } else if (!(value.contains('@') && value.contains('.com'))) {
                  return 'Please enter a valid email';
                } else {
                  print('email validated - is Not empty');
                }
                return null;
              },
              controller: _emailController,
              textAlign: TextAlign.center,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(8.0),
                hintText: 'Enter email',
                hintStyle: const TextStyle(fontSize: 14.0),
                fillColor: Colors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(
                    color: Colors.redAccent.shade100,
                    width: 2.0,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          MaterialButton(
            onPressed: passwordReset,
            child: Text(
              'Reset Password',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            color: Color(0xff001d3d),
          )
        ],
      ),
    );
  }
}
