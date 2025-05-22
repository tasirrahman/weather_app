import 'package:flutter/material.dart';
import 'package:weather_app/app/routes/navigation.dart';
import 'package:weather_app/view/pages/home_screen.dart';
import 'package:weather_app/view/widgets/material_app_widget.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialAppWidget(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF1A2251), Color(0xFF3B3486), Color(0xFF9B36B7)],
            ),
          ),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 2),

                // Weather icon - Make sure the asset path is correct
                Image.asset(
                  'assets/weather_01.png',
                  width: 340,
                  height: 340,
                  fit: BoxFit.contain,
                ),

                const Spacer(flex: 1),

                // Text elements with correct spacing and styling
                Column(
                  children: const [
                    Text(
                      'Weather',
                      style: TextStyle(
                        fontSize: 65,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        height: 1.1,
                      ),
                    ),
                    Text(
                      'ForeCasts',
                      style: TextStyle(
                        fontSize: 70,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFF7C948), // Gold/yellow color
                        height: 1.1,
                      ),
                    ),
                  ],
                ),

                const Spacer(flex: 1),

                // Get Start button with proper sizing and styling
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF7C948),
                    minimumSize: const Size(220, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 0,
                  ),
                  onPressed: () {
                    Navigate.to(context, HomeScreen());
                  },
                  child: const Text(
                    'Get Start',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF3B3486), // Deep purple color
                    ),
                  ),
                ),

                const Spacer(flex: 3),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
