import 'package:flutter/material.dart';
import 'package:weather/weather.dart';

Widget moreDetails(Weather? weather) {
  return Column(
    children: [
      Text(
        '${weather!.temperature!.celsius!.toStringAsFixed(0)}° C',
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    ],
  );
}
