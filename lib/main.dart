import 'package:flutter/material.dart';

import 'package:task_app/pages/login.page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Note',
      theme: ThemeData(
        fontFamily: 'GardenGrownUS-B',
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}
