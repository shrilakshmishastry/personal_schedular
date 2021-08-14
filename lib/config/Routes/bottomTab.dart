import 'package:flutter/material.dart';
import 'package:personal_schedular/AddEvent/index.dart';
import 'package:personal_schedular/Home/home.dart';
import 'package:personal_schedular/Profile/index.dart';
import 'package:personal_schedular/config/Theme/sizes_helper.dart';

class BottomTabSchedular extends StatefulWidget {
  @override
  _BottomTabState createState() => _BottomTabState();
}

class _BottomTabState extends State<BottomTabSchedular> {
  int _selectdIndex = 0;

  void handleTap() {
    print("hello");
    setState(() {
      _selectdIndex = 0;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectdIndex = index;
    });
  }

//  Home(),
//       AddEventIndex(),
//       ProfileIndex(handleTap()),

  @override
  Widget build(BuildContext context) {
    dynamic height = setHeight(context);

    return SafeArea(
        child: Scaffold(
      body: Container(
        child: _selectdIndex == 0
            ? Home()
            : _selectdIndex == 1
                ? AddEventIndex()
                : ProfileIndex(handleTap),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: height * 0.05,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).primaryColorLight,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: _selectdIndex == 0
                  ? Icon(
                      Icons.home,
                      size: height * 0.04,
                    )
                  : Icon(
                      Icons.home_outlined,
                      size: height * 0.04,
                    ),
              label: ""),
          BottomNavigationBarItem(
              icon: _selectdIndex == 1
                  ? Icon(
                      Icons.add_circle_rounded,
                      size: height * 0.04,
                    )
                  : Icon(
                      Icons.add_circle_outline,
                      size: height * 0.04,
                    ),
              label: ""),
          BottomNavigationBarItem(
              icon: _selectdIndex == 2
                  ? Icon(
                      Icons.person,
                      size: height * 0.04,
                    )
                  : Icon(Icons.person_outline, size: height * 0.04),
              label: ""),
        ],
        currentIndex: _selectdIndex,
        onTap: _onItemTapped,
      ),
    ));
  }
}
