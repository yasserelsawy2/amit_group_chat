import 'package:flutter/material.dart';

void showdialog(context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Title'),
        content: Text('Content'),
        actions: <Widget>[
          TextButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text('OK'),
            onPressed: () {
              // Perform some action
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
