import 'package:firebase_auth/firebase_auth.dart';

class AuthFirebase {
  static final _auth = FirebaseAuth.instance;

  static Future<User?> loginUser({email, password}) async {
    try {
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return user.user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  static Future<User?> createUser({email, password}) async {
    try {
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return user.user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  static Future logoutUser() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
