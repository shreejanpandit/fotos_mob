import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fotos_mobile/models/user_models.dart';
import 'package:fotos_mobile/repository/auth_repository.dart';
import 'package:fotos_mobile/utils/routes/routes_name.dart';
import 'package:fotos_mobile/utils/utils.dart';
import 'package:fotos_mobile/view_model/user_view_model.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../res/app_urls.dart';
import 'image_picker_view_model.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();
  bool _loading = false;
  bool get loading => _loading;

  setloading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setloading(true);
    _myRepo.loginApi(data).then((value) {
      setloading(false);
      // print(value['data']['accessToken'].toString());
      final userPreference = Provider.of<UserViewModel>(context, listen: false);
      userPreference.saveUser(
        value['data']['accessToken'].toString(),
        User.fromJson(value['data']['user']),
      );

      Utils.snackBar(
          message: 'Login sucessful',
          context: context,
          bgColor: Colors.greenAccent,
          textColor: Colors.black);
      Navigator.pushNamed(context, RoutesName.splash);
    }).onError((error, stackTrace) {
      setloading(false);

      Utils.flushBarErrorMessage(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  Future<void> signupApi(dynamic data, BuildContext context) async {
    setloading(true);
    _myRepo.signupApi(data).then((value) {
      setloading(false);

      Utils.snackBar(
          message: 'User Register sucessfully',
          context: context,
          bgColor: Colors.greenAccent,
          textColor: Colors.black);
      Navigator.pushNamed(context, RoutesName.login);
    }).onError((error, stackTrace) {
      setloading(false);

      Utils.flushBarErrorMessage(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  // Future<void> signupApi(dynamic data, BuildContext context) async {
  //   try {
  //     var request = http.MultipartRequest(
  //       'POST',
  //       Uri.parse('${AppUrl.baseUrl}users/register'),
  //     );

  //     // Set headers
  //     request.headers['Content-Type'] = 'multipart/form-data';
  //     request.headers['X-Requested-With'] = 'XMLHttpRequest';
  //     // Add form fields
  //     // print('${data['zipcode'].toString()}  and ${data['contact'].toString()}');
  //     request.fields['name'] = data['name'].toString();
  //     request.fields['email'] = data['email'].toString();
  //     request.fields['password'] = data['password'].toString();
  //     request.fields['password_confirmation'] = data['password'].toString();
  //     request.fields['profession'] = data['profession'].toString();
  //     request.fields['country'] = data['country'].toString();
  //     request.fields['state'] = data['state'].toString();
  //     request.fields['city'] = data['city'].toString();
  //     request.fields['zipcode'] = data['zipcode'].toString();
  //     request.fields['address'] = data['address'].toString();
  //     request.fields['contact'] = data['contact'].toString();
  //     // request.fields['dob'] = '1999-01-01T00:00:00.000Z';

  //     var image = Provider.of<ImagePickerModel>(context, listen: false)
  //         .pickedImage!
  //         .path;

  //     // Add image file
  //     var imageFile = File(image);
  //     var stream = http.ByteStream(imageFile.openRead());
  //     var length = await imageFile.length();

  //     var multipartFile = http.MultipartFile(
  //       'image',
  //       stream,
  //       length,
  //       filename: imageFile.path.split('/').last,
  //       // contentType: MediaType('image', 'jpeg'),
  //     );
  //     // print(multipartFile.field);
  //     // Add the image file to the request
  //     request.files.add(multipartFile);

  //     // Send the request and retrieve the response
  //     var response = await request.send();

  //     if (response.statusCode == 200) {
  //       // Success
  //       // print('Success');
  //       String responseBody = await response.stream.bytesToString();
  //       print('Response body: $responseBody');
  //       var jsonResponse = json.decode(responseBody);
  //       Navigator.pushNamed(context, RoutesName.login);
  //       Utils.flushBarErrorMessage(
  //           'User ${jsonResponse['name']} created sucessfully', context);
  //     } else if (response.statusCode == 422) {
  //       // Unprocessable Entity
  //       String responseBody = await response.stream.bytesToString();
  //       var decodedResponse = json.decode(responseBody);
  //       print('Error: ${decodedResponse.toString()}');
  //       Utils.flushBarErrorMessage(decodedResponse['message'], context);
  //     } else {
  //       // Other status codes
  //       print('Error: ${response.statusCode}');
  //     }
  //   } catch (error) {
  //     // Exception occurred, handle the error
  //     print('Signup Failed. Exception: $error');
  //     // Handle the exception here
  //   }
  // }
}
