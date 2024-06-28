import 'package:flutter/material.dart';
import 'package:weather/weather.dart';

Widget weatherIcons(Weather? weather) {
  return Image.network(
    "http://openweathermap.org/img/wn/${weather!.weatherIcon}@4x.png",
    width: 100,
  );
}
