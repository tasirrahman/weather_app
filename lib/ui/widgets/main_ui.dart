import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/controllers/theme_controller.dart';
import 'package:weather_app/ui/widgets/location_widget.dart';
import 'package:weather_app/ui/widgets/mmw_details_widget.dart';
import 'package:weather_app/ui/widgets/weather_icons.dart';
import 'package:weather_app/ui/widgets/weather_time_widget.dart';

Widget mainui(Weather? weather) {
  if (weather == null) {
    return const Center(child: CircularProgressIndicator());
  } else {
    // Replace with your desired widget when weather is not null
    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 20, 8, 20),
        child: Column(
          children: [
            SizedBox(
              width: 330,
              child: Card(
                color: customTheme.containerColor,
                elevation: 4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      weatherIcons(weather),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          locationWidget(weather),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              moreDetails(weather),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      weatherTime(weather),
                      const SizedBox(
                        width: 25,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
