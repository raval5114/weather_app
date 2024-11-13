import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_icons/weather_icons.dart';

class Tommorowweathercompoent extends StatefulWidget {
  final String weatherDiscription;
  final String day;
  final String degree;
  final String weatherStatus;

  const Tommorowweathercompoent(
      {super.key,
      required this.day,
      required this.degree,
      required this.weatherStatus,
      required this.weatherDiscription});

  @override
  State<Tommorowweathercompoent> createState() =>
      _TommorowweathercompoentState();
}

class _TommorowweathercompoentState extends State<Tommorowweathercompoent> {
  Map<String, dynamic> lottieArt = {
    'Clear': 'sunny',
    'Clouds': 'cloudy',
    'Rain': 'rainy',
    'Drizzle': 'shower_rainy',
    'Thunderstrom': 'thunderstrom_rainy'
  };
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 112,
            height: 100,
            child: Lottie.asset(
                'assets/animations/${lottieArt[widget.weatherDiscription]}_weather_animation.json'),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.day,
                  style: GoogleFonts.ubuntu(
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w200)),
                ),
                Text(
                  "${widget.degree}\u00B0",
                  style: GoogleFonts.ubuntu(
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w700)),
                ),
                Text(
                  widget.weatherStatus,
                  style: GoogleFonts.ubuntu(
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 9,
                          fontWeight: FontWeight.w100)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
