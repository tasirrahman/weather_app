import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_app/core/app/app_info.dart';
import 'package:weather_app/presentation/pages/splash_screen.dart';
import 'package:weather_app/presentation/widgets/material_app_widget.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(MaterialApp(title: appName, home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialAppWidget(child: const SplashScreen());
  }
}
