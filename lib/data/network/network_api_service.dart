import 'dart:convert';
import 'dart:io';

import 'package:fotos_mobile/data/app_exceptions.dart';
import 'package:fotos_mobile/data/network/base_api_service.dart';
import 'package:fotos_mobile/models/user_models.dart';
import 'package:fotos_mobile/view_model/user_view_model.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiService {
  Future<UserModel> getUserData() => UserViewModel().getUser();
  String? token = '';
  @override
  Future getGetApiResponse(String url) async {
    // print(url);
    dynamic responseJson;
    try {
      await getUserData().then((value) {
        token = value.data?.accessToken.toString();
      });
      final response = await http.get(
        Uri.parse(url),
        headers: {
          "Content-type": "application/json",
          "X-Requested-With": "XMLHttpRequest",
          "Accept": "application/json",
          'Authorization': 'Bearer $token',
        },
      );
      // .timeout(
      //   Duration(seconds: 20),
      // );
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
      getUserData().then((value) {
        token = value.data?.accessToken.toString();
        print('get token $token');
      });
      http.Response response = await http.post(
        Uri.parse(url),
        body: jsonEncode(data),
        headers: {
          "Content-type": "application/json",
          // "Content-type": "multipart/form-data",

          "X-Requested-With": "XMLHttpRequest",
          "Accept": "application/json",
          'Authorization': 'Bearer $token',
        },
      ).timeout(const Duration(seconds: 15));
      // print(response.body);
      return returnResponse(response);
    } on SocketException {
      throw FetchDataException('No internet connection');
    }
  }

  @override
  Future<dynamic> getPutApiResponse(String url, dynamic data) async {
    try {
      getUserData().then((value) {
        token = value.data?.accessToken.toString();
        print('get token $token');
      });
      http.Response response = await http.put(
        Uri.parse(url),
        body: jsonEncode(data),
        headers: {
          "Content-type": "application/json",
          // "Content-type": "multipart/form-data",

          "X-Requested-With": "XMLHttpRequest",
          "Accept": "application/json",
          'Authorization': 'Bearer $token',
        },
      ).timeout(const Duration(seconds: 15));
      // print(response.body);
      return returnResponse(response);
    } on SocketException {
      throw FetchDataException('No internet connection');
    }
  }

  @override
  Future<dynamic> getPatchApiResponse(String url, dynamic data) async {
    try {
      getUserData().then((value) {
        token = value.data?.accessToken.toString();
        print('get token $token');
      });
      http.Response response = await http.patch(
        Uri.parse(url),
        body: jsonEncode(data),
        headers: {
          "Content-type": "application/json",
          // "Content-type": "multipart/form-data",

          "X-Requested-With": "XMLHttpRequest",
          "Accept": "application/json",
          'Authorization': 'Bearer $token',
        },
      ).timeout(const Duration(seconds: 15));
      // print(response.body);
      return returnResponse(response);
    } on SocketException {
      throw FetchDataException('No internet connection');
    }
  }

  @override
  Future<dynamic> getDeleteApiResponse(String url) async {
    // print(url.toString());
    try {
      getUserData().then((value) {
        token = value.data?.accessToken.toString();
        print('delete token $token');
      }); // Fetch the user token from somewhere

      final response = await http.delete(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      }).timeout(const Duration(seconds: 15));
      print(response.statusCode);
      return returnResponse(response);
    } on SocketException {
      throw FetchDataException('No internet connection');
    }
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        // print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 422:
        dynamic responseJson = jsonDecode(response.body);
        // Utils.toastMessage(responseJson['message']);
        throw UnprocessableEntityException(responseJson['message']);
      case 404:
        throw UnauthorizedException(response.body.toString());
      default:
        throw FetchDataException(
            'Error occurred while communicating with the server with response code ${response.statusCode}');
    }
  }
}
