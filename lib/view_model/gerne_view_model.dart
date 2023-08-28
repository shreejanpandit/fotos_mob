import 'package:flutter/material.dart';
import 'package:fotos_mobile/repository/gerne_repository.dart';

import '../data/response/api_response.dart';
import '../models/gernes_list_model.dart';

class GenersViewModel with ChangeNotifier {
  final _myRepo = GerneRepository();
  List geners = [];
  ApiResponse<List<GernesListModel>> gerne = ApiResponse.loading();
  setGerne(ApiResponse<List<GernesListModel>> response) {
    gerne = response;
    notifyListeners();
  }

  Future<void> fetchGernes() async {
    setGerne(ApiResponse.loading());
    _myRepo.fetchGernesApi().then((value) {
      for (var gerneModel in value) {
        geners.add(gerneModel.name);
      }

      setGerne(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setGerne(ApiResponse.error(error.toString()));
    });
  }
}


//class GenersViewModel with ChangeNotifier {
//   final _myRepo = GerneRepository();
//   List<String> geners = [];
//   ApiResponse<GernesListModel> gerne = ApiResponse.loading();

//   void setGerne(ApiResponse<GernesListModel> response) {
//     gerne = response;
//     notifyListeners();
//   }

//   Future<void> fetchGernes() async {
//     setGerne(ApiResponse.loading());

//     try {
//       final response = await _myRepo.fetchGernesApi();
//       geners = response.gernes.map((genre) => genre.name).toList();
//       setGerne(ApiResponse.completed(response));
//     } catch (error) {
//       setGerne(ApiResponse.error(error.toString()));
//     }
//   }
// }

