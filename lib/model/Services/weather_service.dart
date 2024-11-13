import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weather_app/model/forecast.dart';
import 'package:weather_app/model/weatherStatus.dart';
import 'package:http/http.dart' as http;

//https://api.openweathermap.org/data/2.5/weather?q=Rajkot&appid=e502894fce0c256e94dd8bc58e217337
//https://api.openweathermap.org/data/2.5/forecast?q=Rajkot&appid=e502894fce0c256e94dd8bc58e217337
class WeatherService {
  String forweather = 'weather';
  String forForcast = 'forecast';
  static const BASE_URL = 'http://api.openweathermap.org/data/2.5';
  static const BASE_URL_WEATHER = '$BASE_URL/weather';
  static const BASE_URL_FORECAST = '$BASE_URL/forecast';
  final String apiKey;
  WeatherService({required this.apiKey});

  Future<WeatherModal> getWeather(String cityName) async {
    final response = await http.get(
        Uri.parse('$BASE_URL_WEATHER?q=$cityName&appid=$apiKey&units=metric'));
    if (response.statusCode == 200) {
      debugPrint("Parsing Completed");
      return (WeatherModal.fromJson(jsonDecode(response.body)));
    } else {
      //print error description
      debugPrint('');
      throw Exception('Failed to load weather Data');
    }
  }

  Future<WeatherForecast> getForecast(String cityName) async {
    final Response = await http.get(
        Uri.parse('$BASE_URL_FORECAST?q=$cityName&appid=$apiKey&units=metric'));
    if (Response.statusCode == 200) {
      debugPrint("Parsing Completed");
      return (WeatherForecast.fromJson(jsonDecode(Response.body)));
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}

WeatherService weatherService =
    WeatherService(apiKey: 'e502894fce0c256e94dd8bc58e217337');
