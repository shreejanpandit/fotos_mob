import 'package:fotos_mobile/data/network/base_api_service.dart';
import 'package:fotos_mobile/data/network/network_api_service.dart';
import 'package:fotos_mobile/res/app_urls.dart';

import '../models/user_models.dart';

class AuthRepository {
  final BaseApiService _apiService = NetworkApiService();
  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiService.getPostApiResponse(AppUrl.loginUrl, data);
      print(response.toString());

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> signupApi(dynamic data) async {
    try {
      dynamic response =
          await _apiService.getPostApiResponse(AppUrl.registerUrl, data);
      print(response.toString());
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<User> getUserData(String id) async {
    try {
      dynamic response =
          await _apiService.getGetApiResponse('${AppUrl.user}/${id}');
      print('user fetched from getuserdata ${response.toString()}');
      return User.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
