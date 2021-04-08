import 'package:flutter/cupertino.dart';
import 'package:weather_app/model/api/forecast.dart';
import 'package:weather_app/model/cities.dart';
import 'package:weather_app/model/webservice.dart';
import 'package:intl/intl.dart';

class HomePageVM extends ChangeNotifier {
  HomePageVM();
  // Current _forecast data
  Forecast _forecast;

  // Search bar stuff
  List<String> searchHistory = ["Żory", "Bytom", "Rzeszów"];
  List<String> allCities = [
    "Poznań",
    "Żywiec",
    "Kraków",
    "Łódź",
    "Wrocław",
    "Gdańsk",
    "Szczecin",
    "Warszawa",
    "Bydgoszcz",
    "Lublin",
    "Białystok",
    "Katowice",
    "Gdynia",
    "Częstochowa",
    "Radom",
    "Rzeszów",
    "Sosnowiec",
    "Gliwice",
    "Olsztyn",
    "Bytom",
    "Żory",
    "Kcynia"
  ];

  String currentCity = "Warszawa";
  bool isSeniorModeEnabled = false;

  void enableSeniorView() {
    isSeniorModeEnabled = true;
    notifyListeners();
  }

  void disableSeniorView() {
    isSeniorModeEnabled = false;
    notifyListeners();
  }

  // Interface metod
  String getTempreture() {
    if (_forecast == null)
      return "";
    else
      return (_forecast.mainData.temp - 273).toInt().toString() + " °C";
  }

  String getHumidity() {
    if (_forecast == null)
      return "";
    else
      return _forecast.mainData.humidity.toInt().toString() + "%";
  }

  String getWindSpeed() {
    if (_forecast == null)
      return "";
    else
      return _forecast.wind.speed.toInt().toString() + " m/s";
  }

  String getPressure() {
    if (_forecast == null)
      return "";
    else
      return _forecast.mainData.pressure.toInt().toString() + " hPa";
  }

  String getSunriseTime() {
    if (_forecast == null)
      return "";
    else {
      DateTime date = new DateTime.fromMillisecondsSinceEpoch(
          _forecast.systemInfo.sunrise * 1000);
      return DateFormat.Hm().format(date);
    }
  }

  String getSunetTime() {
    if (_forecast == null)
      return "";
    else {
      DateTime date = new DateTime.fromMillisecondsSinceEpoch(
          _forecast.systemInfo.sunset * 1000);
      return DateFormat.Hm().format(date);
    }
  }

  String getCurrentDate() {
    DateTime date = DateTime.now();
    return "${date.day} ${DateFormat.MMMM().format(date)} ${DateFormat.Hm().format(date)}";
  }

  String getIconUrl() {
    try {
      return _generateIconUrl(_forecast.weather[0].icon);
    } catch (e) {
      //returning placeholder
      return "https://openweathermap.org/img/wn/09d@2x.png";
    }
  }

  Future<void> fetchForecast() async {
    final response = await Webservice().fetchForecast(currentCity);
    if (response.statusCode == 200) {
      _forecast = response;
      notifyListeners();
    } else {
      throw Exception('Failed to get response from server');
    }
  }

  Future<void> getCities() async {
    final response = await Cities().loadAll();
    List<String> result = [];
    final list = response[0][0].split('\n');
    for (String el in list) {
        result.add(removeBefore(el, ';'));
    }
    allCities = result;
  }

  String removeBefore(String s, String el) {
    var pos = s.lastIndexOf(el);
    String result = (pos != -1) ? s.substring(pos+1, s.length) : s;
    return result;
  }

  _generateIconUrl(iconNumber) =>
      "https://openweathermap.org/img/wn/$iconNumber@2x.png";
}
