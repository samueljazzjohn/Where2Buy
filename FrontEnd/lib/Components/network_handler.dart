import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class NetworkHandler {
  String baseUrl = 'https://where2buy-2022.herokuapp.com';
  // String baseUrl = 'http://127.0.0.1:55981';
  var log = Logger();

  Future<http.Response> getReq(String url) async {
    url = formatter(url);
    var response = await http.get(Uri.parse(url));
    print("response:${response.statusCode}");
    log.i(response.body);
    return response;
  }

  Future<http.Response> postReq(String url, Map<String, dynamic> body) async {
    url = formatter(url);
    var response = await http.post(Uri.parse(url), body: body);
    print("response:${response.statusCode}");
    log.i(response.body);
    return response;
  }

  String formatter(String url) {
    return baseUrl + url;
  }
}

// class NetworkHandler {
//   String baseUrl = 'https://where2buy-2022.herokuapp.com';
//   // String baseUrl = 'http://127.0.0.1:55981';
//   var log = Logger();
//   var _dio = Dio();

//   Future<Response> getReq(String url) async {
//     url = formatter(url);
//     Response response;
//     try {
//       response = await _dio.get(url);
//       print(response.data.toString());
//       log.i(response);
//     } on DioError catch (e) {
//       print(e.message);
//       throw Exception(e.message);
//     }
//     return response;
//   }

//   Future<Response> postReq(String url, Map<String, dynamic> body) async {
//     url = formatter(url);
//     Response response;
//     try {
//       response = await _dio.post(url);
//       log.i(response);
//     } on DioError catch (e) {
//       throw Exception(e.message);
//     }
//     return response;
//   }

//   String formatter(String url) {
//     return baseUrl + url;
//   }
// }
