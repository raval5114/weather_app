import 'package:flutter/material.dart';
import 'package:weather_app/model/Services/weather_service.dart';
import 'package:weather_app/model/weatherStatus.dart';

class Weatherstatustesting extends StatefulWidget {
  const Weatherstatustesting({super.key});

  @override
  State<Weatherstatustesting> createState() => _WeatherstatustestingState();
}

class _WeatherstatustestingState extends State<Weatherstatustesting> {
  late Future<WeatherModal> weatherFuture;

  @override
  void initState() {
    super.initState();
    weatherFuture = weatherService.getWeather("Rajkot");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<WeatherModal>(
        future: weatherFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(
                child: Text("${snapshot.error}"),
              );
            }
            if (snapshot.hasData) {
              // Display the weather data
              final weather = snapshot.data!;
              return Center(
                child: Text(
                  "City: ${weather.cityName}\n"
                  "Temperature: ${weather.temperature}°C\n"
                  "Condition: ${weather.mainCondition}\n"
                  "Wind Speed: ${weather.windSpeed} m/s\n"
                  "Humidity: ${weather.humidity}%",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
              );
            }
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
