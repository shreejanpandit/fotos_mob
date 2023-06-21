import 'dart:convert';
import 'dart:io';

import 'package:fotos_mobile/data/app_exceptions.dart';
import 'package:fotos_mobile/data/network/base_api_service.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiService {
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      // print(url);
      final response = await http.get(
        Uri.parse(url),
        headers: {
          "Content-type": "application/json",
          // "X-Requested-With": "XMLHttpRequest",
          "Accept": "application/json"
        },
      ).timeout(
        Duration(seconds: 20),
      );
      // print(response.body);
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No internet connection');
    }
    return responseJson;
  }

  @override
  Future<dynamic> getPostApiResponse(String url, dynamic data) async {
    try {
      http.Response response = await http.post(
        Uri.parse(url),
        body: jsonEncode(data),
        headers: {
          "Content-type": "application/json",
          "X-Requested-With": "XMLHttpRequest",
          "Accept": "application/json"
        },
      ).timeout(Duration(seconds: 15));

      return returnResponse(response);
    } on SocketException {
      throw FetchDataException('No internet connection');
    }
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 422:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 404:
        throw UnauthorizedException(response.body.toString());
      default:
        throw FetchDataException(
            'Error occurred while communicating with the server ' +
                'with response code ' +
                response.statusCode.toString());
    }
  }
}
