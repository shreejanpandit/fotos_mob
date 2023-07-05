import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:fotos_mobile/models/user_models.dart';
import 'package:fotos_mobile/utils/routes/routes_name.dart';
import 'package:fotos_mobile/view_model/user_view_model.dart';

class SplashServices {
  Future<UserModel> getUserData() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context) async {
    getUserData().then((value) async {
      print(value.token.toString());
      // if (value.token == 'null' || value.token == '') {
      //   await Future.delayed(Duration(seconds: 3));
      //   Navigator.pushNamed(context, RoutesName.login);
      // } else {
      await Future.delayed(Duration(seconds: 2));

      Navigator.pushNamed(context, RoutesName.home, arguments: value.token);
      // }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
