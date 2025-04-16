import 'dart:io';

import 'package:flutter/material.dart';

class Helpers {
  static Future<bool?> onWillPop(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        title: Text('Quit App ?',
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 18,
              decoration: TextDecoration.underline,
              decorationColor: Colors.red,
              decorationStyle: TextDecorationStyle.solid,
            )),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(
              'No',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                decorationColor: Colors.blue,
                decorationStyle: TextDecorationStyle.solid,
              ),
            ),
          ),
          TextButton(
            onPressed: () => exit(0),
            child: Text(
              'Yes',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                decorationColor: Colors.red,
                decorationStyle: TextDecorationStyle.solid,
              ),
            ),
          ),
        ],
      ),
    );
  }

  static void backToHomeScreen(BuildContext context) {
    Navigator.popUntil(context, ModalRoute.withName('/home'));
  }
}
