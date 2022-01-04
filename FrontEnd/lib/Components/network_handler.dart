import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class NetworkHandler {
  String baseUrl = 'http://10.0.2.2:3000';
  var log = Logger();


  Future<dynamic> getReq(String url) async {
    url = formatter(url);
    var response = await http.get(Uri.parse(url));
    log.i(response.body);
    log.i(response.statusCode);
  }

  Future<dynamic> postReq(String url, Map<String, String> body) async {
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
