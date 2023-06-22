import 'package:flutter/foundation.dart';
import 'package:fotos_mobile/data/response/api_response.dart';
import 'package:fotos_mobile/models/media_list_model.dart';
import 'package:fotos_mobile/models/movies_model.dart';
import 'package:fotos_mobile/repository/home_repository.dart';

import '../data/response/status.dart';
import '../models/media_model.dart';

class HomeViewModel with ChangeNotifier {
  final _myRepo = HomeRepository();
  // ApiResponse<dynamic> mediaList = ApiResponse.loading();
  ApiResponse<MediaModel> media = ApiResponse.loading();
  List<String> imageList = [];
  List<String> newlyAddedImages = [];

  void updateNewlyAddedImages(List<String> images) {
    newlyAddedImages.addAll(images);
    notifyListeners();
  }

  setMedia(ApiResponse<MediaModel> response) {
    media = response;
    notifyListeners();
  }

  // Future<void> fetchMedia() async {
  //   setMedia(ApiResponse.loading());
  //   _myRepo.fetchMediaApi(1).then((value) {
  //     for (var i = 0; i < value.data!.length; i++) {
  //       imageList.add(value.data![i].imagePath.toString());
  //     }
  //     notifyListeners();
  //     setMedia(ApiResponse.completed(value));
  //   }).onError((error, stackTrace) {
  //     setMedia(ApiResponse.error(error.toString()));
  //   });
  // }
  void setNewlyAddedImages(List<String> images) {
    newlyAddedImages = images;
    notifyListeners();
  }

  Future<void> fetchMedia() async {
    setMedia(ApiResponse.loading());
    _myRepo.fetchMediaApi(1).then((value) {
      for (var i = 0; i < value.data!.length; i++) {
        imageList.add(value.data![i].imagePath.toString());
        newlyAddedImages.add(value.data![i].imagePath.toString());
      }
      // Assign the fetched newly added images
      setMedia(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setMedia(ApiResponse.error(error.toString()));
    });
  }

  void loadMoreData(int newPage) async {
    _myRepo.fetchMediaApi(newPage).then((value) {
      for (var i = 0; i < value.data!.length; i++) {
        newlyAddedImages.add(value.data![i].imagePath.toString());
      }
      imageList.addAll(newlyAddedImages);
      notifyListeners();
    }).onError((error, stackTrace) {
      setMedia(ApiResponse.error(error.toString()));
    });
  }

  // void loadMoreData(int newPage) async {
  //   setMedia(ApiResponse.loading());
  //   _myRepo.fetchMediaApi(newPage).then((value) {
  //     for (var i = 0; i < value.data!.length; i++) {
  //       imageList.add(value.data![i].imagePath.toString());
  //     }
  //     setMedia(ApiResponse.completed(value));
  //   }).onError((error, stackTrace) {
  //     setMedia(ApiResponse.error(error.toString()));
  //   });
  // }
}
