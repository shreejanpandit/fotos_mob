import 'package:fotos_mobile/data/network/base_api_service.dart';
import 'package:fotos_mobile/data/network/network_api_service.dart';
import 'package:fotos_mobile/models/movies_model.dart';
import 'package:fotos_mobile/res/app_urls.dart';

class HomeRepository {
  BaseApiService _apiService = NetworkApiService();

  Future<MovieListModel> fetchMoviesListApi() async {
    try {
      dynamic response =
          await _apiService.getGetApiResponse(AppUrl.moviesListUrl);

      return MovieListModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}
