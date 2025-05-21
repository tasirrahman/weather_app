// ignore_for_file: use_build_context_synchronously
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:weather_app/core/app/app_info.dart';
import 'package:weather_app/core/app/routes/navigation.dart';
import 'package:weather_app/core/utils/app_colors.dart';
import 'package:weather_app/core/utils/app_theme.dart';
import 'package:weather_app/presentation/pages/intro_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;
  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 4), _navigateToNext);
  }

  void _navigateToNext() {
    if (!mounted) return;
    Navigate.to(context, IntroScreen());
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: ThemeData(scaffoldBackgroundColor: AppColors.appColor),
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: Scaffold(
        body: Center(
          child: Image.asset(
            'assets/logo/app_logo_transparent.png',
            width: 200,
            height: 200,
          ),
        ),
      ),
    );
  }
}
