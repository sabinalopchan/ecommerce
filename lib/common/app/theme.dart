import 'package:flutter/material.dart';

class CustomTheme {
  static const Color primaryColor = Color(0xFFA7976ED);
  static const Color darkGray = Color(0xFFA5C5B67);
  static const Color lightTextColor = Color(0xFFAD6D3D3);
  static const Color darkTextColor = Color(0xFFA000000);
  static const Color backgroudColor = Color(0xFFAE1DFFD);
  static const Color whitetextColor = Color(0xFFAFFFFFF);

  static ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: backgroudColor,
    iconTheme: const IconThemeData(color: lightTextColor, size: 15),
    textTheme: const TextTheme(
      headline1: TextStyle(
          color: lightTextColor, fontWeight: FontWeight.bold, fontSize: 24),
      headline2: TextStyle(
          color: lightTextColor, fontWeight: FontWeight.bold, fontSize: 22),
      headline3: TextStyle(
          color: lightTextColor, fontWeight: FontWeight.bold, fontSize: 20),
      headline4: TextStyle(fontSize: 18, color: lightTextColor),
      headline5: TextStyle(color: lightTextColor, fontSize: 16),
      headline6: TextStyle(
          color: lightTextColor, fontSize: 14, fontWeight: FontWeight.w300),
      caption: TextStyle(color: lightTextColor, fontSize: 8),
      subtitle2: TextStyle(color: lightTextColor, fontSize: 12),
      subtitle1: TextStyle(color: lightTextColor, fontSize: 10),
      button: TextStyle(color: lightTextColor, fontSize: 12),
      bodyText1: TextStyle(fontSize: 12, color: lightTextColor),
      bodyText2: TextStyle(fontSize: 10, color: lightTextColor),
    ),
  );
}
