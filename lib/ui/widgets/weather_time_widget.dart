import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/controllers/theme_controller.dart';

Widget weatherTime(Weather? weather) {
  DateTime now = weather!.date!;
  return Column(
    children: [
      Text(
        DateFormat("h:mm a").format(now),
        style: TextStyle(fontSize: 20, color: customTheme.textColor),
      ),
      SizedBox(
        height: 5,
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            DateFormat("EEEE").format(now),
            style: TextStyle(fontSize: 10, color: customTheme.textColor),
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            DateFormat("d.m.y").format(now),
            style: TextStyle(fontSize: 10, color: customTheme.textColor),
          ),
        ],
      ),
    ],
  );
}
