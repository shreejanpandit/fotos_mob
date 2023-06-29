// import 'package:flutter/material.dart';
// import 'package:fotos_mobile/repository/image_open_repository.dart';

// import '../data/response/api_response.dart';
// import '../models/image_open_model.dart';
// import '../view/home/image_open_screen.dart';

// class ImageOpenViewModel with ChangeNotifier {
//   final _myRepo = ImageOpenRepository();
//   ApiResponse<ImageOpenModel> mediasMedia = ApiResponse.loading();
//   setMediasMedia(ApiResponse<ImageOpenModel> response) {
//     mediasMedia = response;
//     notifyListeners();
//   }

//   Future<void> fetchImageOpenMedia(String slug, BuildContext context) async {
//     setMediasMedia(ApiResponse.loading());
//     await _myRepo.fetchMediasMedia(slug).then((value) {
//       setMediasMedia(ApiResponse.completed(value));
//       print(value);
//       Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => ImageOpenScreen(),
//           ));
//     }).onError((error, stackTrace) {
//       setMediasMedia(ApiResponse.error(error.toString()));
//     });
//   }
// }

import 'package:flutter/material.dart';
import 'package:fotos_mobile/repository/image_open_repository.dart';

class ImageOpenViewModel with ChangeNotifier {
  final _myRepo = ImageOpenRepository();
  bool loading = false;
  Map<String, dynamic> data = {};
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

  Future<void> fetchImageOpenMedia(String slug, BuildContext context) async {
    loading = true;
    ChangeNotifier();

    try {
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
