import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:fotos_mobile/models/user_models.dart';
import 'package:fotos_mobile/utils/routes/routes_name.dart';
import 'package:fotos_mobile/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class SplashServices {
  Future<UserModel> getUserData() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context) async {
    try {
      UserModel value = await getUserData();
      print(value.data?.accessToken.toString());

      if (value.data?.accessToken == null || value.data?.accessToken == '') {
        await Future.delayed(const Duration(seconds: 1));
        Navigator.pushNamed(context, RoutesName.home);
      } else {
        await Future.delayed(const Duration(seconds: 2));
        var userProvider = Provider.of<UserViewModel>(context, listen: false);
        await userProvider.fetchUserData(value.data!.user!.id.toString());

        Navigator.pushNamed(context, RoutesName.home,
            arguments: value.data?.accessToken);
      }
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
    }
  }
}
