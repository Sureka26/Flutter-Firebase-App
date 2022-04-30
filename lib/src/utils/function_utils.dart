import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

showAuthErrorDialog(context) {
  return showCupertinoDialog(
    context: context,
    builder: (context) {
      return CupertinoAlertDialog(
        title: const Text(
          'Invalid credentials',
          style: TextStyle(
            fontFamily: 'Lato',
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
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
