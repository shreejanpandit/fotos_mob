import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fotos_mobile/res/components/drawer_custom_tile.dart';
import 'package:fotos_mobile/res/typo_theme_data.dart';
import 'package:fotos_mobile/utils/routes/routes_name.dart';
import 'package:fotos_mobile/utils/utils.dart';
import 'package:fotos_mobile/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

import '../../models/user_models.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    // GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
    final userPreference = Provider.of<UserViewModel>(context);
    Future<UserModel> getUserData() => UserViewModel().getUser();

    return SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Drawer(
          //const Color(0xff0d3e5c)
          backgroundColor: CustomTheme.primaryColor,
          child: Column(
            children: [
              FutureBuilder(
                future: getUserData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    final user = snapshot.data;
                    if (kDebugMode) {
                      print(user?.accessToken.toString());
                    }
                    if (user?.accessToken.toString() == 'null' ||
                        user?.accessToken == '') {
                      return CustomListTile(
                        title: "Login",
                        opacity: 1.0,
                        onTap: () {
                          Navigator.pushNamed(context, RoutesName.login);
                        },
                        fontWeight: FontWeight.bold,
                      );
                    } else {
                      return CustomListTile(
                        title: "Logout",
                        opacity: 1.0,
                        onTap: () {
                          userPreference.removeUser();
                          Navigator.pushNamed(context, RoutesName.login);
                          Utils.snackBar(
                              message: 'Logout sucessfully',
                              context: context,
                              bgColor: Colors.redAccent);
                        },
                        fontWeight: FontWeight.bold,
                      );
                    }
                  }
                },
              ),
              const Divider(
                  height: 1, thickness: 1, color: CustomTheme.whiteTextColor),
              CustomListTile(
                opacity: 1.0,
                title: "Media",
                onTap: (() {}),
                fontWeight: FontWeight.bold,
              ),
              CustomListTile(
                title: "Photos",
                opacity: 0.8,
                onTap: () {},
              ),
              CustomListTile(title: "Vectors", onTap: () {}, opacity: 0.8),
              CustomListTile(title: "GIFs", onTap: () {}, opacity: 0.8),
              const Divider(
                  height: 1, thickness: 1, color: CustomTheme.whiteTextColor),
              CustomListTile(
                  title: "Editor's Choice", onTap: () {}, opacity: 0.8),
              CustomListTile(
                  title: "Popular Images", onTap: () {}, opacity: 0.8),
              CustomListTile(
                  title: "Popular Searches", onTap: () {}, opacity: 0.8),
              CustomListTile(
                  title: "About",
                  onTap: (() {}),
                  fontWeight: FontWeight.bold,
                  opacity: 1.0),
              CustomListTile(title: "FAQ", onTap: () {}, opacity: 0.8),
              CustomListTile(
                  title: "Terms",
                  onTap: () {
                    Navigator.pushNamed(
                        context, RoutesName.terms_And_condition);

                    // Navigator.pushNamed(context, RoutesName.terms_And_condition)
                    //     .then((value) => Navigator.of(context).pop());
                  },
                  opacity: 0.8),
              CustomListTile(
                  title: "Privacy",
                  onTap: () {
                    Navigator.pushNamed(context, RoutesName.privacy);

                    // Navigator.pushNamed(context, RoutesName.privacy)
                    //     .then((value) => Navigator.of(context).pop());
                  },
                  opacity: 0.8),
              CustomListTile(
                  title: "About Us",
                  onTap: () {
                    Navigator.pushNamed(context, RoutesName.about_us);
                  },
                  opacity: 0.8),
              const Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Divider(
                        height: 1,
                        thickness: 1,
                        color: CustomTheme.whiteTextColor),
                    Expanded(
                      child: SizedBox(
                        height: 50.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(FontAwesomeIcons.facebookF,
                                color: Colors.white, size: 25.0),
                            Icon(FontAwesomeIcons.instagram,
                                color: Colors.white, size: 25.0),
                            Icon(FontAwesomeIcons.twitter,
                                color: Colors.white, size: 25.0)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
