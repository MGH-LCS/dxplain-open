import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DXPlainOpenTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        // backgroundColor: Colors.green[600],
        centerTitle: false,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        elevation: 1,
      ),
      primarySwatch: Colors.blue,
      brightness: Brightness.light,
      primaryColor: Colors.green[700],
      textTheme: TextTheme(
        overline: TextStyle(fontSize: 14.0, letterSpacing: 0, fontWeight: FontWeight.w500, color: Colors.green[700]),
        headline5: TextStyle(color: Colors.green[700]),
      ),
      scaffoldBackgroundColor: Colors.white,
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(borderSide: BorderSide.none),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.black54,
        centerTitle: false,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        elevation: 1,
      ),
      primarySwatch: Colors.blue,
      brightness: Brightness.dark,
      primaryColor: Colors.blue[700],
      textTheme: TextTheme(
        overline: TextStyle(fontSize: 14.0, letterSpacing: 0, fontWeight: FontWeight.w500, color: Colors.green[700]),
        headline5: TextStyle(color: Colors.green[700]),
      ),
      scaffoldBackgroundColor: Colors.grey[900],
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.grey[800],
        border: OutlineInputBorder(borderSide: BorderSide.none),
      ),
    );
  }
}
