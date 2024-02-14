import 'package:flutter/material.dart';


const primaryColor = Color(0xFF1B5B1E);
const textColor = Color(0xFF35364F);
const wColor = Colors.white;
const bColor = Colors.black;
const defaultPadding = 14.0;

OutlineInputBorder textFieldBorder = OutlineInputBorder(
  borderSide: BorderSide(
    color: primaryColor.withOpacity(0.1),
  ),
);

class ThemesApp {
  static final light = ThemeData(
    useMaterial3: false,
    primarySwatch: Colors.blue,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: primaryColor,
        padding: const EdgeInsets.all(defaultPadding),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: textFieldBorder,
      enabledBorder: textFieldBorder,
      focusedBorder: textFieldBorder,
    ),

  );

  static final dark = ThemeData(
    primaryColor: primaryColor,
    backgroundColor: bColor,
    brightness: Brightness.dark,
  );
}




