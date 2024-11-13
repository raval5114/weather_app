import 'package:flutter/material.dart';

class Forecast {
  DateTime time;
  String weather;

  Forecast(this.time, this.weather);
}

class UniqueWeekdayForecastList extends StatelessWidget {
  final List<Forecast> forecasts = [
    Forecast(DateTime(2023, 11, 6, 10, 0), "Sunny"), // Monday
    Forecast(DateTime(2023, 11, 6, 15, 0), "Cloudy"), // Monday
    Forecast(DateTime(2023, 11, 7, 10, 0), "Rainy"), // Tuesday
    Forecast(DateTime(2023, 11, 8, 10, 0), "Sunny"), // Wednesday
    Forecast(DateTime(2023, 11, 9, 15, 0), "Windy"), // Thursday
    Forecast(DateTime(2023, 11, 10, 10, 0), "Sunny"), // Friday
    Forecast(DateTime(2023, 11, 11, 15, 0), "Cloudy"), // Saturday
    Forecast(DateTime(2023, 11, 12, 10, 0), "Rainy"), // Sunday
    Forecast(DateTime(2023, 11, 13, 10, 0), "Windy"), // Monday
  ];

  @override
  Widget build(BuildContext context) {
    // Filter forecasts to get unique weekdays
    Set<int> uniqueWeekdays = {};
    List<Forecast> uniqueWeekdayForecasts = forecasts.where((forecast) {
      return uniqueWeekdays.add(forecast.time.weekday);
    }).toList();

    return Scaffold(
      appBar: AppBar(title: Text('Unique Weekday Forecasts')),
      body: ListView.builder(
        itemCount: uniqueWeekdayForecasts.length,
        itemBuilder: (context, index) {
          final forecast = uniqueWeekdayForecasts[index];
          String dayOfWeek = _getDayOfWeek(forecast.time.weekday);
          return ListTile(
            title: Text("Day: $dayOfWeek"),
            subtitle: Text("Weather: ${forecast.weather}"),
          );
        },
      ),
    );
  }

  // Helper function to get the day of the week as a string
  String _getDayOfWeek(int weekday) {
    switch (weekday) {
      case 1:
        return "Monday";
      case 2:
        return "Tuesday";
      case 3:
        return "Wednesday";
      case 4:
        return "Thursday";
      case 5:
        return "Friday";
      case 6:
        return "Saturday";
      case 7:
        return "Sunday";
      default:
        return "";
    }
  }
}
