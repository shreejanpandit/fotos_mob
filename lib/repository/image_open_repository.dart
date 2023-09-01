import 'package:fotos_mobile/data/network/base_api_service.dart';
import 'package:fotos_mobile/data/network/network_api_service.dart';
import 'package:fotos_mobile/res/app_urls.dart';

class ImageOpenRepository {
  final BaseApiService _apiService = NetworkApiService();

  Future fetchMediasMedia(String slug) async {
    try {
      // print('${AppUrl.mediasMediaUrl}${slug}');
      dynamic response =
          await _apiService.getGetApiResponse('${AppUrl.mediasMediaUrl}$slug');
      // dynamic response = await _apiService.getGetApiResponse(AppUrl.mediaUrl);
      // print(response);
      // return ImageOpenModel.fromJson(response);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future postReview(dynamic data) async {
    try {
      print('this is review post submiting data$data');
      dynamic response =
          await _apiService.getPostApiResponse(AppUrl.reviews, data);
      // dynamic response = await _apiService.getGetApiResponse(AppUrl.mediaUrl);
      print('response from postreviewRepo is $response');
      // return ImageOpenModel.fromJson(response);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future postComment(dynamic data) async {
    try {
      print('this is comment post submiting data$data');
      dynamic response =
          await _apiService.getPostApiResponse(AppUrl.comments, data);
      // dynamic response = await _apiService.getGetApiResponse(AppUrl.mediaUrl);
      print('response from postcommentRepo is $response');
      // return ImageOpenModel.fromJson(response);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
