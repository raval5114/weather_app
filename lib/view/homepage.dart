import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/component/homepage/dashboardComponent.dart';
import 'package:weather_icons/weather_icons.dart';

class MyHomepage extends StatefulWidget {
  const MyHomepage({super.key});

  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 25, 25, 25),
        leading: const Icon(
          Icons.menu_rounded,
          color: Colors.white,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Icon(Icons.settings, color: Colors.white),
          )
        ],
        title: Text(
          "Weather App",
          style: GoogleFonts.ubuntu(
              textStyle: const TextStyle(color: Colors.white, fontSize: 20)),
        ),
        centerTitle: true,
      ),
      body: DashBoard(),
      backgroundColor: const Color.fromARGB(255, 25, 25, 25),
    );
  }
}
