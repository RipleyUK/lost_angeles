import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:lost_angeles/core/models/app_exception.dart';

class ApiService {
  static const endpoint = 'https://haven-tech-test.s3-eu-west-1.amazonaws.com';

  Future<dynamic> get(String url) async {
    var responseJson;
    try {
      var response =
          await http.get('$endpoint/$url', headers: await getHeaders());
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic getHeaders() async {
    return {"Accept": "application/json", "content-type": "application/json"};
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson;
        if (response.body != null && response.body.length > 0) {
          responseJson = json.decode(response.body.toString());
        }
        return responseJson;
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
