import 'package:flutter/cupertino.dart';

class Clouds {
  final int precentage;

  Clouds({
    @required this.precentage,
  });

  factory Clouds.fromJson(Map<String, dynamic> json) {
    return Clouds(precentage: json['precentage']);
  }
}