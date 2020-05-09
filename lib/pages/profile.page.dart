import 'package:flutter/material.dart';

import 'package:task_app/models/user.dart';

class ProfilePage extends StatefulWidget {
  final User user;

  ProfilePage({Key key, @required this.user}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    print(widget.user.name);
    print(widget.user.email);
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Column(
      // mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        SizedBox(height: 80,),
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
        SizedBox(height: 20,),
        SizedBox(
          width: double.infinity,
          child: Text(
            widget.user.name,
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
            widget.user.email,
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