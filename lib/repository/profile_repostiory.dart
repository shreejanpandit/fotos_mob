import 'package:fotos_mobile/data/network/base_api_service.dart';
import 'package:fotos_mobile/models/media_list_model.dart';

import '../data/network/network_api_service.dart';
import '../models/media_model.dart';
import '../res/app_urls.dart';

class ProfileRepository {
  final BaseApiService _apiService = NetworkApiService();
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

  // Future<List<MediaList>> getMediaListApi() async {
  //   try {
  //     dynamic response =
  //         await _apiService.getGetApiResponse(AppUrl.authMediaListUrl);
  //     List<dynamic> responseData = response as List<dynamic>;
  //     print(responseData);
  //     List<MediaList> mediaList =
  //         responseData.map((data) => MediaList.fromJson(data)).toList();
  //     // print('user media data media created by this user? $response');
  //     return mediaList;
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

  // Future<List<MediaList>> getAuthMediaListApi() async {
  //   try {
  //     dynamic response =
  //         await _apiService.getGetApiResponse(AppUrl.authMediaListUrl);
  //     print('auth media list is $response');
  //     List<dynamic> mediaListData =
  //         response; // Assuming response is the list of media objects
  //     return mediaListData.map((data) => MediaList.fromJson(data)).toList();
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // Future<List<MediaData>> getUserMedia(String userId) async {
  //   try {
  //     print('${AppUrl.userMedia}$userId');
  //     dynamic response =
  //         await _apiService.getGetApiResponse('${AppUrl.userMedia}$userId');
  //     List<dynamic> responseData = response as List<dynamic>;
  //     List<MediaData> favouriteList =
  //         responseData.map((data) => MediaData.fromJson(data)).toList();
  //     // print('user media data media created by this user? $response');
  //     return favouriteList;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  Future<dynamic> updateApi(dynamic data, String id) async {
    try {
      print('${AppUrl.user}/$id');
      dynamic response =
          await _apiService.getPatchApiResponse('${AppUrl.user}/$id', data);
      print(response.toString());
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> deleteUserProfileApi() async {
    try {
      final String url = '${AppUrl.profileImage}';
      // print(url);
      dynamic response = await _apiService.getDeleteApiResponse(url);

      // print('response in repo of delete profile ${response} ');
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
