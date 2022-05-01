import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_app/src/authentication/screens/auth_page.dart';
import 'package:flutter_auth_app/home_page.dart';
import 'package:flutter_auth_app/src/authentication/screens/login.dart';
import 'package:flutter_auth_app/src/userdata/screens/user_data_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return UserDataScreen();
          } else {
            return AuthPage();
          }
        },
      ),
    );
  }
}
