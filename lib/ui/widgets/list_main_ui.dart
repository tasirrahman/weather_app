// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/api/api_key.dart';
import 'package:weather_app/ui/widgets/main_ui.dart';

class ListMainUI extends StatefulWidget {
  final String city;
  ListMainUI({super.key, required this.city});

  @override
  State<ListMainUI> createState() => _ListMainUIState();
}

class _ListMainUIState extends State<ListMainUI> {
  Weather? weather;
  late WeatherFactory wf;

  @override
  void initState() {
    super.initState();
    wf = WeatherFactory(apiKey); // Add your OpenWeatherMap API key here
    _fetchWeather();
  }

  void _fetchWeather() async {
    Weather? fetchedWeather = await wf.currentWeatherByCityName(widget.city);
    setState(() {
      weather = fetchedWeather;
    });
  }

  @override
  Widget build(BuildContext context) {
    return mainui(weather);
  }
}
