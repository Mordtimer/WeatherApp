import 'package:csv/csv.dart';
import 'package:flutter/services.dart' show rootBundle;

List<List<dynamic>> data = [];

class Cities {
  Future<List<List<dynamic>>> loadAll() async {
    final myData = await rootBundle.loadString("assets/places.csv");
    List<List<dynamic>> csvTable = CsvToListConverter().convert(myData);

    data = csvTable;
    return data;
  }
}
