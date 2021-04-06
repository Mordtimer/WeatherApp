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
        temp: json['temp'].toDouble(),
        feelsLike: json['feels_like'].toDouble(),

        tempMin: json['temp_min'].toDouble(),
        tempMax: json['temp_max'].toDouble(),
        pressure: json['pressure'].toDouble(),
        humidity: json['humidity'].toDouble());
  }
}