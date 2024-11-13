import 'package:flutter/material.dart';
import 'package:weather_app/model/Services/weather_service.dart';
import 'package:weather_app/model/forecast.dart';

class WeatherForecastTesting extends StatefulWidget {
  const WeatherForecastTesting({super.key});

  @override
  State<WeatherForecastTesting> createState() => _WeatherForecastTestingState();
}

class _WeatherForecastTestingState extends State<WeatherForecastTesting> {
  late Future<WeatherForecast> weatherForecast;

  @override
  void initState() {
    super.initState();
    weatherForecast = weatherService.getForecast('Rajkot');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<WeatherForecast>(
        future: weatherForecast,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show a loading indicator while waiting for data
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              // Accessing the 'list' from snapshot.data
              List<Forecast> forecastList = snapshot.data!.list;
              // Show data when available
              return Center(
                  child: ListView.builder(
                itemCount: forecastList.length,
                itemBuilder: (context, index) {
                  return Center(
                    child: Container(
                      margin: EdgeInsets.all(12),
                      child: Text(
                          'Temperature: ${forecastList[0].temp}°C\nWeather: ${forecastList[index].weatherDescription} \nMaximum temp: ${forecastList[index].maxTemp}\nMinimum temp: ${forecastList[index].minTemp}\ndate: ${forecastList[index].dtText}'),
                    ),
                  );
                },
              ));
            } else if (snapshot.hasError) {
              // Show error message if something went wrong
              return Center(child: Text('Error: ${snapshot.error}'));
            }
          }
          // Default case for other connection states, or in case nothing is returned
          return const Center(child: Text("Something went wrong"));
        },
      ),
    );
  }
}
