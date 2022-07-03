import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:base_api_integration/services/exceptions.dart';
import 'package:http/http.dart' as http;

class BaseUrl {
  static const int TIME_OUT_DURATION = 20;
  //Get
  Future<dynamic> get(String baseUrl, String api) async {
    var uri = Uri.parse(baseUrl + api);
    try {
      var response = await http.get(uri).timeout(
            Duration(seconds: TIME_OUT_DURATION),
          );
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException(
        "No internet connection",
        uri.toString(),
      );
    } on TimeoutException {
      throw ApiNotRespondingException(
        "Api Not responds in time ",
        uri.toString(),
      );
    }
  }

  //post
  Future<dynamic> post(String baseUrl, String api, dynamic payLoadObj) async {
    var uri = Uri.parse(baseUrl + api);
    var payLoad = json.encode(payLoadObj);
    try {
      var response = await http.post(uri, body: payLoad).timeout(
            Duration(seconds: TIME_OUT_DURATION),
          );
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException(
        "No internet connection",
        uri.toString(),
      );
    } on TimeoutException {
      throw ApiNotRespondingException(
        "Api Not responds in time ",
        uri.toString(),
      );
    }
  }

  dynamic _processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 201:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      case 400:
        throw BadRequestException(
            jsonDecode(response.body), response.request!.url.toString());
      case 401:
      case 403:
        throw UnAuthorisedException(
            jsonDecode(response.body), response.request!.url.toString());
      case 422:
        throw BadRequestException(
            jsonDecode(response.body), response.request!.url.toString());
      case 500:
      default:
        throw UnAuthorisedException(
            'Error Occured with coden: ${response.statusCode}',
            response.request!.url.toString());
    }
  }
}
