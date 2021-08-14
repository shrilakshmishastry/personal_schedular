import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:personal_schedular/config/Routes/bottomTab.dart';
import 'package:personal_schedular/redux/models/user_info.dart';
import 'package:personal_schedular/redux/schedular_state.dart';
import 'package:personal_schedular/redux/store.dart';
import 'LoginHandler/index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Redux.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  // _routeBuilderBeforeLogin() {
  //   return <String, WidgetBuilder>{
  //     '/login': (BuildContext context) => new LoginHandler(),
  //   };
  // }

  // _routeBuilderAfterLogin() {
  //   return <String, WidgetBuilder>{
  //     '/': (BuildContext context) => new BottomTabSchedular(),
  //   };
  // }

  ThemeData _themeData = ThemeData(
    primaryColor: Color(0xff1022d6),
    primaryColorLight: Color(0xffAAB1F7),
    accentColor: Color(0xffbbc4d3),
    primaryColorDark: Color(0xff3f58c4),
    shadowColor: Color(0xfff8f4f8),
    fontFamily: 'Lato2OFL',
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.amberAccent,
    ),
    textTheme: TextTheme(
        bodyText1: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
        headline1: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
        headline2: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w600),
        button: TextStyle(fontSize: 16.0),
        caption: TextStyle(fontSize: 14.0)),
  );

  @override
  Widget build(BuildContext context) {
    print(Redux.store.state.appState.userInfo?.email);
    return StoreProvider<AppState>(
        store: Redux.store,
        child: StoreConnector<AppState, SchedularState>(
          converter: (state) => state.state.appState,
          builder: (context, appState) {
            return MaterialApp(
              // routes: appState.userInfo?.email == null
              //     ? _routeBuilderBeforeLogin()
              //     : _routeBuilderAfterLogin(),
              // initialRoute: appState.userInfo?.email == null ? '/login' : '/',
              home: appState.userInfo?.email == null
                  ? LoginHandler()
                  : BottomTabSchedular(),
              title: 'Flutter Demo',
              theme: _themeData,
            );
          },
        ));
  }
}
