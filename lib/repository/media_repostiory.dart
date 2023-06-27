import 'package:fotos_mobile/data/network/base_api_service.dart';
import 'package:fotos_mobile/models/media_list_model.dart';

import '../data/network/network_api_service.dart';
import '../models/media_model.dart';
import '../res/app_urls.dart';

class MediaRepository {
  BaseApiService _apiService = NetworkApiService();
  Future<dynamic> createMediaApi(dynamic data) async {
    try {
      dynamic response = await _apiService.getPostApiResponse(
        AppUrl.authMediaUrl,
        data,
      );
      // print(response.toString());

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<MediaLists> getMediaListApi() async {
    try {
      dynamic response = await _apiService.getGetApiResponse(
        AppUrl.mediaListUrl,
      );

      // return response;
      return MediaLists.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
