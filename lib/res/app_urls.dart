// import 'dart:io';

class AppUrl {
  // static var baseUrl =
  //     Platform.isAndroid ? "http://10.0.2.2:8000/" : "http://127.0.0.1:8000/";

  // static var baseUrl = 'http://127.0.0.1:8000/api/v1/';
  // static var baseUrl = 'http://10.0.2.2:8000/api/v1/';
  static var baseUrl = 'http://192.168.18.4:8000/api/v1/';
  // static var baseUrl = 'http://192.168.0.139:8000/api/v1/';
  // static var moviesBaseUrl =
  //     'https://dea91516-1da3-444b-ad94-c6d0c4dfab81.mock.pstmn.io/';
  // static var moviesListUrl = moviesBaseUrl + 'movies_list';
  static var loginUrl = '${baseUrl}login';
  static var mediaUrl = '${baseUrl}medias';
  static var baseImageStorageUrl = 'http://192.168.18.4:8000/storage/';
  static var mediasMediaUrl = '${baseUrl}medias/';
  static var mediasMediaListUrl = '${baseUrl}media-lists/user/';
  static var userMedia = '${baseUrl}medias/user/';
  static var mediaListUrl = '${baseUrl}media-lists';
  static var favourite = '${baseUrl}users/favourite';
  static var addFavourite = '${baseUrl}users/favourite';
  static var authMediaListUrl = '${baseUrl}auth/media-lists';
  static var gernesListUrl = '${baseUrl}genres';
  static var authMediaUrl = '${baseUrl}auth/medias';
  static var registerUrl = '${baseUrl}register';
  static var user = '${baseUrl}users';
  static var profileImage = '${baseUrl}users/profile-photo';
}
