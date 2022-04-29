import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  var email = FirebaseAuth.instance.currentUser!.email;

  void logOutUser() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff001d3d),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome ' + email!,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
            MaterialButton(
              onPressed: () {
                logOutUser();
              },
              child: Text('Log Out'),
              color: Colors.blue.shade200,
            )
          ],
        ),
      ),
    );
  }
}
