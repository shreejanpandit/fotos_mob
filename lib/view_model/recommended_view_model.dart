import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fotos_mobile/models/media_model.dart';
import 'package:fotos_mobile/repository/media_repostiory.dart';

import '../data/response/api_response.dart';
import '../repository/recomended_repository.dart';

class RecommendedViewModel with ChangeNotifier {
  final _myRepo = RecommendedRepository();

  bool showDiscoverMore = false;
  final scrollCtrl = ScrollController();
  bool isMediaDeleted = false;
  List<Map<String, dynamic>> favouriyeImageList = []; // Updated type
  ApiResponse<List<MediaData>> recommendedMedia = ApiResponse.loading();

  void setMedia(ApiResponse<List<MediaData>> response) {
    recommendedMedia = response;
    notifyListeners();
  }

  Future<void> fetchRecommendedMedia(String mediaId) async {
    setMedia(ApiResponse.loading());
    try {
      List<MediaData> recommendedMediaData =
          await _myRepo.getRecomendedMedia(mediaId.toString());
      print('reccomend vm $recommendedMediaData');
      setMedia(ApiResponse.completed(recommendedMediaData));
      notifyListeners();
    } catch (error) {
      setMedia(ApiResponse.error(error.toString()));
    }
  }
}
