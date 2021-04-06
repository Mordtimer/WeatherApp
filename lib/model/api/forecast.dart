import 'package:flutter/cupertino.dart';
import 'clouds.dart';
import 'main_data.dart';
import 'system_info.dart';
import 'weather.dart';
import 'wind.dart';

class Forecast {
  final List<Weather> weather;
  final MainData mainData;
  final SystemInfo systemInfo;
  //final Clouds clouds;
  final Wind wind;
  final int statusCode;

  Forecast({
    @required this.weather,
    @required this.mainData,
    @required this.systemInfo,
    //@required this.clouds,
    @required this.wind,
    @required this.statusCode
  });

  factory Forecast.fromJson(Map<String, dynamic> json) {
    var weatherList = json['weather'] as List;
    return Forecast(
        weather: weatherList.map((i) => Weather.fromJson(i)).toList(),
        mainData: MainData.fromJson(json['main']),
        systemInfo: SystemInfo.fromJson(json['sys']),
        //clouds: json['clouds'],
        statusCode: json['cod'],
        wind: Wind.fromJson(json['wind']));
        
  }
}