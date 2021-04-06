import 'package:flutter/cupertino.dart';
import 'package:weather_app/model/api/forecast.dart';
import 'package:weather_app/model/webservice.dart';

class HomePageVM extends ChangeNotifier {
  Forecast forecast;

  Future<void> fetchForecast() async {
    final response =
        await Webservice().fetchForecast('test');
    if (response.statusCode == 200) {
      forecast = response;
      notifyListeners();
    } else {
      throw Exception('Failed to get response from server');
    }
  }
}
