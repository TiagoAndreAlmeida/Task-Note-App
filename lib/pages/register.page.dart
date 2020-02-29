import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
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

  User user;

  Future submit(context) async {
    user = User(email: this.email, name: this.name, password: this.password, photo: this.photo);
    final response = await http.post('$URL/user_profile/',
      body: user.toJson()
    );
    if(response.statusCode == 200) {
      print(response.body);
      Navigator.pop(context);
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
            // colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
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
              height: 120,
              alignment: Alignment(0.0, 1.5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/person.png'),
                  fit: BoxFit.contain,
                ),
                border: Border.all(
                  width: 5,
                ),
              ),
              child: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    width: 2
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(50)
                  )
                ),
                child: SizedBox.expand(
                  child: FlatButton(
                      padding: EdgeInsets.all(0),
                      child: Icon(
                        Icons.add,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      onPressed: () => {},
                    )
                  ),
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
              onPressed: () => {
                this.submit(context)
                // Navigator.push(
                //       context,
                //       CupertinoPageRoute(builder: (context) => RegisterPage()),
                //     )
              },
            )
          ],
        ),
      ),
    );
  }
}