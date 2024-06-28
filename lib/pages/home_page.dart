import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/controllers/theme_controller.dart';
import 'package:weather_app/models/owm_model.dart';
import 'package:weather_app/static/app_data.dart';
import 'package:weather_app/ui/widgets/main_ui.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    wf.currentWeatherByCityName("Tongi").then((value) {
      setState(() {
        weather = value as Weather?;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      color: customTheme.backgroundColor,
      theme: ThemeData(
        useMaterial3: customTheme.material3,
        scaffoldBackgroundColor: customTheme.backgroundColor,
      ),
      home: Scaffold(
        body: mainui(weather),
      ),
    );
  }
}
