import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class WeatherText extends StatefulWidget {
  final String degree;
  final bool isCelsius;
  const WeatherText({super.key, required this.degree, required this.isCelsius});

  @override
  State<WeatherText> createState() => _WeatherTextState();
}

class _WeatherTextState extends State<WeatherText> {
  String? degree;

  @override
  Widget build(BuildContext context) {
    degree = "${widget.degree}\u00B0";
    return Text(
      degree!,
      textAlign: TextAlign.center, // Center-align the text
      style: GoogleFonts.ubuntu(
        textStyle: const TextStyle(
          color: Colors.white,
          fontSize: 50,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class WeatherICon extends StatelessWidget {
  WeatherICon({
    super.key,
    required this.weatherdescription,
  });
  final String weatherdescription;
  Map<String, dynamic> lottieArt = {
    'Clear': 'sunny',
    'Clouds': 'cloudy',
    'Rain': 'rainy',
    'Drizzle': 'shower_rainy',
    'Thunderstrom': 'thunderstrom_rainy'
  };
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          width: 250,
          height: 180,
          child: Lottie.asset(
              'assets/animations/${lottieArt[weatherdescription]}_weather_animation.json',
              backgroundLoading: true)),
    );
  }
}
