import 'package:flutter/foundation.dart';
import 'package:fotos_mobile/data/response/api_response.dart';
import 'package:fotos_mobile/models/gernes_list_model.dart';
import 'package:fotos_mobile/repository/home_repository.dart';

import '../models/media_model.dart';

class HomeViewModel with ChangeNotifier {
  final _myRepo = HomeRepository();
  bool discoverMore = false;

  List<Map<String, dynamic>> imageList = []; // Updated type
  List<Map<String, dynamic>> newlyAddedImages = []; // Updated type
  ApiResponse<MediaModel> media = ApiResponse.loading();
  setMedia(ApiResponse<MediaModel> response) {
    media = response;
    notifyListeners();
  }

  bool isImageFavorite(bool isExistingImage, int index) {
    if (isExistingImage) {
      return imageList[index]['isFavorite'];
    } else {
      int newIndex = index - imageList.length;
      return newlyAddedImages[newIndex]['isFavorite'];
    }
  }

  Future<void> fetchMedia() async {
    setMedia(ApiResponse.loading());
    _myRepo.fetchMediaApi(1).then((value) {
      for (var i = 0; i < value.data!.length; i++) {
        final mediaItem = value.data![i];
        imageList.add({
          'imagePath': mediaItem.imagePath.toString(),
          'isFavourite': mediaItem.isFavourite,
          'slug': mediaItem.slug
        });
        // print(imageList);
      }
      setMedia(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setMedia(ApiResponse.error(error.toString()));
    });
  }

  void loadMoreData(int newPage) async {
    _myRepo.fetchMediaApi(newPage).then((value) {
      for (var i = 0; i < value.data!.length; i++) {
        final mediaItem = value.data![i];
        newlyAddedImages.add({
          'imagePath': mediaItem.imagePath.toString(),
          'isFavourite': mediaItem.isFavourite,
          'slug': mediaItem.slug
        });
      }
      discoverMore = true;
      notifyListeners();
    }).onError((error, stackTrace) {
      setMedia(ApiResponse.error(error.toString()));
    });
  }

  @override
  void dispose() {
    imageList = [];
    newlyAddedImages = [];
    super.dispose();
  }
}
