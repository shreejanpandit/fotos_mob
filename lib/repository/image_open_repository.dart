import 'package:fotos_mobile/data/network/base_api_service.dart';
import 'package:fotos_mobile/data/network/network_api_service.dart';
import 'package:fotos_mobile/models/image_open_model.dart';
import 'package:fotos_mobile/res/app_urls.dart';

class ImageOpenRepository {
  final BaseApiService _apiService = NetworkApiService();

  Future fetchMediasMedia(String slug) async {
    try {
      print('${AppUrl.mediasMediaUrl}${slug}');
      dynamic response = await _apiService
          .getGetApiResponse('${AppUrl.mediasMediaUrl}${slug}');
      // dynamic response = await _apiService.getGetApiResponse(AppUrl.mediaUrl);
      // print(response);
      // return ImageOpenModel.fromJson(response);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
