import 'package:flutter/material.dart';
import 'package:fotos_mobile/data/response/api_response.dart';
import 'package:fotos_mobile/models/favourite_model.dart';
import 'package:fotos_mobile/repository/favourite_repository.dart';
import 'package:fotos_mobile/utils/utils.dart';
import 'package:fotos_mobile/view_model/home_view_model.dart';
import 'package:fotos_mobile/view_model/media_view_model.dart';
import 'package:provider/provider.dart';

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

      setMedia(ApiResponse.completed(favouriteList));
      notifyListeners();
    } catch (error) {
      setMedia(ApiResponse.error(error.toString()));
    }
  }

  Future<void> addFavouriteMedia(
    String mediaId,
    BuildContext context,
    FavouriteViewModel value,
  ) async {
    try {
      final homeModel = Provider.of<HomeViewModel>(context, listen: false);
      final userMediaViewModel =
          Provider.of<MediaViewModel>(context, listen: false);
      print('media id is $mediaId');
      var response = await _myRepo.addFavouriteMediaApi(mediaId);
      if (response) {
        // Update favouriteMedia data to reflect the changes
        // value.favouriteMedia.data
        //     ?.removeWhere((item) => item.id.toString() == mediaId);

        // Update isFavorite flag to false for the removed item
        for (var item in value.favouriteMedia.data!) {
          if (item.id.toString() == mediaId) {
            item.isFavourite = true;
            break;
          }
        }

        for (var item in userMediaViewModel.userMedia.data!) {
          if (item.id.toString() == mediaId) {
            item.isFavourite = true;
            break;
          }
        }
        // Update the icon color to white for the removed item in the imageList
        for (var item in homeModel.imageList) {
          if (item['id'] == mediaId) {
            item['isFavorite'] = true;
            break;
          }
        }
        for (var item in homeModel.newlyAddedImages) {
          if (item['id'] == mediaId) {
            item['isFavorite'] = true;
            break;
          }
        }

        // Notify listeners of the changes
        value.notifyListeners();
        homeModel.notifyListeners();
        userMediaViewModel.notifyListeners();

        Utils.flushBarSucessMessage(
          'Media added to favourite successfully',
          context,
        );
      } else {
        Utils.flushBarErrorMessage('Error adding data', context);
      }
    } catch (error) {
      Utils.flushBarErrorMessage(error.toString(), context);
      // Utils.flushBarErrorMessage(
      //     "Login firts to add item in favourite", context);
      // print(error.toString());
    }
  }

  Future<void> deleteFavouriteMedia(
    String id,
    BuildContext context,
    FavouriteViewModel value,
  ) async {
    try {
      final homeModel = Provider.of<HomeViewModel>(context, listen: false);
      var response = await _myRepo.deleteFavouriteMediaListApi(id);
      print('response from favourite view modwl is $response');
      final userMediaViewModel =
          Provider.of<MediaViewModel>(context, listen: false);
      if (response == true) {
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

        // Update isFavorite flag to false for the removed item in userMediaViewModel
        for (var item in userMediaViewModel.userMedia.data!) {
          if (item.id.toString() == id) {
            item.isFavourite = false;
            break;
          }
        }

        // Update the isFavorite flag to false for the removed item in homeModel.imageList
        for (var item in homeModel.imageList) {
          if (item['id'] == id) {
            item['isFavorite'] = false;
            break;
          }
        }
        // Update the isFavorite flag to false for the removed item in homeModel.newlyAddedImages
        for (var item in homeModel.newlyAddedImages) {
          if (item['id'] == id) {
            item['isFavorite'] = false;
            break;
          }
        }

        // Notify listeners of the changes
        value.notifyListeners();
        homeModel.notifyListeners();
        userMediaViewModel.notifyListeners();

        Utils.flushBarErrorMessage(
          'Media removed from favourite successfully',
          context,
        );

        print('yes');
      } else {
        Utils.flushBarErrorMessage('Error deleting data', context);
      }
    } catch (error) {
      Utils.flushBarErrorMessage(error.toString(), context);
    }
  }
}
