
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
    print("INICIO");
    final response = await services.getTasks(id);

    if(response.statusCode != 200) {
      Message.show(context, "Error", response.body);
    } else {
      print("DEU CERTO");
      var json = jsonDecode(response.body);
      print("1");
      ObservableList<Task> new_list = new ObservableList<Task>();
      print("2");
      json.forEach((value) => {
        print(value),
        new_list.add(Task.fromJson(value))
      });
      print("3");
      list_task = new_list;
    }
  }

}