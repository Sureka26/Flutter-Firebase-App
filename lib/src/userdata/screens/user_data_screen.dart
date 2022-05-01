import 'package:flutter/material.dart';
import 'package:flutter_auth_app/src/userdata/network/user_data_firestore.dart';
import 'package:flutter_auth_app/src/userdata/screens/add_data_screen.dart';

class UserDataScreen extends StatefulWidget {
  const UserDataScreen({Key? key}) : super(key: key);

  @override
  State<UserDataScreen> createState() => _UserDataScreenState();
}

class _UserDataScreenState extends State<UserDataScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff001d3d),
      body: Center(
        child: MaterialButton(
          onPressed: () => _showBottonForm(),
          child: const Text('Add Data'),
          color: Colors.blue.shade200,
          elevation: 5.0,
        ),
      ),
    );
  }

  _showBottonForm() {
    return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
      ),
      context: context,
      builder: (context) {
        return AddDataScreen();
      },
    );
  }
}
