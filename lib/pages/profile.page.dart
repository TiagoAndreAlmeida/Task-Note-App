import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:task_app/stores/user.store.dart';
import 'package:task_app/utils/utils.dart';

class ProfilePage extends StatelessWidget {

  Future getImage(source, userStore, context) async {

    File image = await ImagePicker.pickImage(source: source);
    String base64 = base64Encode(image.readAsBytesSync());
    userStore.updatePhoto(context, base64);
  }

  void choiceImageSource(context, userStore) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Escolher uma foto",
            style: TextStyle(
              fontSize: 25
            )),
          content: Text(
            "escolha como você deseja adicionar uma foto",
            style: TextStyle(
              fontSize: 20
            )),
          actions: <Widget>[
            FlatButton(
              child: Text(
                "Camera",
                style: TextStyle(
                  fontSize: 20
                )),
              onPressed: () => {
                Navigator.of(context).pop(),
                this.getImage(ImageSource.camera, userStore, context)
              }
            ),
            FlatButton(
              child: Text(
                "Galeria",
                style: TextStyle(
                  fontSize: 20
                )),
              onPressed: () => {
                Navigator.of(context).pop(),
                this.getImage(ImageSource.gallery, userStore, context)
              }
            )
          ],
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    final userStore = Provider.of<UserStore>(context);

    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Column(
      // mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        SizedBox(height: 80,),
        Stack(
          overflow: Overflow.visible,
          alignment: Alignment.center,
          children: <Widget>[
            Observer(
              builder: (context) => CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: NetworkImage("$HOST${userStore.user.photo}"),
              radius: 65,
            )),
            Positioned(
              bottom: -25,
              child: FloatingActionButton(
                child: Icon(Icons.add_a_photo),
                backgroundColor: Colors.blue,
                onPressed: () => {
                  this.choiceImageSource(context, userStore)
                },
              )
            )
          ],
        ),
        SizedBox(height: 20,),
        SizedBox(
          width: double.infinity,
          child: Text(
            userStore.user.name,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 25,
            ),
          )
        ),
        SizedBox(height: 5,),
        SizedBox(
          width: double.infinity,
          child: Text(
            userStore.user.email,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 25,
            ),
          )
        ),
        SizedBox(height: 40,),
        FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)
          ),
          padding: EdgeInsets.all(6),
          color: Colors.blue,
          child: SizedBox(
            width: double.infinity,
            child: Text(
              "Troca de senha",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
            )),
          onPressed: () => print("OK")
        ),
      ],
    ));
  }
}