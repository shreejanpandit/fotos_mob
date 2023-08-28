import 'package:fotos_mobile/data/network/base_api_service.dart';
import 'package:fotos_mobile/data/network/network_api_service.dart';
import 'package:fotos_mobile/models/gernes_list_model.dart';
import 'package:fotos_mobile/res/app_urls.dart';

class GerneRepository {
  final BaseApiService _apiService = NetworkApiService();

  Future<List<GernesListModel>> fetchGernesApi() async {
    try {
      // print('${AppUrl.gernesListUrl}');
      dynamic response =
          await _apiService.getGetApiResponse(AppUrl.gernesListUrl);
      List<dynamic> gerneListData = response;
      // print(response);
      // return GernesListModel.fromJson(response);
      // print(response);
      // print('cccccccccccccccccccccccccccccccccccc');
      // print(
      //     '${gerneListData.map((data) => GernesListModel.fromJson(data)).toList()}');
      return gerneListData
          .map((data) => GernesListModel.fromJson(data))
          .toList();
      // return response;
    } catch (e) {
      rethrow;
    }
  }
}
