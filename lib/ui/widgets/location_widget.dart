import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/controllers/theme_controller.dart';

Widget locationWidget(Weather? weather) {
  return Text(
    weather?.areaName ?? "",
    style: TextStyle(color: customTheme.textColor, fontSize: 20),
  );
}
