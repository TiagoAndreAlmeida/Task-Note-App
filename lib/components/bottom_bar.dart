import 'package:flutter/material.dart';

import 'package:task_app/pages/create.page.dart';
import 'package:task_app/pages/home.page.dart';
import 'package:task_app/pages/profile.page.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentIndex = 0;
  final List<Widget> _childrens = [HomePage(), ProfilePage(), CreatePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _childrens[_currentIndex],
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
          setState(() => this._currentIndex = 2)
          // print(_currentIndex),
          // print(_childrens.length),
          // print(_childrens[0]),
          // print(_childrens[1]),
          // print(_childrens[2]),
          // print(_childrens.indexWhere((el) => el.toString() == CreatePage().toString())),
          // print('FIM'),
          // setState(() => this._currentIndex = _childrens.indexWhere((el) => el.toString() == CreatePage().toString()))
        },
      ),
    );
  }
}
