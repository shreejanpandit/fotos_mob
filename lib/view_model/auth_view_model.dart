import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fotos_mobile/models/user_models.dart';
import 'package:fotos_mobile/repository/auth_repository.dart';
import 'package:fotos_mobile/utils/routes/routes_name.dart';
import 'package:fotos_mobile/utils/utils.dart';
import 'package:fotos_mobile/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();
  bool _loading = false;
  bool get loading => _loading;

  setloading(bool value) {
    _loading = value;
    notifyListeners();
  }

  // Future<void> loginApi(dynamic data, BuildContext context) async {
  //   setloading(true);
  //   _myRepo.loginApi(data).then((value) {
  //     setloading(false);
  //     print(value.toString());
  //     final userPreference = Provider.of<UserViewModel>(context, listen: false);
  //     userPreference
  //         .saveUser(UserModel(token: value['accessToken'].toString()));
  //     Utils.snackBar(
  //         message: 'Login sucessful',
  //         context: context,
  //         bgColor: Colors.greenAccent,
  //         textColor: Colors.black);
  //     Navigator.pushNamed(context, RoutesName.home);
  //   }).onError((error, stackTrace) {
  //     setloading(false);

  //     Utils.flushBarErrorMessage(error.toString(), context);
  //     if (kDebugMode) {
  //       print(error.toString());
  //     }
  //   });
  // }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setloading(true);
    try {
      var res = await _myRepo.loginApi(data);

      if (res != null) {
        var result = res as Map<String, dynamic>;

        if (result.containsKey('message')) {
          var message = result['message'];
          var errors = result['errors'] as Map<String, dynamic>;

          if (errors.containsKey('email')) {
            setloading(false);
            Utils.flushBarErrorMessage(message.toString(),
                context); // Display the error message using Utils.flushBarErrorMessage
          }
        } else {
          setloading(false);
          final userPreference =
              Provider.of<UserViewModel>(context, listen: false);
          userPreference.saveUser(UserModel(
              token: result['accessToken'].toString(),
              userId: result['user']['id']));
          // ignore: use_build_context_synchronously
          Utils.snackBar(
            message: 'Login successful',
            context: context,
            bgColor: Colors.greenAccent,
            textColor: Colors.black,
          );
          Navigator.pushNamed(context, RoutesName.home);
        }
      }
    } catch (error) {
      setloading(false);

      Utils.flushBarErrorMessage(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    }
  }

  Future<void> signupApi(dynamic data, BuildContext context) async {
    setloading(true);
    // ignore: avoid_single_cascade_in_expression_statements
    _myRepo.signupApi(data)
      ..then((value) {
        setloading(false);

        Utils.snackBar(
            message: 'Register sucessful',
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
}
