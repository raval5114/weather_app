import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart'; // Import intl package
import 'package:lottie/lottie.dart';
import 'package:weather_app/model/forecast.dart';
import 'package:weather_app/view/historyPage.dart';

class WeatherHistorySection extends StatefulWidget {
  final List<Forecast> forecastList;
  const WeatherHistorySection({super.key, required this.forecastList});

  @override
  State<WeatherHistorySection> createState() => _WeatherHistorySectionState();
}

class _WeatherHistorySectionState extends State<WeatherHistorySection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      width: 100,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            child: Row(
              children: [
                Text(
                  "Today",
                  style: GoogleFonts.ubuntu(
                      textStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.white)),
                ),
                const Expanded(child: SizedBox()), // Space between the texts
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Historypage()));
                  },
                  child: Text(
                    "7 days >",
                    style: GoogleFonts.ubuntu(
                        textStyle: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                            color: Colors.grey)),
                  ),
                ),
              ],
            ),
          ),
          TodayWeatherWithTime(
              forecast: widget.forecastList) // Calling the correct widget here
        ],
      ),
    );
  }
}

class TodayWeatherWithTime extends StatefulWidget {
  final List<Forecast> forecast;
  const TodayWeatherWithTime({super.key, required this.forecast});

  @override
  State<TodayWeatherWithTime> createState() => _TodayWeatherWithTimeState();
}

class _TodayWeatherWithTimeState extends State<TodayWeatherWithTime> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.forecast.length,
        itemBuilder: (context, index) {
          // Parsing and formatting the time
          DateTime dateTime =
              DateTime.parse('${widget.forecast[index].dtText}');
          String formattedTime = DateFormat('HH:mm').format(dateTime);

          return TodayWeatherWithTimeComponent(
            degrees: "${widget.forecast[index].temp}",
            time: formattedTime, // Pass the formatted time
            weatherDescription: widget.forecast[index].weatherDescription,
            isCurrent: false,
          );
        },
      ),
    );
  }
}

class TodayWeatherWithTimeComponent extends StatelessWidget {
  final String degrees;
  final String time;
  final String weatherDescription;
  final bool isCurrent;
  const TodayWeatherWithTimeComponent(
      {super.key,
      required this.degrees,
      required this.time,
      required this.weatherDescription,
      required this.isCurrent});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> lottieArt = {
      'Clear': 'sunny',
      'Clouds': 'cloudy',
      'Rain': 'rainy',
      'Drizzle': 'shower_rainy',
      'Thunderstorm': 'thunderstorm_rainy'
    };
    Color color =
        isCurrent ? Colors.blueAccent : Color.fromARGB(53, 52, 52, 52);

    return Container(
      width: 60,
      height: 120, // Increase the height for a better layout
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("$degrees\u00B0",
              style: GoogleFonts.ubuntu(
                  textStyle:
                      const TextStyle(color: Colors.white, fontSize: 15))),
          const SizedBox(height: 5),
          // Increase the width and height for a medium-size animation
          SizedBox(
            width: 40, // Medium width for better visibility
            height: 40, // Medium height for better visibility
            child: LottieBuilder.asset(
                'assets/animations/${lottieArt[weatherDescription]}_weather_animation.json'),
          ),
          const SizedBox(height: 10),
          Text(
            time,
            style: GoogleFonts.ubuntu(
                textStyle: const TextStyle(color: Colors.white, fontSize: 12)),
          ),
        ],
      ),
    );
  }
}
