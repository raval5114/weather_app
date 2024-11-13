import 'package:flutter/material.dart';
import 'package:weather_app/component/histroyPage/src/TommorowWeatherCompoent.dart';
import 'package:weather_app/component/histroyPage/src/weekWeatherStatusComponent.dart';
import 'package:weather_app/component/homepage/src/suplymentWeatherInfoComponent.dart';
import 'package:weather_app/model/Services/weather_service.dart';
import 'package:weather_app/model/forecast.dart';
import 'package:weather_icons/weather_icons.dart';

class Dashboard2 extends StatefulWidget {
  const Dashboard2({super.key});

  @override
  State<Dashboard2> createState() => _Dashboard2State();
}

class _Dashboard2State extends State<Dashboard2> {
  late Future<WeatherForecast> weatherForecasted;

  @override
  void initState() {
    super.initState();
    weatherForecasted = weatherService.getForecast('Rajkot');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WeatherForecast>(
      future: weatherForecasted,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            WeatherForecast forecast = snapshot.data!;
            DateTime today = DateTime.now();
            DateTime tomorrow = today.add(const Duration(days: 1));

            Iterable<Forecast> tomorrowWeather = forecast.list
                .where((Forecast e) => e.dtText.day == tomorrow.day);

            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                children: [
                  Tommorowweathercompoent(
                    weatherDiscription:
                        tomorrowWeather.first.weatherDescription,
                    day: 'Tomorrow',
                    degree: '${tomorrowWeather.first.temp}',
                    weatherStatus: tomorrowWeather.first.weatherDescription,
                  ),
                  SupplymentInfoWidet(
                    windSpeed: "${tomorrowWeather.first.windSpeed}",
                    humidity: "${tomorrowWeather.first.humidity}",
                    rain: "0",
                  ),
                  Weekweatherstatuscomponent(forecast: forecast),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
                style: const TextStyle(fontSize: 12, color: Colors.white),
              ),
            );
          }
        }

        return const Center(child: Text('Unable to fetch weather data.'));
      },
    );
  }
}
