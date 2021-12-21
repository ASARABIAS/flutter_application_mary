import 'package:flutter/material.dart';

class Home_page extends StatefulWidget {
  Home_page({Key? key}) : super(key: key);

  @override
  _Home_pageState createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  int _selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("correo"),
      ),
      //body: _widgets.elementAt(_selectIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.groups_outlined,
              key: ValueKey("groupsTab"),
            ),
            label: "Groups",
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.more_time_outlined,
                key: ValueKey("sesionsTab"),
              ),
              label: "Sesions")
        ],
        currentIndex: _selectIndex,
      ),
    );
  }
}
