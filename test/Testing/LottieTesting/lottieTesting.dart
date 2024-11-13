import 'package:flutter/material.dart';
import 'package:http/retry.dart';
import 'package:lottie/lottie.dart';

class Lottietesting extends StatefulWidget {
  const Lottietesting({super.key});

  @override
  State<Lottietesting> createState() => _LottietestingState();
}

class _LottietestingState extends State<Lottietesting> {
  String? weather = "Clear";
  @override
  void initState() {
    super.initState();
    //   weather = getLottieAsWeatherDescription('Drizzle');
  }

  // String getLottieAsWeatherDescription(String weatherDescription) {
  //   switch (weatherDescription) {
  //     case 'Clear':
  //       return 'sunny';
  //     case 'Clouds':
  //       return 'cloudy';
  //     case 'Rain':
  //       return 'rainy';
  //     case 'Drizzle':
  //       return 'shower_rainy';
  //     case 'Thunderstrom':
  //       return 'thunderstrom_rainy';
  //   }
  //   return '';
  // }

  Map<String, dynamic> lottieArt = {
    'Clear': 'sunny',
    'Clouds': 'cloudy',
    'Rain': 'rainy',
    'Drizzle': 'shower_rainy',
    'Thunderstrom': 'thunderstrom_rainy'
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      body: ListView(
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: Lottie.asset(
                'assets/animations/${lottieArt[weather]}_weather_animation.json'),
          ),
        ],
      ),
    );
  }
}
