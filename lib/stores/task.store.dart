
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:task_app/components/message.dart';
import 'package:task_app/models/task.dart';
import 'package:task_app/services/services.dart';
part 'task.store.g.dart';

class TaskStore = _TaskStore with _$TaskStore;

abstract class _TaskStore with Store {
  Services services = new Services();

  @observable
  ObservableList<Task> list_task = new ObservableList<Task>();

  @action
  Future getTasks (BuildContext context, int id) async {
    final response = await services.getTasks(id);

    if(response.statusCode != 200) {
      Message.show(context, "Error", response.body);
    } else {
      Map<String, dynamic> json = jsonDecode(response.body);
      ObservableList<Task> new_list;
      
      json.forEach((key, value) { 
        new_list.add(Task.fromJson(value));
      });

      list_task = new_list;
    }
  }

}