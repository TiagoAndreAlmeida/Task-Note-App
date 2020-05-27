import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/components/task_item.dart';

import 'package:task_app/models/task.dart';
import 'package:task_app/stores/task.store.dart';
import 'package:task_app/stores/user.store.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Task> tasks = new List<Task>();
  
  @override
  void initState () {
    super.initState();
    final userStore = Provider.of<UserStore>(context);
    final taskStore = Provider.of<TaskStore>(context);
    taskStore.getTasks(context, userStore.user.id);
  }


  // _HomePageState(){
  //   tasks.add(Task(title: 'title 1', description: 'descrip', done: true, dateTime: DateTime.now()));
  //   tasks.add(Task(title: 'title 2', description: 'descripdescripdescripdescripdescripdescripdescripdescripdescripdescripdescripdescripdescripdescripdescripdescripdescripdescrip', done: false, dateTime: DateTime.now()));
  //   tasks.add(Task(title: 'title 3', description: 'descrip', done: true, dateTime: DateTime.now()));
  //   tasks.add(Task(title: 'title 4', description: 'descrip', done: false, dateTime: DateTime.now()));
  // }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.tasks.length,
      itemBuilder: (BuildContext context, int index) =>  TaskItem(task: this.tasks[index])
      );
  }
}