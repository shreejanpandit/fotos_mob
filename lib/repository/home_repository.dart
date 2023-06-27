import 'package:fotos_mobile/data/network/base_api_service.dart';
import 'package:fotos_mobile/data/network/network_api_service.dart';
import 'package:fotos_mobile/models/media_model.dart';
import 'package:fotos_mobile/res/app_urls.dart';

class HomeRepository {
  final BaseApiService _apiService = NetworkApiService();

  Future<MediaModel> fetchMediaApi(int page) async {
    // Future<dynamic> fetchMediaListApi() async {
    try {
      print('${AppUrl.mediaUrl}');
      dynamic response =
          await _apiService.getGetApiResponse('${AppUrl.mediaUrl}?page=$page');
      // dynamic response = await _apiService.getGetApiResponse(AppUrl.mediaUrl);
      // print(response);
      return MediaModel.fromJson(response);
      // return response.body;
    } catch (e) {
      rethrow;
    }
  }
}
