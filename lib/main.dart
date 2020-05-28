import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:task_app/pages/login.page.dart';
import 'package:task_app/stores/task.store.dart';
import 'package:task_app/stores/user.store.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<UserStore>(create: (_) => UserStore(),),
        Provider<TaskStore>(create: (_) => TaskStore(),)
      ],
      child: MaterialApp(
        title: 'Task Note',
        theme: ThemeData(
          fontFamily: 'GardenGrownUS-B',
          primarySwatch: Colors.blue,
        ),
        home: LoginPage(),
      )
    );
  }
}
