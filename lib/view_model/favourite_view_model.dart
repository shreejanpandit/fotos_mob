import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fotos_mobile/data/response/api_response.dart';
import 'package:fotos_mobile/models/favourite_model.dart';
import 'package:fotos_mobile/repository/favourite_repository.dart';
import 'package:fotos_mobile/repository/home_repository.dart';
import 'package:fotos_mobile/utils/routes/routes_name.dart';
import 'package:fotos_mobile/utils/utils.dart';
import 'package:fotos_mobile/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

import '../models/media_model.dart';

class FavouriteViewModel with ChangeNotifier {
  final _myRepo = FavouriteRepository();

  bool showDiscoverMore = false;
  final scrollCtrl = ScrollController();
  bool isMediaDeleted = false;
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

  // Future<void> deleteFavouriteMedia(
  //   String id,
  //   BuildContext context,
  //   FavouriteViewModel value,
  // ) async {
  //   try {
  //     final homeModel = Provider.of<HomeViewModel>(context, listen: false);
  //     var response = await _myRepo.deleteFavouriteMediaListApi(id);

  // if (response == 'true') {
  //   // Update favouriteMedia data to reflect the changes
  // value.favouriteMedia.data
  //     ?.removeWhere((item) => item.id.toString() == id);

  //   // Update isFavorite flag to false for the removed item
  //   for (var item in value.favouriteMedia.data!) {
  //     if (item.id.toString() == id) {
  //       item.isFavourite = false;
  //       break;
  //     }
  //   }

  //       // Remove the item from the imageList
  //       homeModel.imageList.removeWhere((item) => item['id'] == id);

  //       // Notify listeners of the changes
  //       homeModel.notifyListeners();

  //       Utils.flushBarErrorMessage(
  //         'Media removed from favourite successfully',
  //         context,
  //       );
  //     } else {
  //       Utils.flushBarErrorMessage('Error deleting data', context);
  //     }
  //   } catch (error) {
  //     Utils.flushBarErrorMessage(error.toString(), context);
  //   }
  // }

  Future<void> deleteFavouriteMedia(
    String id,
    BuildContext context,
    FavouriteViewModel value,
  ) async {
    try {
      final homeModel = Provider.of<HomeViewModel>(context, listen: false);
      var response = await _myRepo.deleteFavouriteMediaListApi(id);

      if (response == 'true') {
        // Update favouriteMedia data to reflect the changes
        value.favouriteMedia.data
            ?.removeWhere((item) => item.id.toString() == id);

        // Update isFavorite flag to false for the removed item
        for (var item in value.favouriteMedia.data!) {
          if (item.id.toString() == id) {
            item.isFavourite = false;
            break;
          }
        }

        // Update the icon color to white for the removed item in the imageList
        for (var item in homeModel.imageList) {
          if (item['id'] == id) {
            item['isFavorite'] = false;
            break;
          }
        }
        for (var item in homeModel.newlyAddedImages) {
          if (item['id'] == id) {
            item['isFavorite'] = false;
            break;
          }
        }

        // Notify listeners of the changes
        value.notifyListeners();
        homeModel.notifyListeners();

        Utils.flushBarErrorMessage(
          'Media removed from favourite successfully',
          context,
        );
      } else {
        Utils.flushBarErrorMessage('Error deleting data', context);
      }
    } catch (error) {
      Utils.flushBarErrorMessage(error.toString(), context);
    }
  }
}
