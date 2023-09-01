import 'package:flutter/material.dart';
import 'package:fotos_mobile/repository/image_open_repository.dart';

class ImageOpenViewModel with ChangeNotifier {
  final _myRepo = ImageOpenRepository();
  bool loading = false;
  Map<String, dynamic> data = {};
  String? slugData;
  String? mediaId;
  // Map<String, dynamic> get data => _data;
  // set data(Map<String, dynamic> newData) {
  //   _data = newData;
  //   notifyListeners();
  // }

  // Future<void> fetchImageOpenMedia(String slug, BuildContext context) async {
  //   setMediasMedia(ApiResponse.loading());
  //   try {
  //     final value = await _myRepo.fetchMediasMedia(slug);
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => ImageOpenScreen(),
  //       ),
  //     );
  //     print(value);
  //     setMediasMedia(ApiResponse.completed(value));
  //   } catch (error) {
  //     setMediasMedia(ApiResponse.error(error.toString()));
  //   }
  // }

  Future<void> fetchImageOpenMedia(
      String slug, BuildContext context, String mediaid) async {
    loading = true;
    mediaId = mediaid;
    print(mediaid);
    ChangeNotifier();

    try {
      slugData = slug;

      ChangeNotifier();
      final value = await _myRepo.fetchMediasMedia(slug);
      // Update status to COMPLETED
      if (value == null) {
        // print('value is null');
      } else {
        data = value;
        loading = false;
        notifyListeners();
      }
    } catch (error) {
      loading = false;
      notifyListeners();
    }
  }
}
