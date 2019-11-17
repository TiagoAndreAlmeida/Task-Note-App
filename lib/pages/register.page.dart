import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
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
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Nome',
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
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'senha',
                labelStyle: TextStyle(
                  color: Colors.blue,
                  fontSize: 20
                ),
              ),
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
              onPressed: () => {},
            )
          ],
        ),
      ),
    );
  }
}