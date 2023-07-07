import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:fotos_mobile/models/user_models.dart';
import 'package:fotos_mobile/repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/response/api_response.dart';

class UserViewModel with ChangeNotifier {
  UserModel? _currentUser;

  Future<bool> saveUser(String accessToken, User user) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', accessToken);
    // sp.setInt('userId', user.id);
    sp.setString('user', json.encode(user.toJson()));
    _currentUser = UserModel(accessToken: accessToken, user: user);
    notifyListeners();
    return true;
  }

  Future<UserModel> getUser() async {
    if (_currentUser != null) {
      return _currentUser!;
    }

    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString("token");
    // final int? userId = sp.getInt("userId");
    final String? userString = sp.getString("user");

    User? user;
    if (userString != null) {
      final Map<String, dynamic> userJson = json.decode(userString);
      user = User.fromJson(userJson);
    }

    _currentUser = UserModel(accessToken: token.toString(), user: user);
    return _currentUser!;
  }

  Future<bool> removeUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('token');
    _currentUser = null;
    notifyListeners();
    return true;
  }

  List<Map<String, dynamic>> favouriyeImageList = []; // Updated type
  ApiResponse<User> userData = ApiResponse.loading();
  final _myRepo = AuthRepository();

  void setMedia(ApiResponse<User> response) {
    userData = response;
    notifyListeners();
  }

  Future<void> fetchUserData() async {
    setMedia(ApiResponse.loading());
    try {
      User userMediaList = await _myRepo.getUserData();
      print(userMediaList.id.toString());
      setMedia(ApiResponse.completed(userMediaList));
      notifyListeners();
    } catch (error) {
      setMedia(ApiResponse.error(error.toString()));
    }
  }
}
