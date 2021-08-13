import 'package:flutter/material.dart';
import 'package:personal_schedular/AddEvent/index.dart';
import 'package:personal_schedular/Home/home.dart';
import 'package:personal_schedular/config/Theme/sizes_helper.dart';

class BottomTabSchedular extends StatefulWidget {
  @override
  _BottomTabState createState() => _BottomTabState();
}

class _BottomTabState extends State<BottomTabSchedular> {
  int _selectdIndex = 0;

  static List<Widget> _widgetsAfterLogin = <Widget>[
    Home(),
    AddEventIndex(),
    Text("Profile"),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectdIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    dynamic height = setHeight(context);
    dynamic width = setWidth(context);
    return SafeArea(
        child: Scaffold(
      body: Container(
        child: _widgetsAfterLogin[_selectdIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: setHeight(context) * 0.05,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).primaryColorLight,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: _selectdIndex == 0
                  ? Icon(
                      Icons.home,
                      size: setHeight(context) * 0.04,
                    )
                  : Icon(
                      Icons.home_outlined,
                      size: setHeight(context) * 0.04,
                    ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: _selectdIndex == 1
                  ? Icon(
                      Icons.add_circle_rounded,
                      size: setHeight(context) * 0.04,
                    )
                  : Icon(
                      Icons.add_circle_outline,
                      size: setHeight(context) * 0.04,
                    ),
              label: "AddEvent"),
          BottomNavigationBarItem(
              icon: _selectdIndex == 2
                  ? Icon(
                      Icons.person,
                      size: setHeight(context) * 0.04,
                    )
                  : Icon(Icons.person_outline, size: setHeight(context) * 0.04),
              label: "Profile"),
        ],
        currentIndex: _selectdIndex,
        onTap: _onItemTapped,
      ),
    ));
  }
}
