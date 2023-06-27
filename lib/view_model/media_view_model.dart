import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fotos_mobile/models/media_list_model.dart';
import 'package:fotos_mobile/models/media_model.dart';
import 'package:fotos_mobile/repository/media_repostiory.dart';
import 'package:fotos_mobile/utils/utils.dart';

import '../data/response/api_response.dart';

class MediaViewModel with ChangeNotifier {
  String _selectedCollection = "Nature's Symphony";
  final _myRepo = MediaRepository();
  bool _loading = false;
  bool get loading => _loading;
  String get selectedCollection => _selectedCollection;
  ApiResponse<MediaLists> mediaList = ApiResponse.loading();
  set selectedCollection(String newValue) {
    _selectedCollection = newValue;
    notifyListeners();
  }

  List<Map<String, dynamic>> mediaListItems = [];
  List<String?> ml = [];

  setloading(bool value) {
    _loading = value;
    notifyListeners();
  }

  setMediaList(ApiResponse<MediaLists> response) {
    mediaList = response;
    notifyListeners();
  }

  Future<void> fetchMediaList() async {
    setMediaList(ApiResponse.loading());
    _myRepo.getMediaListApi().then((value) {
      for (var i = 0; i < value.data!.length; i++) {
        final mediaListItem = value.data![i];
        mediaListItems.add({
          'id': mediaListItem.id,
          'name': mediaListItem.name,
        });
        ml.add(mediaListItem.name);
      }
      // notifyListeners();

      print(mediaListItems);
      setMediaList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setMediaList(ApiResponse.error(error.toString()));
    });
  }

  Future<String> createMedia(dynamic data, BuildContext context) async {
    setloading(true);
    try {
      var res = await _myRepo.createMediaApi(data);

      if (res != null) {
        var result = res as Map<String, dynamic>;

        if (result.containsKey('message')) {
          var message = result['message'];
          var errors = result['errors'] as Map<String, dynamic>;

          if (errors.containsKey('email')) {
            setloading(false);
            Utils.flushBarErrorMessage(message.toString(), context);
          }
        } else {
          setloading(false);
          return Future.value('success');
        }
      }
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
