import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:task_app/models/user.dart';

import 'package:task_app/pages/create.page.dart';
import 'package:task_app/pages/home.page.dart';

import '../models/user.dart';
import '../pages/profile.page.dart';

class BottomBar extends StatefulWidget {
  final User user;
  
  BottomBar({Key key, @required this.user}) : super(key: key);
  
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentIndex = 0;
  
  List<Widget> _childrens() => [HomePage(), ProfilePage(user: widget.user)];

  @override
  Widget build(BuildContext context) {
    print(widget.user.id);
    final List<Widget> children = _childrens();
    return Scaffold(
      body: children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => this._currentIndex = index),
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        selectedFontSize: 16,
        unselectedFontSize: 14,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text(
                "Home",
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text("Perfil"))
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.grey,
        onPressed: () => {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => CreatePage()
            )
          )
        },
      ),
    );
  }
}
