import 'package:flutter/material.dart';
import 'package:task_app/models/task.dart';

class TaskItem extends StatelessWidget {
  final Task task;

  TaskItem({Key key, @required this.task}) : super(key: key) {}

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                this.task.title,
                style: TextStyle(
                  fontSize: 22
                ),
              ),
              Text(
                this.task.description,
                style: TextStyle(
                  fontSize: 15
                ),
              ),
              Text(this.task.dateTime.toString())
            ],
          )),
          IconButton(
            icon: this.task.done == true ? Icon(Icons.check_box, color: Colors.green,) : Icon(Icons.check_box_outline_blank),
          )
        ],
      ),
    );
  }
}