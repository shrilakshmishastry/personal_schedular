import 'package:flutter/material.dart';
import 'package:personal_schedular/config/Theme/colors.dart';

class CustomTheme with ChangeNotifier {
  static bool isDarkTheme = false;
  ThemeMode get currentTheme => isDarkTheme ? ThemeMode.dark : ThemeMode.light;
  void toggleTheme() {
    isDarkTheme = !isDarkTheme;
    notifyListeners();
  }

  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      primaryColor: ColorsSchedular.primary,
      primaryColorLight: ColorsSchedular.primaryLight1,
      accentColor: ColorsSchedular.secondaryColor,
      highlightColor: ColorsSchedular.primaryColorDark,
      primaryColorDark: ColorsSchedular.primaryColorDark,
      shadowColor: ColorsSchedular.light,
      fontFamily: 'Lato2OFL',
      textTheme: TextTheme(
          bodyText1: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
          bodyText2: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400),
          headline1: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
          headline2: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w600),
          headline3: TextStyle(fontSize: 23.0, fontWeight: FontWeight.w600),
          headline4: TextStyle(fontSize: 21.0, fontWeight: FontWeight.w600),
          headline5: TextStyle(fontSize: 19.0, fontWeight: FontWeight.w600),
          headline6: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w600),
          button: TextStyle(fontSize: 16.0),
          caption: TextStyle(fontSize: 14.0)),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      scaffoldBackgroundColor: Colors.black,
      primaryColor: Colors.white,
      primaryColorLight: ColorsSchedular.primary,
      accentColor: ColorsSchedular.secondaryColor,
      primaryColorDark: ColorsSchedular.primaryLight1,
      highlightColor: ColorsSchedular.primary,
      shadowColor: ColorsSchedular.primaryLight2,
      fontFamily: 'Lato2OFL',
      textTheme: TextTheme(
          bodyText2: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
              color: ColorsSchedular.light),
          bodyText1: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
              color: ColorsSchedular.light),
          headline1: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: ColorsSchedular.light),
          headline2: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.w600,
              color: ColorsSchedular.light),
          headline3: TextStyle(
              fontSize: 23.0,
              fontWeight: FontWeight.w600,
              color: ColorsSchedular.light),
          headline4: TextStyle(
              fontSize: 21.0,
              fontWeight: FontWeight.w600,
              color: ColorsSchedular.light),
          headline5: TextStyle(
              fontSize: 19.0,
              fontWeight: FontWeight.w600,
              color: ColorsSchedular.light),
          headline6: TextStyle(
              fontSize: 17.0,
              fontWeight: FontWeight.w600,
              color: ColorsSchedular.light),
          button: TextStyle(fontSize: 16.0),
          caption: TextStyle(fontSize: 14.0)),
    );
  }
}
