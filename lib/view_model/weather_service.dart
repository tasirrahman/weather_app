import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/app/api/open_weather_api.dart';
import 'package:weather_app/model/hourly_weather_mode.dart';
import 'package:weather_app/model/weather_model.dart';

class WeatherService {
  static final String _apiKey = openWeatherApiKey;
  static const String _baseUrl = 'https://api.openweathermap.org/data/2.5';

  Future<Position> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error(
        'Location services are disabled. Please enable location services in your device settings.',
      );
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error(
          'Location permissions are denied. Please allow location access to get weather data.',
        );
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
        'Location permissions are permanently denied. Please enable location access in your device settings.',
      );
    }

    try {
      return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
        timeLimit: const Duration(seconds: 30),
      );
    } catch (e) {
      return Future.error(
        'Unable to get your current location. Please check your GPS and network connection.',
      );
    }
  }

  Future<WeatherModel> getCurrentWeather() async {
    try {
      Position position = await getCurrentLocation();

      final response = await http.get(
        Uri.parse(
          '$_baseUrl/weather?lat=${position.latitude}&lon=${position.longitude}&appid=$_apiKey&units=metric',
        ),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final hourlyForecast = await getHourlyForecast(
          position.latitude,
          position.longitude,
        );

        final weather = WeatherModel.fromJson(data);
        return WeatherModel(
          cityName: weather.cityName,
          temperature: weather.temperature,
          description: weather.description,
          icon: weather.icon,
          maxTemp: weather.maxTemp,
          minTemp: weather.minTemp,
          humidity: weather.humidity,
          windSpeed: weather.windSpeed,
          hourlyForecast: hourlyForecast,
        );
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      throw Exception('Error fetching weather: $e');
    }
  }

  Future<List<HourlyWeather>> getHourlyForecast(double lat, double lon) async {
    try {
      final response = await http.get(
        Uri.parse(
          '$_baseUrl/forecast?lat=$lat&lon=$lon&appid=$_apiKey&units=metric',
        ),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> list = data['list'];

        return list
            .take(4)
            .map((item) => HourlyWeather.fromJson(item))
            .toList();
      } else {
        throw Exception('Failed to load forecast data');
      }
    } catch (e) {
      throw Exception('Error fetching forecast: $e');
    }
  }
}
