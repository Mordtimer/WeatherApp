import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/model/api/forecast.dart'; 

class Webservice {

  Future<Forecast> fetchForecast(String keyword) async {
    //final url3 = "http://www.omdbapi.com/?s=$keyword&apikey=YOURAPIKEYHERE";
    //final url = "api.openweathermap.org/data/2.5/weather?q=$keyword2&APPID=c1028663fd394e2f410845e0f37b935f";
    Uri test = Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$keyword,pl&APPID=c1028663fd394e2f410845e0f37b935f');
    final response = 
      await http.get(test);
    if(response.statusCode == 200) {
      print(Forecast.fromJson(jsonDecode(response.body)).statusCode);
       return Forecast.fromJson(jsonDecode(response.body));
      
    } else {
      print(Forecast.fromJson(jsonDecode(response.body)).statusCode);
      throw Exception("Unable to perform request!");
    }
  }
}