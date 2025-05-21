import 'package:flutter/material.dart';
import 'package:weather_app/core/utils/app_colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: false,
    primaryColor: AppColors.appColor,
    scaffoldBackgroundColor: Colors.white,

    appBarTheme: const AppBarTheme(
      elevation: 1,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black, // icons & text

      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, // Text/icon color
        backgroundColor: AppColors.appColor, // Button fill
        textStyle: const TextStyle(fontWeight: FontWeight.w500),
      ),
    ),

    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black87),
      bodyMedium: TextStyle(color: Colors.black87),
      titleLarge: TextStyle(color: Colors.black),
      titleMedium: TextStyle(color: Colors.black54),
    ),

    iconTheme: const IconThemeData(color: Colors.black54),
  );
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: false,
    primaryColor: Colors.grey[850],
    scaffoldBackgroundColor: Colors.grey[900],
    canvasColor: Colors.grey[900],
    cardColor: Colors.grey[850],
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(255, 44, 44, 44),
      foregroundColor: Colors.white,
      elevation: 3, // Simulates a BoxShadow depth
      shadowColor: Colors.black26, // Soft shadow color
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        textStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white),
      bodySmall: TextStyle(color: Colors.white),
      titleLarge: TextStyle(color: Colors.white),
      titleMedium: TextStyle(color: Colors.white70),
    ),

    iconTheme: const IconThemeData(color: Colors.white),
  );
}
