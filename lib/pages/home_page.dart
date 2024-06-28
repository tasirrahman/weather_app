import 'package:flutter/material.dart';
import 'package:weather_app/controllers/theme_controller.dart';
import 'package:weather_app/static/app_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      color: customTheme.backgroundColor,
      theme: ThemeData(
        useMaterial3: customTheme.material3,
        scaffoldBackgroundColor: customTheme.backgroundColor,
      ),
      home: Scaffold(),
    );
  }
}
