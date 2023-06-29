import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fotos_mobile/repository/media_repostiory.dart';
import 'package:fotos_mobile/utils/utils.dart';

class MediaViewModel with ChangeNotifier {
  final _myRepo = MediaRepository();
  bool _loading = false;
  bool get loading => _loading;
  String? selectedCollection = "1";

  void setselectedCollection(String newValue) {
    selectedCollection = newValue;
    notifyListeners();
  }

  List<Map<String, dynamic>> mediaListItems = [];

  List<String?> ml = [];

  setloading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future fetchMediaList() async {
    _loading = true;
    ChangeNotifier();
    try {
      final value = await _myRepo.getMediaListApi();
      final List<Map<String, dynamic>> newData = [];

      for (var i = 0; i < value.data!.length; i++) {
        final mediaListItem = value.data![i];
        final newItem = {
          'id': mediaListItem.id.toString(),
          'name': mediaListItem.name,
        };
        ml.add(mediaListItem.name);
        // print(ml);
        // Check if the item already exists in mediaListItems
        final existingItemIndex = mediaListItems.indexWhere((item) =>
            item['id'] == newItem['id'] && item['name'] == newItem['name']);

        if (existingItemIndex == -1) {
          newData.add(newItem);
        }
      }

      // Append new data only if mediaListItems is empty or newData is not empty
      if (mediaListItems.isEmpty || newData.isNotEmpty) {
        mediaListItems.addAll(newData);
      }

      _loading = false;
      notifyListeners();
      print("I'm getting these items: $mediaListItems");
    } catch (error) {
      print(error.toString());
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
