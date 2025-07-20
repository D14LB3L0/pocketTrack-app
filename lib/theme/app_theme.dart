import 'package:flutter/material.dart';

class AppTheme {
  static Color primaryColor = Color(0XFF12687f);
  static Color secondaryColor = Color(0XFF1aa3b3);
  static Color accentColor = Color(0XFF20dad8);
  static Color backgroundColor = Color(0XFFF0FCFC);

  static ThemeData lighTheme = ThemeData.light().copyWith(
    // Scaffold
    scaffoldBackgroundColor: backgroundColor,
    // AppBarTheme
    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(color: Colors.white)
    ),

    // FloatingActionButtonTheme
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: secondaryColor,
      foregroundColor: Colors.white,
      elevation: 0
    ),
  );
}
 