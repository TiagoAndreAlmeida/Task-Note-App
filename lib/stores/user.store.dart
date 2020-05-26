import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:task_app/components/bottom_bar.dart';
import 'package:task_app/models/user.dart';
import 'package:task_app/services/services.dart';
import 'package:task_app/components/message.dart';
part 'user.store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  Services services = new Services();  

  @observable
  User user = new User(name: '', email: '', password: '', photo: '');
  @observable
  File currentImage = null;

  @action
  void setUserName(String value) => user.name = value;

  @action
  void setUserEmail(String value) => user.email = value;

  @action
  void setUserPassword(String value) => user.password = value;

  @action
  void setUserImage(String base64, File image) {
    user.photo = base64;
    currentImage = image;
  }
  
  @action
  Future submit(BuildContext context) async {
    final response = await services.userResgister(user);
    
    if(response.statusCode != 201) {
      Message.show(context, "Error", response.body);
    } else {
      Map<String, dynamic> json = jsonDecode(response.body);
      user = User.fromJson(json);
      Navigator.pushReplacement(
      context, 
      CupertinoPageRoute(
        builder: (context) => BottomBar(user: user)
      ));
    }
  }

  @action
  Future login(BuildContext context) async {
    final response = await services.userLogin(user.email, user.password);

    if(response.statusCode != 200) {
      Message.show(context, "Error", response.body);
    } else {
      Map<String, dynamic> json = jsonDecode(response.body);
      user = User.fromJson(json);
      Navigator.pushReplacement(
      context, 
      CupertinoPageRoute(
        builder: (context) => BottomBar(user: user)
      ));
    }
  }
}