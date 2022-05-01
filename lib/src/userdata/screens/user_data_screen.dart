import 'package:flutter/material.dart';
import 'package:flutter_auth_app/src/userdata/network/user_data_firestore.dart';

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
      body: Container(
          child: StreamBuilder(
        stream: UserDataFirestore.getUserDataStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final userData = snapshot.data;
            print(userData);
            return const Text(
              'User Data available',
              style: TextStyle(
                color: Colors.white,
              ),
            );
          } else {
            return const Text(
              'No Data available',
              style: TextStyle(
                color: Colors.white,
              ),
            );
          }
          return Container();
        },
      )),
    );
  }
}
