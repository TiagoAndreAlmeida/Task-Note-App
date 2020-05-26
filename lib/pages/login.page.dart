import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:task_app/pages/recover.page.dart';
import 'package:task_app/stores/user.store.dart';
import 'register.page.dart';

class LoginPage extends StatelessWidget {

  // String _email;
  // String _password;
  // User _user;

  // Future login () async {
  //   final response = await http.post('$URL/auth_login/',
  //   body: {
  //     "username": this._email,
  //     "password": this._password
  //   });

  //   if(response.statusCode == 200) {
  //     Map<String, dynamic> json = jsonDecode(response.body);
  //     this._user = User.fromJson(json);
  //     print(response.body);
  //     print(json);
  //     print(this._user.email);
  //     Navigator.pushReplacement(
  //     context, 
  //     CupertinoPageRoute(
  //       builder: (context) => BottomBar(user: this._user,)
  //     ));
  //   } else {
  //     Map<String, dynamic> error = jsonDecode(response.body);
  //     Message.show(context, 'Ops', error["message"]);
  //   }
  // }
  
  @override
  Widget build(BuildContext context) {
    final userStore = Provider.of<UserStore>(context);
    
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/background.jpg'),
          fit: BoxFit.fill
        ),
      ),
      child: Scaffold(
        backgroundColor: Color.fromRGBO(255, 255, 255, 0.67),
        resizeToAvoidBottomInset: true, //using this to not resize screen when keyboard appears
        body: Container(
          padding: EdgeInsets.only(top: 30, left: 60, right: 20),
          child: ListView(
            children: <Widget>[
              Text(
                "Task Note",
                textAlign: TextAlign.center,
                style: TextStyle
                (
                  fontSize: 60,
                  fontStyle: FontStyle.italic
                ),
              ),
              SizedBox(
                height: 50
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
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  labelStyle: TextStyle(
                    color: Colors.blue,
                    fontSize: 20
                  ),
                ),
                onChanged: userStore.setUserPassword
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                alignment: Alignment.centerRight,
                child: FlatButton(
                  child: Text(
                    "Esqueceu sua senha ?",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                      fontStyle: FontStyle.italic
                    ),
                  ),
                  onPressed: () => {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => RecorverPage()
                      )
                    )
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.all(
                    Radius.circular(7)
                  )
                ),
                child: SizedBox.expand(
                  child: FlatButton(
                    child: Text(
                      "Entrar",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white
                      ),
                    ),
                    onPressed: () => userStore.login(context)
                  )
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                alignment: Alignment.center,
                child: FlatButton(
                  // splashColor: Colors.transparent, comment this until find way to highlight color text instead flatbutton.
                  child: Text(
                    "Criar Conta",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  onPressed: () => {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => RegisterPage()
                      ),
                    )
                  },
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}