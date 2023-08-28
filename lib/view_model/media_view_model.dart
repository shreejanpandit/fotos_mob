import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fotos_mobile/models/media_list_model.dart';
import 'package:fotos_mobile/models/media_model.dart';
import 'package:fotos_mobile/repository/media_repostiory.dart';
import 'package:fotos_mobile/utils/utils.dart';

import '../data/response/api_response.dart';

class MediaViewModel with ChangeNotifier {
  final _myRepo = MediaRepository();
  bool _loading = false;
  bool get loading => _loading;
  bool _authLoading = false;
  bool get authLoading => _authLoading;
  String? selectedCollection;

  void setselectedCollection(String newValue) {
    selectedCollection = newValue;
    notifyListeners();
  }

  List<Map<String, dynamic>> mediaListItems = [];
  List<Map<String, dynamic>> authMediaListItems = [];
  // List<Map<String, dynamic>> authMediaListItems = [
  //   {
  //     "id": 102,
  //     "name": "test",
  //     "slug": "test",
  //     "type": "photo",
  //     "description": "sfgfn",
  //     "image_path":
  //         "1-media-collection\/6xFrhcnOIBsYfDzREppcrKx9bKmUQeIdkP0CXNzY.jpg"
  //   }
  // ];

  List<String?> ml = [];

  setloading(bool value) {
    _loading = value;
    notifyListeners();
  }

  // Future fetchMediaList() async {
  //   _loading = true;
  //   ChangeNotifier();
  //   try {
  //     final value = await _myRepo.getMediaListApi();
  //     final List<Map<String, dynamic>> newData = [];

  //     for (var i = 0; i < value.data!.length; i++) {
  //       final mediaListItem = value.data![i];
  //       final newItem = {
  //         'id': mediaListItem.id.toString(),
  //         'name': mediaListItem.name,
  //       };
  //       ml.add(mediaListItem.name);
  //       // print(ml);
  //       // Check if the item already exists in mediaListItems
  //       final existingItemIndex = mediaListItems.indexWhere((item) =>
  //           item['id'] == newItem['id'] && item['name'] == newItem['name']);

  //       if (existingItemIndex == -1) {
  //         newData.add(newItem);
  //       }
  //     }

  //     // Append new data only if mediaListItems is empty or newData is not empty
  //     if (mediaListItems.isEmpty || newData.isNotEmpty) {
  //       mediaListItems.addAll(newData);
  //     }

  //     _loading = false;
  //     notifyListeners();
  //     // print("I'm getting these items: $mediaListItems");
  //   } catch (error) {
  //     print(error.toString());
  //   }
  // }
  ApiResponse<List<MediaListData>> userMediaList = ApiResponse.loading();

  void setMediaList(ApiResponse<List<MediaListData>> response) {
    userMediaList = response;

    if (userMediaList.data != null && userMediaList.data!.isNotEmpty) {
      selectedCollection = userMediaList.data![0].id.toString();
      print(selectedCollection);
    }
    notifyListeners();
  }

  Future<void> fetchUserMediaList() async {
    setMediaList(ApiResponse.loading());
    try {
      List<MediaListData> userMediaListItem = await _myRepo.getMediaListApi();

      setMediaList(
          ApiResponse.completed(userMediaListItem.cast<MediaListData>()));
      notifyListeners();
    } catch (error) {
      setMediaList(ApiResponse.error(error.toString()));
    }
  }

  // Future fetchAuthMediaList() async {
  //   _authLoading = true;
  //   ChangeNotifier();
  //   try {
  //     final value = await _myRepo.getAuthMediaListApi();

  //     for (var i = 0; i < value.length; i++) {
  //       print(value[i].title);
  //       final authMediaListItem = value[i];

  //       // Check if the item already exists in the list
  //       bool itemExists = authMediaListItems
  //           .any((item) => item['id'] == authMediaListItem.id.toString());

  //       // If the item does not exist, add it to the list
  //       if (!itemExists) {
  //         final newItem = {
  //           'id': authMediaListItem.id.toString(),
  //           'name': authMediaListItem.title,
  //           'image_path': authMediaListItem.imagePath,
  //         };
  //         authMediaListItems.add(newItem);
  //       }
  //     }
  //     _authLoading = false;
  //     notifyListeners();
  //     // print("I'm getting these items: $authMediaListItems");
  //   } catch (error) {
  //     print(error.toString());
  //   }
  // }

  bool showDiscoverMore = false;
  final scrollCtrl = ScrollController();
  bool isMediaDeleted = false;
  List<Map<String, dynamic>> favouriyeImageList = []; // Updated type
  ApiResponse<List<MediaData>> userMedia = ApiResponse.loading();

  void setMedia(ApiResponse<List<MediaData>> response) {
    userMedia = response;
    notifyListeners();
  }

  Future<void> fetchUserMedia(String userId) async {
    setMedia(ApiResponse.loading());
    try {
      List<MediaData> userMediaList = await _myRepo.getUserMedia(userId);

      setMedia(ApiResponse.completed(userMediaList));
      notifyListeners();
    } catch (error) {
      setMedia(ApiResponse.error(error.toString()));
    }
  }

  Future<void> deleteUserMedia(
    String mediaId,
    BuildContext context,
    MediaViewModel value,
  ) async {
    try {
      // final homeModel = Provider.of<HomeViewModel>(context, listen: false);
      var response = await _myRepo.deleteUserMediaListApi(mediaId);
      print(response['message']);
      if (response['message'] == 'Updated Successfully') {
        // Update favouriteMedia data to reflect the changes
        value.userMedia.data
            ?.removeWhere((item) => item.id.toString() == mediaId);

        // // Notify listeners of the changes
        value.notifyListeners();

        // Utils.flushBarErrorMessage(
        //   'User media deleted successfully',
        //   context,
        // );
      } else {
        // Utils.flushBarErrorMessage('Error deleting data', context);
      }
    } catch (error) {
      // Utils.flushBarErrorMessage(error.toString(), context);
    }
  }

  Future<String> createMedia(dynamic data, BuildContext context) async {
    setloading(true);
    try {
      var res = await _myRepo.createMediaApi(data);

      if (res != null) {
        var result = res as Map<String, dynamic>;
        print(res);
        return 'success';
        // if (result.containsKey('message')) {
        //   var message = result['message'];
        //   var errors = result['errors'] as Map<String, dynamic>;

        //   if (errors.containsKey('email')) {
        //     setloading(false);
        //     Utils.flushBarErrorMessage(message.toString(), context);
        //   }
      }
      // else {
      //   setloading(false);
      //   return 'success';
      // }
      return '';
    } catch (error) {
      setloading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    }

    // Return a default value if needed or remove this line if unnecessary
    return '';
  }
}
