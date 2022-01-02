import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class NetworkHandler {
  String baseUrl = 'http://localhost:3000/';
  var log = Logger();

  Future<dynamic> get(String url) async {
    url = formatter(url);
    var response = await http.get(Uri.parse(url));
    log.i(response.body);
    log.i(response.statusCode);
  }

  Future<dynamic> post(String url, Map<String, String> body) async {
    url = formatter(url);
    var response = await http.post(Uri.parse(url), body: body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      log.i(response.body);
      return response;
    }
    log.i(response.body);
    log.i(response.statusCode);
  }

  String formatter(String url) {
    return baseUrl + url;
  }
}
