class WeatherModal {
  final String cityName;
  final double temperature;
  final String mainCondition;
  final double windSpeed;
  final int humidity;

  WeatherModal({
    required this.cityName,
    required this.temperature,
    required this.mainCondition,
    required this.windSpeed,
    required this.humidity,
  });

  factory WeatherModal.fromJson(Map<String, dynamic> json) {
    return WeatherModal(
      cityName: json['name'],
      temperature: json['main']['temp'].toDouble(),
      mainCondition: json['weather'][0]['main'],
      windSpeed: json['wind']['speed'].toDouble(),
      humidity: json['main']['humidity'].toInt(),
    );
  }
}
