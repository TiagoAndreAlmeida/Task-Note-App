import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:task_app/components/bottom_bar.dart';

import 'package:task_app/utils/utils.dart';
import 'package:task_app/models/user.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  
  String email = '';
  String name = '';
  String password = '';
  String photo = '';
  File currentImage;
  User user;

  Future submit(context) async {
    user = User(email: this.email, name: this.name, password: this.password, photo: this.photo);
    final response = await http.post('$URL/user_profile/',
      body: user.toJson()
    );
    if(response.statusCode == 200) {
      print(response.body);
      Navigator.pushReplacement(
      context, 
      CupertinoPageRoute(
        builder: (context) => BottomBar(user: this.user)
      ));
    } else {
      Map<String, dynamic> error = jsonDecode(response.body);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Ops!!",
              style: TextStyle(
                fontSize: 25
              )),
            content: Text(
              error["message"],
              style: TextStyle(
                fontSize: 20
              )),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  "Entendi",
                  style: TextStyle(
                    fontSize: 20
                  )),
                onPressed: () => Navigator.of(context).pop()
              )
            ],
          );
        }
      );
    }
  }

  Future getImage(source) async {
    File image = await ImagePicker.pickImage(source: source);
    String base64 = base64Encode(image.readAsBytesSync());
    
    setState(() {
      photo = base64;
      currentImage = image;
    });
  }

  void choiceImageSource(context) {
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
                  this.getImage(ImageSource.camera)
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
                  this.getImage(ImageSource.gallery)
                }
              )
            ],
          );
        }
      );
  }

  @override
  Widget build(BuildContext context) {
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
                border: this.currentImage != null ? null : Border.all(
                  color: Colors.black,
                  width: 5
                )
              ),
              child: Stack(
                overflow: Overflow.visible,
                alignment: Alignment.center,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(65),
                    child: Image(
                      image: this.currentImage != null ? FileImage(File(this.currentImage.path)) : AssetImage('assets/person.png'),
                  )),
                  Positioned(
                    bottom: -25,
                    child: FloatingActionButton(
                      child: Icon(Icons.add_a_photo),
                      backgroundColor: Colors.blue,
                      onPressed: () => {
                        this.choiceImageSource(context)
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
              onChanged: (value) => {
                setState(() => {
                  this.name = value
                })
              },
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
              onChanged: (value) => {
                setState(() => {
                  this.email = value
                })
              },
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
              onChanged: (value) => {
                setState(() => {
                  this.password = value
                })
              },
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
              onPressed: () => this.submit(context),
            )
          ],
        ),
      ),
    );
  }
}