import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                style: TextStyle(
                  fontSize: 40,
                  fontStyle: FontStyle.italic
                ),
              ),
              SizedBox(
                height: 80
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
                  ),
                  onPressed: () => {},
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blueAccent
                ),
                child: SizedBox.expand(
                  child: FlatButton(
                    child: Text(
                      "Entrar",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white
                      ),
                    ),
                    onPressed: () => {},
                  )
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                alignment: Alignment.center,
                child: FlatButton(
                  // splashColor: Colors.transparent, comment this until find way to highlight color text instead flatbutton.
                  child: Text(
                    "Criar Conta",
                  ),
                  onPressed: () => {},
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}