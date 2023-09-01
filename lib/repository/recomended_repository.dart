import 'package:fotos_mobile/data/network/base_api_service.dart';
import 'package:fotos_mobile/models/media_list_model.dart';

import '../data/network/network_api_service.dart';
import '../models/media_model.dart';
import '../res/app_urls.dart';

class RecommendedRepository {
  final BaseApiService _apiService = NetworkApiService();

  Future<List<MediaData>> getRecomendedMedia(String mediaId) async {
    try {
      dynamic response =
          await _apiService.getGetApiResponse('${AppUrl.recommended}$mediaId');
      // Map<String,dynamic> responseData = response ;
      List<MediaData> mediaList = (response['data'] as List)
          .map((data) => MediaData.fromJson(data))
          .toList();
      print(
          'recommended media repo media data media map result is : ${mediaList}');
      return mediaList;
      // print('user media data media created by this user? $response');
      // return favouriteList;
    } catch (e) {
      rethrow;
    }
  }
}
