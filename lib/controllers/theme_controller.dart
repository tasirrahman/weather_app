import 'package:flutter/material.dart';

class CustomTheme {
  final bool material3;
  final Color backgroundColor;
  final Color textColor;
  final Color buttonColor;
  final Color iconColor;
  final Color appbarColor;
  final Color containerColor;

  CustomTheme(
      {required this.material3,
      required this.backgroundColor,
      required this.textColor,
      required this.buttonColor,
      required this.iconColor,
      required this.appbarColor,
      required this.containerColor});
}

CustomTheme customTheme = CustomTheme(
    material3: false,
    backgroundColor: Colors.black,
    textColor: Colors.black,
    buttonColor: Colors.black,
    iconColor: Colors.black,
    appbarColor: Colors.white,
    containerColor: const Color.fromARGB(255, 255, 145, 0));
