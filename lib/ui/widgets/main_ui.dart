import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/ui/widgets/location_widget.dart';
import 'package:weather_app/ui/widgets/mmw_details_widget.dart';
import 'package:weather_app/ui/widgets/weather_icons.dart';
import 'package:weather_app/ui/widgets/weather_time_widget.dart';

Widget mainui(Weather? weather) {
  if (weather == null) {
    return Center(child: const CircularProgressIndicator());
  } else {
    // Replace with your desired widget when weather is not null
    return Center(
      child: Column(
        children: [
          locationWidget(weather),
          weatherTime(weather),
          weatherIcons(weather),
          moreDetails(weather)
        ],
      ),
    );
  }
}
