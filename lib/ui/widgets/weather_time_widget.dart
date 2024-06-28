import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/controllers/theme_controller.dart';

Widget weatherTime(Weather? weather) {
  DateTime now = weather!.date!;
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text(
        DateFormat("h:mm a").format(now),
        style: TextStyle(
            fontSize: 15,
            color: customTheme.textColor,
            fontWeight: FontWeight.bold),
      ),
      SizedBox(
        width: 15,
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            DateFormat("EEEE").format(now),
            style: TextStyle(
                fontSize: 15,
                color: customTheme.textColor,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            DateFormat("d.m.y").format(now),
            style: TextStyle(
                fontSize: 15,
                color: customTheme.textColor,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ],
  );
}
