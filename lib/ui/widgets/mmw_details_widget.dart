import 'package:flutter/material.dart';
import 'package:weather/weather.dart';

Widget moreDetails(Weather? weather) {
  return Column(
    children: [Text(weather!.temperature!.celsius.toString() + "° C")],
  );
}
