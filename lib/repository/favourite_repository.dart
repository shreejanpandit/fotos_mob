import 'package:fotos_mobile/data/network/base_api_service.dart';
import 'package:fotos_mobile/models/media_list_model.dart';

import '../data/network/network_api_service.dart';
import '../models/favourite_model.dart';
import '../models/media_model.dart';
import '../res/app_urls.dart';

class FavouriteRepository {
  BaseApiService _apiService = NetworkApiService();
  // Future<dynamic> createMediaApi(dynamic data) async {
  //   try {
  //     dynamic response = await _apiService.getPostApiResponse(
  //       AppUrl.authMediaUrl,
  //       data,
  //     );
  //     print(response.toString());
  //     return response;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // Future<MediaLists> getMediaListApi() async {
  //   try {
  //     dynamic response = await _apiService.getGetApiResponse(
  //       AppUrl.mediaListUrl,
  //     );
  //     // return response;
  //     return MediaLists.fromJson(response);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  Future<List<FavouriteModel>> getFavouriteMediaListApi() async {
    try {
      dynamic response = await _apiService.getGetApiResponse(AppUrl.favourite);
      List<dynamic> responseData = response as List<dynamic>;
      List<FavouriteModel> favouriteList =
          responseData.map((data) => FavouriteModel.fromJson(data)).toList();
      print(response);
      return favouriteList;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> deleteFavouriteMediaListApi(String id) async {
    try {
      final String url = '${AppUrl.favourite}/$id';
      print(url);
      String response = await _apiService.getDeleteApiResponse(url);

      // print(response);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
