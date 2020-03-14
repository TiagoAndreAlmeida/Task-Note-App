import 'package:flutter/material.dart';

class Message {
  static void show(context, title, message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Ops!!",
              style: TextStyle(
                fontSize: 25
              )),
            content: Text(
              message,
              style: TextStyle(
                fontSize: 20
              )),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  "Entendi",
                  style: TextStyle(
                    fontSize: 20
                  )),
                onPressed: () => Navigator.of(context).pop()
              )
            ],
          );
        }
      );
  }
}