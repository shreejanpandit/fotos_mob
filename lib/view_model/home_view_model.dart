import 'package:flutter/material.dart';
import 'package:fotos_mobile/data/response/api_response.dart';
import 'package:fotos_mobile/repository/home_repository.dart';

import '../models/media_model.dart';

class HomeViewModel with ChangeNotifier {
  final _myRepo = HomeRepository();
  bool showDiscoverMore = false;
  final scrollCtrl = ScrollController();

  List<Map<String, dynamic>> imageList = []; // Updated type
  List<Map<String, dynamic>> newlyAddedImages = []; // Updated type
  ApiResponse<MediaModel> media = ApiResponse.loading();

  void setMedia(ApiResponse<MediaModel> response) {
    media = response;
    notifyListeners();
  }

  // bool isImageFavorite(bool isExistingImage, int index) {
  //   if (isExistingImage) {
  //     return imageList[index]['isFavorite'];
  //   } else {
  //     int newIndex = index - imageList.length;
  //     return newlyAddedImages[newIndex]['isFavorite'];
  //   }
  // }

  int currentPage = 1; // Track the current page number

  Future<void> fetchMedia() async {
    setMedia(ApiResponse.loading());
    _myRepo.fetchMediaApi(1).then((value) {
      for (var i = 0; i < value.data!.length; i++) {
        final mediaItem = value.data![i];
        imageList.add({
          'id': mediaItem.id.toString(),
          'imagePath': mediaItem.imagePath.toString(),
          'isFavorite': mediaItem.isFavourite,
          'slug': mediaItem.slug
        });
      }

      setMedia(ApiResponse.completed(value));
      showDiscoverMore = true; // Set showDiscoverMore to true
      notifyListeners();
    }).onError((error, stackTrace) {
      setMedia(ApiResponse.error(error.toString()));
    });
  }

  void loadMoreData(int newPage) async {
    _myRepo.fetchMediaApi(newPage).then((value) {
      for (var i = 0; i < value.data!.length; i++) {
        final mediaItem = value.data![i];
        newlyAddedImages.add({
          'id': mediaItem.id.toString(),
          'imagePath': mediaItem.imagePath.toString(),
          'isFavorite': mediaItem.isFavourite,
          'slug': mediaItem.slug
        });
      }

      currentPage = newPage;
      showDiscoverMore = true; // Set showDiscoverMore to true
      notifyListeners();
    }).onError((error, stackTrace) {
      setMedia(ApiResponse.error(error.toString()));
    });
  }

  void _scrollListener() {
    if (scrollCtrl.position.pixels == scrollCtrl.position.maxScrollExtent) {
      // Reached the end of the scrollable content
      if (!showDiscoverMore) {
        int nextPage = currentPage + 1;
        loadMoreData(nextPage);
      }
    } else {
      // Hide the "Discover More" container when scrolling
      if (showDiscoverMore) {
        showDiscoverMore = false;
        notifyListeners();
      }
    }
  }

  @override
  void dispose() {
    scrollCtrl.removeListener(_scrollListener);
    scrollCtrl.dispose();
    imageList = [];
    newlyAddedImages = [];
    super.dispose();
  }

  HomeViewModel() {
    scrollCtrl.addListener(_scrollListener);
  }
}
