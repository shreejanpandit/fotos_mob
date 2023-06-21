// import 'dart:io';

import 'dart:io';

class AppUrl {
  // static var baseUrl =
  //     Platform.isAndroid ? "http://10.0.2.2:8000/" : "http://127.0.0.1:8000/";

  static var baseUrl = 'http://localhost:8000/api/v1/';
  static var moviesBaseUrl =
      'https://dea91516-1da3-444b-ad94-c6d0c4dfab81.mock.pstmn.io/';
  // static var moviesListUrl = moviesBaseUrl + 'movies_list';
  static var loginUrl = '${baseUrl}login';
  static var mediaUrl = '${baseUrl}media';
  static var registerUrl = '${baseUrl}register';
}
