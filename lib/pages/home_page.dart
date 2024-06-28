import 'package:flutter/material.dart';
import 'package:weather_app/controllers/theme_controller.dart';
import 'package:weather_app/static/app_data.dart';
import 'package:weather_app/ui/widgets/list_main_ui.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Map<int, String> cities = {1: "Tongi", 2: "Rajshahi"};
  final TextEditingController _cityController = TextEditingController();
  int _cityCounter = 3;

  void _addCity() {
    setState(() {
      cities[_cityCounter] = _cityController.text;
      _cityCounter++;
      _cityController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: ThemeData(
        useMaterial3: customTheme.material3,
        scaffoldBackgroundColor: customTheme.backgroundColor,
      ),
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: _cityController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: 'Enter City Name',
                        labelStyle:
                            TextStyle(color: Colors.grey), // Label text color
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: Colors.blue), // Border color when focused
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: Colors.grey), // Border color when enabled
                        ),
                      ),
                      style: TextStyle(color: Colors.black), // Input text color
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                            Color(0xFFFFA500)), // Custom orange color
                      ),
                      onPressed: _addCity,
                      child: Text(
                        'Add City',
                        style: TextStyle(color: customTheme.textColor),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Wrap(
                  spacing: 5.0,
                  runSpacing: 5.0,
                  children: List.generate(cities.length, (int index) {
                    int key = cities.keys.elementAt(index);
                    return SizedBox(
                      width: MediaQuery.of(context).size.width / 6 - 10,
                      child: ListMainUI(
                        city: cities[key]!,
                      ),
                    );
                  }),
                ),
              ),
              Center(
                  child: Text(
                inc,
                style: TextStyle(color: Colors.white),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
