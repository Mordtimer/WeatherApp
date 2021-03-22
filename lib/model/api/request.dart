import 'package:http/http.dart' as http;

Future<http.Response> fetchAlbum() {
  return http.get(Uri.https('jsonplaceholder.typicode.com', 'albums/1'));
}
