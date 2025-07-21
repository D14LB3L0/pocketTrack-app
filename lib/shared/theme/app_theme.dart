import 'package:flutter/material.dart';

class AppTheme {
  static Color primaryColor = Color(0XFF12687f);
  static Color secondaryColor = Color(0XFF1aa3b3);
  static Color accentColor = Color(0XFF20dad8);
  static Color backgroundColor = Color(0XFFF0FCFC);

  static ThemeData lighTheme = ThemeData.light().copyWith(
    colorScheme: ColorScheme.light(
      primary: AppTheme.primaryColor, 
      onPrimary: Colors.white, 
      onSurface: Colors.black, 
    ),

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
      iconTheme: IconThemeData(color: Colors.white),
    ),

    // FloatingActionButtonTheme
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: secondaryColor,
      foregroundColor: Colors.white,
      elevation: 5,
    ),

    // InputDecorationTheme
    inputDecorationTheme: InputDecorationTheme(
      errorStyle: TextStyle(fontSize: 14),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: AppTheme.primaryColor),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: AppTheme.primaryColor, width: 2),
      ),
      hintStyle: TextStyle(fontSize: 16),
    ),


    // MenuTheme
    menuTheme: MenuThemeData(
      style: MenuStyle(
        backgroundColor: WidgetStateProperty.all(Colors.white),
        visualDensity: VisualDensity.compact,
        alignment: Alignment.bottomLeft,
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            side: BorderSide(color: AppTheme.primaryColor, width: 2),
          ),
        ),
      ),
    ),

    // ButtonTheme
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      padding: EdgeInsets.symmetric(vertical: 12),
    ),
  );
}
