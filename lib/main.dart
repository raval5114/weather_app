import 'package:flutter/material.dart';
import 'package:weather_app/component/histroyPage/src/uniqueDay.dart';
import 'package:weather_app/model/Services/weather_service.dart';
import 'package:weather_app/view/homepage.dart';

void main() {
  // weatherService.getWether("Rajkot");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: MyHomepage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
