import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecorverPage extends StatefulWidget {
  @override
  _RecorverPageState createState() => _RecorverPageState();
}

class _RecorverPageState extends State<RecorverPage> {

  String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('Recuperar senha'),
      ),
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/background.jpg'),
                  fit: BoxFit.fill)),
          child: Scaffold(
            backgroundColor: Color.fromRGBO(255, 255, 255, 0.67),
            body: Container(
              padding: EdgeInsets.only(top: 85, left: 60, right: 20),
              child: ListView(
                children: <Widget>[
                  Text(
                    "Insira seu E-mail de cadastro!",
                    style: TextStyle(fontSize: 28, fontStyle: FontStyle.italic),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    // decoration: InputDecoration(
                    //   labelText: "exemplo@email.com",
                    //   labelStyle: TextStyle(
                    //     color: Colors.blue,
                    //     fontSize: 20
                    //   ),
                    // ),
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    onChanged: (value) => setState(() => this.email = value),
                  ),
                  SizedBox(height: 20,),
                  ButtonTheme(
                    height: 50,
                    child: RaisedButton(
                      child: Text(
                        "Recuperar Senha",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                  
                      color: Colors.blue,
                      onPressed: () => Navigator.pop(context),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
