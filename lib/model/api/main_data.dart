import 'package:flutter/cupertino.dart';

class MainData {
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final double pressure;
  final double humidity;

  MainData({
    @required this.temp,
    @required this.feelsLike,
    @required this.tempMin,
    @required this.tempMax,
    @required this.pressure,
    @required this.humidity,
  });

  factory MainData.fromJson(Map<String, dynamic> json) {
    return MainData(
        temp: json['temp'],
        feelsLike: json['feels_like'],
        tempMin: json['temp_min'],
        tempMax: json['temp_max'],
        pressure: json['pressure'],
        humidity: json['humidity']);
  }
}