import 'package:flutter/cupertino.dart';
import 'clouds.dart';
import 'main_data.dart';
import 'system_info.dart';
import 'weather.dart';
import 'wind.dart';

class Forecast {
  final Weather weather;
  final MainData mainData;
  final SystemInfo systemInfo;
  final Clouds clouds;
  final Wind wind;
  final int statusCode;

  Forecast({
    @required this.weather,
    @required this.mainData,
    @required this.systemInfo,
    @required this.clouds,
    @required this.wind,
    @required this.statusCode
  });

  factory Forecast.fromJson(Map<String, dynamic> json) {
    return Forecast(
        weather: json['weather'],
        mainData: json['mainData'],
        systemInfo: json['systemInfo'],
        clouds: json['clouds'],
        statusCode: json['code'],
        wind: json['wind']);
        
  }
}