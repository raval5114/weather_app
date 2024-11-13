import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/model/forecast.dart';
import 'package:weather_icons/weather_icons.dart';

class Weekweatherstatuscomponent extends StatefulWidget {
  const Weekweatherstatuscomponent({super.key, required this.forecast});
  final WeatherForecast forecast;
  @override
  State<Weekweatherstatuscomponent> createState() =>
      _WeekweatherstatuscomponentState();
}

class _WeekweatherstatuscomponentState
    extends State<Weekweatherstatuscomponent> {
  late WeatherForecast forecastedWeather;
  late List<Forecast> uniqueForecast;
  Set<int> uniqueForecastWithDays = {};
  void initState() {
    // TODO: implement initState
    super.initState();
    forecastedWeather = widget.forecast;
    uniqueForecast = forecastedWeather.list.where((Forecast e) {
      return uniqueForecastWithDays.add(e.dtText.weekday);
    }).toList();
  }

  Map<int, dynamic> weeks = {
    1: "Mon",
    2: "Tue",
    3: "Wed",
    4: "Thu",
    5: "Fri",
    6: "Sat",
    7: "Sun"
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return WeekWeatherTile(
              day: weeks[uniqueForecast[index].dtText.weekday],
              status: uniqueForecast[index].weatherDescription,
              degree: uniqueForecast[index].temp.toString(),
            );
          },
          itemCount: uniqueForecast.length,
        ));
  }
}

class WeekWeatherTile extends StatefulWidget {
  final String day;
  final String status;
  final String degree;
  const WeekWeatherTile(
      {super.key,
      required this.day,
      required this.status,
      required this.degree});

  @override
  State<WeekWeatherTile> createState() => _WeekWeatherTileState();
}

class _WeekWeatherTileState extends State<WeekWeatherTile> {
  Map<String, dynamic> lottieArt = {
    'Clear': 'sunny',
    'Clouds': 'cloudy',
    'Rain': 'rainy',
    'Drizzle': 'shower_rainy',
    'Thunderstrom': 'thunderstrom_rainy'
  };
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(2),
      leading: Text(
        widget.day,
        style: GoogleFonts.ubuntu(
            textStyle: const TextStyle(fontSize: 15, color: Colors.white)),
      ),
      title: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Expanded(
              child: SizedBox(),
            ),
            SizedBox(
              width: 40,
              height: 40,
              child: Lottie.asset(
                  'assets/animations/${lottieArt[widget.status]}_weather_animation.json'),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              widget.status,
              style: GoogleFonts.ubuntu(
                  textStyle:
                      const TextStyle(fontSize: 20, color: Colors.white)),
            ),
            const Expanded(
              child: SizedBox(),
            ),
          ],
        ),
      ),
      trailing: Text(
        "${widget.degree}\u00B0",
        style: GoogleFonts.ubuntu(
            textStyle: const TextStyle(fontSize: 15, color: Colors.white)),
      ),
    );
  }
}
