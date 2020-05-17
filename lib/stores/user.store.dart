import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:task_app/models/user.dart';
import 'package:task_app/services/services.dart';
import 'package:task_app/components/message.dart';
part 'user.store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  Services services = new Services();  

  @observable
  User user = new User(name: '', email: '', password: '', photo: '');

  @action
  void setUserName(String value) => user.name = value;

  @action
  void setUserEmail(String value) => user.email = value;

  @action
  void setUserPassword(String value) => user.password = value;

  @action
  Future submit(BuildContext context) async {
    final response = await services.userResgister(user);
    
    if(response.statusCode != 201) {
      print("deu ruim");
      Message.show(context, "Error", response.body);
    } else {
      print("deu certo");
      print(response.body);
    }
  }
}