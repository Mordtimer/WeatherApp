import 'package:flutter/cupertino.dart';

class Wind {
  final double speed;
  final double degree;

  Wind({
    @required this.speed,
    @required this.degree,
  });

  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(speed: json['speed'], degree: json['deg']);
  }
}