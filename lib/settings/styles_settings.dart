import 'package:flutter/material.dart';

class MyThemes {
  static final lightTheme = ThemeData(
      fontFamily: "PopPins",
      primarySwatch: Colors.red,
      primaryColorLight: Colors.black87,
      scaffoldBackgroundColor: Colors.white,
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black87),
            borderRadius: BorderRadius.circular(20)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.purple),
            borderRadius: BorderRadius.circular(20)),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(20)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(20)),
        hintStyle: const TextStyle(color: Colors.black87),
        labelStyle: const TextStyle(
          color: Colors.black87,
        ),
      ),
      textTheme: TextTheme(displayLarge: TextStyle(color: Colors.amber)));

  static final darkTheme = ThemeData(
      fontFamily: "PopPins",
      primarySwatch: Colors.red,
      primaryColorLight: Colors.white,
      scaffoldBackgroundColor: Colors.black87,
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(20)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.purple),
            borderRadius: BorderRadius.circular(20)),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(20)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(20)),
        hintStyle: const TextStyle(color: Colors.white),
        labelStyle: const TextStyle(
          color: Colors.white,
        ),
      ),
      textTheme: TextTheme(displayLarge: TextStyle(color: Colors.amber)));
}
