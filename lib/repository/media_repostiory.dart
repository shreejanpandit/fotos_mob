import 'package:fotos_mobile/data/network/base_api_service.dart';
import 'package:fotos_mobile/models/media_list_model.dart';

import '../data/network/network_api_service.dart';
import '../models/media_model.dart';
import '../res/app_urls.dart';

class MediaRepository {
  final BaseApiService _apiService = NetworkApiService();
  Future<dynamic> createMediaApi(dynamic data) async {
    try {
      dynamic response = await _apiService.getPostApiResponse(
        AppUrl.authMediaUrl,
        data,
      );
      print(response.toString());

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<MediaListData>> getMediaListApi() async {
    try {
      dynamic response =
          await _apiService.getGetApiResponse(AppUrl.authMediaListUrl);
      // List<dynamic> responseData = response as List<dynamic>;
      // print(responseData);
      // List<MediaData> mediaList =
      //     responseData.map((data) => MediaData.fromJson(data)).toList();
      // print('user media data media created by this user? $response');
      // return mediaList;

      List<MediaListData> mediaList = (response['data'] as List)
          .map((data) => MediaListData.fromJson(data))
          .toList();
      print('media list repo media data media map result is : ${mediaList}');
      return mediaList;
    } catch (e) {
      rethrow;
    }
  }
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

  Future<List<MediaData>> getAuthMediaListApi() async {
    try {
      dynamic response =
          await _apiService.getGetApiResponse(AppUrl.authMediaListUrl);
      print('auth media list is $response');
      List<dynamic> mediaListData =
          response; // Assuming response is the list of media objects
      return mediaListData.map((data) => MediaData.fromJson(data)).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<MediaData>> getUserMedia(String userId) async {
    try {
      print('${AppUrl.userMedia}$userId');
      dynamic response =
          await _apiService.getGetApiResponse('${AppUrl.userMedia}$userId');
      // Map<String,dynamic> responseData = response ;
      List<MediaData> mediaList = (response['data'] as List)
          .map((data) => MediaData.fromJson(data))
          .toList();
      print('media repo media data media map result is : ${mediaList}');
      return mediaList;
      // print('user media data media created by this user? $response');
      // return favouriteList;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> deleteUserMediaListApi(String mediaId) async {
    try {
      final String url = '${AppUrl.authMediaUrl}/$mediaId';
      print(url);
      var response = await _apiService.getDeleteApiResponse(url);

      print('delete media response is $response');
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
