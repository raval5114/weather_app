import 'package:flutter/material.dart';
import 'package:weather_app/component/homepage/src/suplymentWeatherInfoComponent.dart';
import 'package:weather_app/component/homepage/src/weatherHistroyComponent.dart';
import 'package:weather_app/component/homepage/src/weatherStatusComponent.dart';
import 'package:weather_app/model/Services/weather_service.dart';
import 'package:weather_app/model/forecast.dart';
import 'package:weather_app/model/weatherStatus.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  late Future<List<dynamic>> weatherAndForecast;

  @override
  void initState() {
    super.initState();
    weatherAndForecast = Future.wait([
      weatherService.getWeather('Rajkot'),
      weatherService.getForecast('Rajkot'),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: weatherAndForecast,
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            WeatherModal w = snapshot.data![0] as WeatherModal;
            WeatherForecast forecast = snapshot.data![1] as WeatherForecast;

            DateTime today = DateTime.now();
            List<Forecast> forecastForDay = forecast.list.where((Forecast e) {
              return e.dtText.day == today.day;
            }).toList();

            return ListView(
              shrinkWrap: true,
              children: [
                WeatherICon(weatherdescription: w.mainCondition),
                WeatherText(degree: w.temperature.toString(), isCelsius: true),
                SupplymentInfoWidet(
                  windSpeed: "${w.windSpeed}",
                  humidity: "${w.humidity}",
                  rain: "${w.windSpeed}",
                ),
                WeatherHistorySection(
                  forecastList: forecastForDay,
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Exception: ${snapshot.error}'));
          }
        }
        return const Center(child: Text('Unable to fetch weather data.'));
      },
    );
  }
}
