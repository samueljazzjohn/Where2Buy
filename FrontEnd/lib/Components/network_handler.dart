import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NetworkHandler {
  BuildContext ctx;
  NetworkHandler({required this.ctx});
  String baseUrl = "https://where2buy-2022.herokuapp.com";
  // String baseUrl = 'http://127.0.0.1:55981';
  var log = Logger();

  Future<http.Response> getReq(String url) async {
    url = formatter(url);
    String token = await getToken();
    var response = await http.get(
      Uri.parse(url),
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer $token"
        // "Authorization": token
      },
    );
    try {
      print("response:${response.statusCode}");
      log.i(response.body);
      // return response;
    } on SocketException catch (e) {
      print("Socket exception:${e.message}");
      throw "Internet not connected!!!";
    } on TimeoutException catch (e) {
      print("timeouterror");
      throw "Server not responding..please try again later!!!";
    } catch (e) {
      throw "Something went wrong...please try again later!!!";
    }
    print(response.body);
    return response;
  }

  Future<http.Response> postReq(String url, String body) async {
    url = formatter(url);
    http.Response response;
    String token = await getToken();
    try {
      response = await http
          .post(Uri.parse(url),
              headers: {
                "Content-type": 'application/json',
                "Authorization": "Bearer $token"
                // "Authorization": '$token'
              },
              body: body)
          .timeout(Duration(seconds: 75));
      print("response:${response.statusCode}");
      log.i(response.body);
    } on SocketException catch (e) {
      print("Socket exception:${e.message}");
      throw "Internet not connected!!!";
    } on TimeoutException catch (e) {
      print("timeouterror");
      throw "Server not responding..please try again later!!!";
    } catch (e) {
      // throw "something wrong";
      return Future.error(e.toString());
      // throw "Something went wrong...please try again later!!!";
    }
    print(response.body);
    return response;
  }

  Future<http.Response> deleteReq(String url, String body) async {
    url = formatter(url);
    http.Response response;
    String token = await getToken();
    try {
      response = await http
          .delete(Uri.parse(url),
              headers: {
                "Content-type": 'application/json',
                "Authorization": "Bearer $token"
              },
              body: body)
          .timeout(Duration(seconds: 75));
      print("response:${response.statusCode}");
      log.i(response.body);
    } on SocketException catch (e) {
      print("Socket exception:${e.message}");
      throw "Internet not connected!!!";
    } on TimeoutException catch (e) {
      print("timeouterror");
      throw "Server not responding..please try again later!!!";
    } catch (e) {
      return Future.error(e);
      // throw "Something went wrong...please try again later!!!";
    }
    print(response.body);
    return response;
  }

  Future<http.Response> patchReq(String url, String body) async {
    url = formatter(url);
    http.Response response;
    String token = await getToken();
    try {
      response = await http
          .patch(Uri.parse(url),
              headers: {
                "Content-type": 'application/json',
                "Authorization": "Bearer $token"
                // "Authorization": '$token'
              },
              body: body)
          .timeout(Duration(seconds: 75));
      print("response:${response.statusCode}");
      log.i(response.body);
    } on SocketException catch (e) {
      print("Socket exception:${e.message}");
      throw "Internet not connected!!!";
    } on TimeoutException catch (e) {
      print("timeouterror");
      throw "Server not responding..please try again later!!!";
    } catch (e) {
      // throw "something wrong";
      return Future.error(e.toString());
      // throw "Something went wrong...please try again later!!!";
    }
    print(response.body);
    return response;
  }

  Future<http.Response> postReqLogSignup(String url, String body) async {
    url = formatter(url);
    http.Response response;
    try {
      response = await http
          .post(Uri.parse(url),
              headers: {
                "Content-type": 'application/json',
              },
              body: body)
          .timeout(Duration(seconds: 75));
      print("response:${response.statusCode}");
      log.i(response.body);
    } on SocketException catch (e) {
      print("Socket exception:${e.message}");
      throw "Internet not connected!!!";
    } on TimeoutException catch (e) {
      print("timeouterror");
      throw "Server not responding..please try again later!!!";
    } catch (e) {
      return Future.error(e);
      // throw "Something went wrong...please try again later!!!";
    }
    print(response.body);
    return response;
  }

  Future<http.StreamedResponse> patchImage(String url, String filepath) async {
    url = formatter(url);
    // http.Response response;
    String token = await getToken();
    try {
      var request = http.MultipartRequest('PATCH', Uri.parse(url));
      request.files.add(await http.MultipartFile.fromPath("img", filepath));
      request.headers.addAll({
        "Content-type": "multipart/form-data",
        "Authorization": "Bearer $token"
      });
      // request.fields['type'] = type;
      var response = await request.send();
      log.i(response);
      return response;
    } on SocketException catch (e) {
      throw "Server error";
    } on TimeoutException catch (e) {
      throw "Server not responding...Please try again later";
    } catch (e) {
      throw Future.error(e);
    }
  }

  String formatter(String url) {
    return baseUrl + url;
  }

  String getImage(String filename) {
    String url = formatter(filename);
    return url;
  }

  static getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = await pref.getString('token');
    return token;
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
