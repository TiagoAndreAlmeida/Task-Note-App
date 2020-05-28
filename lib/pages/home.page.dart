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
  void didChangeDependencies () {
    super.didChangeDependencies();
    final userStore = Provider.of<UserStore>(context);
    final taskStore = Provider.of<TaskStore>(context);
    taskStore.getTasks(context, userStore.user.id);
  }

  @override
  Widget build(BuildContext context) {
    final taskStore = Provider.of<TaskStore>(context);
    return ListView.builder(
      itemCount: taskStore.list_task.length,
      itemBuilder: (BuildContext context, int index) => 
        TaskItem(task: taskStore.list_task[index])
      );
  }
}