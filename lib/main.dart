import 'package:flutter/material.dart';
import 'package:weather_api/Home.dart';
import 'package:weather_api/WeatherDisplay.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
      routes: {
        // '/scan': (context) => const SunmiScreen(),
        '/detail': (context) => const WeatherDisplay(
              data: '',
            ),
      },
    );
  }
}
