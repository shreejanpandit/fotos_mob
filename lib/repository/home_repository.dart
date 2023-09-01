import 'package:fotos_mobile/data/network/base_api_service.dart';
import 'package:fotos_mobile/data/network/network_api_service.dart';
import 'package:fotos_mobile/models/media_model.dart';
import 'package:fotos_mobile/res/app_urls.dart';

class HomeRepository {
  final BaseApiService _apiService = NetworkApiService();

  Future<List<MediaData>> fetchMediaApi(int page) async {
    // Future<dynamic> fetchMediaListApi() async {
    try {
      print(AppUrl.mediaUrl);
      dynamic response =
          await _apiService.getGetApiResponse('${AppUrl.mediaUrl}?page=$page');
      // dynamic response = await _apiService.getGetApiResponse(AppUrl.mediaUrl);
      // print('home repo response upto here is : $response');
      // return MediaData.fromJson(response);
      // return response.body;
      List<MediaData> mediaList = (response['data'] as List)
          .map((data) => MediaData.fromJson(data))
          .toList();
      print('media repo media data media map result is : ${mediaList}');
      return mediaList;
    } catch (e) {
      rethrow;
    }
  }

  // Future<GernesListModel> fetchGernesApi() async {
  //   try {
  //     print('${AppUrl.gernesListUrl}');
  //     dynamic response =
  //         await _apiService.getGetApiResponse('${AppUrl.gernesListUrl}');
  //     // dynamic response = await _apiService.getGetApiResponse(AppUrl.mediaUrl);
  //     print(response);
  //     return GernesListModel.fromJson(response);
  //     // return response.body;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
}
