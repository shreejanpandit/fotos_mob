import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fotos_mobile/models/user_models.dart';
import 'package:fotos_mobile/repository/auth_repository.dart';
import 'package:fotos_mobile/repository/profile_repostiory.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/response/api_response.dart';

class UserViewModel with ChangeNotifier {
  UserModel? _currentUser;
  UserModel? get currentUser => _currentUser;

  Future<bool> saveUser(String accessToken, User user) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', accessToken);
    sp.setString('user', json.encode(user.toJson()));

    _currentUser = UserModel(data: Data(user: user, accessToken: accessToken));
    notifyListeners();
    return true;
  }

  Future<UserModel> getUser() async {
    if (_currentUser != null) {
      return _currentUser!;
    }

    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString("token");
    final String? userString = sp.getString("user");

    User? user;
    if (userString != null) {
      final Map<String, dynamic> userJson = json.decode(userString);

      user = User.fromJson(userJson);
      print(userJson);
    }

    _currentUser =
        UserModel(data: Data(user: user, accessToken: token.toString()));
    notifyListeners();
    return _currentUser!;
  }

  Future<bool> removeUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('token');
    _currentUser = null;
    notifyListeners();
    return true;
  }

  Future<bool> removeProfileImage() async {
    if (_currentUser != null) {
      _currentUser!.data!.user!.profile_photo_path = null;
      final SharedPreferences sp = await SharedPreferences.getInstance();
      sp.setString('user', json.encode(_currentUser!.data!.user!.toJson()));
      notifyListeners();
      return true;
    }
    return false;
  }

  Future<bool> changeProfileImage(String img) async {
    if (_currentUser != null) {
      _currentUser!.data!.user!.profile_photo_path = img;
      final SharedPreferences sp = await SharedPreferences.getInstance();
      sp.setString('user', json.encode(_currentUser!.data!.user!.toJson()));
      notifyListeners();
      return true;
    }
    return false;
  }

  List<Map<String, dynamic>> favouriteImageList = []; // Updated type
  ApiResponse<User> userData = ApiResponse.loading();
  final _myRepo = AuthRepository();
  final _myRepoProfile = ProfileRepository();

  void setMedia(ApiResponse<User> response) {
    userData = response;
    notifyListeners();
  }

  // Future<void> fetchUserDataAndAssign(String id) async {
  //   setMedia(ApiResponse.loading());
  //   try {
  //     User userData = await _myRepo.getUserData(id);

  //     // Update the shared preference with the fetched user data
  //     final SharedPreferences sp = await SharedPreferences.getInstance();
  //     sp.setString('user', json.encode(userData.toJson()));

  //     // Update the current user in the UserViewModel instance
  //     _currentUser = UserModel(
  //         data: Data(
  //             user: userData, accessToken: _currentUser?.data?.accessToken));

  //     // Notify listeners to update the UI
  //     notifyListeners();

  //     setMedia(ApiResponse.completed(userData));
  //   } catch (error) {
  //     setMedia(ApiResponse.error(error.toString()));
  //   }
  // }

  Future<void> fetchUserData(String id) async {
    setMedia(ApiResponse.loading());
    try {
      User userData = await _myRepo.getUserData(id);
      setMedia(ApiResponse.completed(userData));
    } catch (error) {
      setMedia(ApiResponse.error(error.toString()));
    }
  }

  // Future<void> updateProfileData(dynamic data, String id) async {
  //   try {
  //     var userDataSubmit = await _myRepoProfile.updateApi(data, id);
  //     print('form userview modwl ${userDataSubmit['data']}');
  //   } catch (e) {
  //     print(e);
  //   }
  // }
  Future<void> updateProfileData(dynamic data, String id) async {
    try {
      var userDataSubmit = await _myRepoProfile.updateApi(data, id);

      // Update the shared preference with the updated user data
      final SharedPreferences sp = await SharedPreferences.getInstance();
      sp.setString('user', json.encode(userDataSubmit['data']));

      // Fetch the updated user data from shared preferences
      final String? userString = sp.getString("user");
      if (userString != null) {
        final Map<String, dynamic> userJson = json.decode(userString);
        User updatedUser = User.fromJson(userJson);

        // Update the current user data in the UserViewModel
        _currentUser?.data?.user = updatedUser;

        // Notify listeners to update the UI
        notifyListeners();
      }

      print('form userview modwl ${userDataSubmit['data']}');
    } catch (e) {
      print(e);
    }
  }
}
