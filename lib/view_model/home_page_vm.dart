import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:weather_app/model/api/forecast.dart';

class HomePageVM extends ChangeNotifier {
  Forecast forecast;

  Future<void> fetchForecast() async {
    final response =
        await http.get(Uri.https('api.openweathermap.org', '/data/2.5/weather?q=London,uk&APPID=c1028663fd394e2f410845e0f37b935f'));
    if (response.statusCode == 200) {
      print(response);
      this.forecast = Forecast.fromJson(jsonDecode(response.body));
      notifyListeners();
    } else {
      throw Exception('Failed to get response from server');
    }
  }
}
