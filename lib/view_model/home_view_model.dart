import 'package:flutter/foundation.dart';
import 'package:fotos_mobile/data/response/api_response.dart';
import 'package:fotos_mobile/models/movies_model.dart';
import 'package:fotos_mobile/repository/home_repository.dart';

class HomeViewModel with ChangeNotifier {
  final _myRepo = HomeRepository();
  ApiResponse<MovieListModel> moviesList = ApiResponse.loading();
  setMoviesList(ApiResponse<MovieListModel> response) {
    moviesList = response;
    notifyListeners();
  }

  Future<void> fetchMoviesListApi() async {
    setMoviesList(ApiResponse.loading());
    _myRepo.fetchMoviesListApi().then((value) {
      setMoviesList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setMoviesList(ApiResponse.error(error.toString()));
    });
  }
}
