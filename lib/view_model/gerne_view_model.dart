import 'package:flutter/material.dart';
import 'package:fotos_mobile/repository/gerne_repository.dart';

import '../data/response/api_response.dart';
import '../models/gernes_list_model.dart';

class GenersViewModel with ChangeNotifier {
  final _myRepo = GerneRepository();
  List geners = [];
  ApiResponse<GernesListModel> gerne = ApiResponse.loading();
  setGerne(ApiResponse<GernesListModel> response) {
    gerne = response;
    notifyListeners();
  }

  Future<void> fetchGernes() async {
    setGerne(ApiResponse.loading());
    _myRepo.fetchGernesApi().then((value) {
      geners = value.map((genre) => genre["name"] as String).toList();
      setGerne(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setGerne(ApiResponse.error(error.toString()));
    });
  }
}
