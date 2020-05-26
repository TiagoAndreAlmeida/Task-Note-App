import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:task_app/stores/user.store.dart';

class RegisterPage extends StatelessWidget {

  Future getImage(source, userStore) async {

    File image = await ImagePicker.pickImage(source: source);
    String base64 = base64Encode(image.readAsBytesSync());
    userStore.setUserImage(base64, image);
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
                  this.getImage(ImageSource.camera, userStore)
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
                  this.getImage(ImageSource.gallery, userStore)
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

    return Scaffold(
      resizeToAvoidBottomInset: true, //using this to not resize screen when keyboard appears
      appBar: AppBar(
        title: Text('Registro'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20, left: 60, right: 20),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpg'),
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.4), 
              BlendMode.dstATop
            ),
            fit: BoxFit.fill
          ),
        ),
        child: ListView(
          children: <Widget>[
            Container(
              // width: 20,
              height: 140,
              alignment: Alignment(0.0, 1.5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: userStore.currentImage != null ? null : Border.all(
                  color: Colors.black,
                  width: 5
                )
              ),
              child: Stack(
                overflow: Overflow.visible,
                alignment: Alignment.center,
                children: <Widget>[
                  Observer(
                    builder: (context) => CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage: userStore.currentImage != null ? FileImage(File(userStore.currentImage.path)) : AssetImage('assets/person.png'),
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
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Nome',
                labelStyle: TextStyle(
                  color: Colors.blue,
                  fontSize: 20
                ),
              ),
              onChanged: userStore.setUserName
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'E-mail',
                labelStyle: TextStyle(
                  color: Colors.blue,
                  fontSize: 20
                ),
              ),
              onChanged: userStore.setUserEmail
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'senha',
                labelStyle: TextStyle(
                  color: Colors.blue,
                  fontSize: 20
                ),
              ),
              onChanged: userStore.setUserPassword
            ),
            SizedBox(
              height: 30,
            ),
            FlatButton(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                'Cadastrar',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white
                ),
              ),
              color: Colors.blue,
              onPressed: () => userStore.submit(context),
            )
          ],
        ),
      ),
    );
  }
}