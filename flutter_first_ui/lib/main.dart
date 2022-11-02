import 'package:first_ui/screen/homescreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      fontFamily: 'sunflower',
      textTheme: TextTheme(
        headline1:TextStyle(
          color: Colors.white,
          fontFamily: 'parisienne',
          fontSize: 80.0,
        ),
        headline2:TextStyle(
          color: Colors.white,
          fontSize: 30.0,
        ),
        headline3:TextStyle(
          color: Colors.white,
          fontSize: 20.0,
        ),
        headline4:TextStyle(
          color: Colors.white,
          fontSize: 50.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
    home: HomeScreen(),
  ));
}
