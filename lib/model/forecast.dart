class WeatherForecast {
  final List<Forecast> list;

  WeatherForecast({required this.list});

  factory WeatherForecast.fromJson(Map<String, dynamic> json) {
    return WeatherForecast(
      list: (json['list'] as List)
          .map((item) => Forecast.fromJson(item))
          .toList(),
    );
  }
}

class Forecast {
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String weatherDescription;
  final int humidity;
  final double windSpeed;
  final DateTime dtText;

  Forecast({
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherDescription,
    required this.humidity,
    required this.windSpeed,
    required this.dtText,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) {
    return Forecast(
      temp: json['main']['temp'].toDouble(),
      maxTemp: json['main']['temp_max'].toDouble(),
      minTemp: json['main']['temp_min'].toDouble(),
      weatherDescription: json['weather'][0]['main'],
      humidity: json['main']['humidity'].toInt(),
      windSpeed: json['wind']['speed'].toDouble(),
      //convert the text to date
      dtText: DateTime.parse(json['dt_txt']),
    );
  }
}
