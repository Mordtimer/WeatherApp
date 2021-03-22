import 'package:flutter/cupertino.dart';

class SystemInfo {
  final int sunrise;
  final int sunset;
  final String country;

  SystemInfo({
    @required this.sunrise,
    @required this.sunset,
    @required this.country,
  });

  factory SystemInfo.fromJson(Map<String, dynamic> json) {
    return SystemInfo(
        sunrise: json['sunrise'],
        sunset: json['sunset'],
        country: json['country']);
  }
}