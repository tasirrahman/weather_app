import 'package:flutter/material.dart';
import 'package:weather_app/core/app/app_info.dart';

class MaterialAppWidget extends StatefulWidget {
  final Widget child;
  const MaterialAppWidget({super.key, required this.child});

  @override
  State<MaterialAppWidget> createState() => _MaterialAppWidgetState();
}

class _MaterialAppWidgetState extends State<MaterialAppWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: appName, home: widget.child);
  }
}
