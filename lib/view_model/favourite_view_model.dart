import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fotos_mobile/data/response/api_response.dart';
import 'package:fotos_mobile/models/favourite_model.dart';
import 'package:fotos_mobile/repository/favourite_repository.dart';
import 'package:fotos_mobile/repository/home_repository.dart';

import '../models/media_model.dart';

class FavouriteViewModel with ChangeNotifier {
  final _myRepo = FavouriteRepository();
  bool showDiscoverMore = false;
  final scrollCtrl = ScrollController();

  List<Map<String, dynamic>> favouriyeImageList = []; // Updated type
  ApiResponse<List<FavouriteModel>> favouriteMedia = ApiResponse.loading();

  void setMedia(ApiResponse<List<FavouriteModel>> response) {
    favouriteMedia = response;
    notifyListeners();
  }

  Future<void> fetchFavouriteMedia() async {
    setMedia(ApiResponse.loading());
    try {
      List<FavouriteModel> favouriteList =
          await _myRepo.getFavouriteMediaListApi();
      // List<Map<String, dynamic>> favouriteImageList = favouriteList
      //     .map((favouriteModel) => {
      //           'id': favouriteModel.id,
      //           'title': favouriteModel.title,
      //           'slug': favouriteModel.slug,
      //           'description': favouriteModel.description,
      //           'image_path': favouriteModel.imagePath,
      //           'is_favourite': favouriteModel.isFavourite,
      //         })
      //     .toList();

      setMedia(ApiResponse.completed(favouriteList));
      notifyListeners();
    } catch (error) {
      setMedia(ApiResponse.error(error.toString()));
    }
  }
}
