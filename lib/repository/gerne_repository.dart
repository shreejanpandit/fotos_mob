import 'package:fotos_mobile/data/network/base_api_service.dart';
import 'package:fotos_mobile/data/network/network_api_service.dart';
import 'package:fotos_mobile/models/gernes_list_model.dart';
import 'package:fotos_mobile/models/media_model.dart';
import 'package:fotos_mobile/res/app_urls.dart';

class GerneRepository {
  final BaseApiService _apiService = NetworkApiService();

  Future<dynamic> fetchGernesApi() async {
    try {
      // print('${AppUrl.gernesListUrl}');
      dynamic response =
          await _apiService.getGetApiResponse('${AppUrl.gernesListUrl}');
      // dynamic response = await _apiService.getGetApiResponse(AppUrl.mediaUrl);
      // print(response);
      // return GernesListModel.fromJson(response);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
