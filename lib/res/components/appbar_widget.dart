import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fotos_mobile/res/typo_theme_data.dart';
import 'package:fotos_mobile/view_model/appbar_item_view_model.dart';
import 'package:fotos_mobile/view_model/user_view_model.dart';
import 'package:provider/provider.dart';
import '../../models/user_models.dart';
// import '../../models/image_open_model.dart';
import '../../utils/routes/routes_name.dart';
import '../app_urls.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final bool automaticallyImplyLeading;

  const CustomAppBar({
    super.key,
    required this.scaffoldKey,
    required this.automaticallyImplyLeading,
  });

  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  String? token;
  bool isVisible = false;
  String? profileImagePath;
  String? imageUrl;
  bool loaded = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      var userProvider = Provider.of<UserViewModel>(context, listen: false);
      userProvider.getUser().then((value) {
        setState(() {
          loaded = true;
          token = value.data?.accessToken;
          print(token);
          isVisible = token != null;
        });
        // print('this is appbar $token');
        // print('this is appbar $isVisible');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final appbarProvider = Provider.of<AppbarViewModel>(context);
    final ValueNotifier<bool> drawer = appbarProvider.drawerOpenNotifier;
    return AppBar(
      automaticallyImplyLeading: widget.automaticallyImplyLeading,
      iconTheme: const IconThemeData(
        color: CustomTheme.primaryColor, // change your color here
      ),
      actions: [
        if (token != null && token!.length > 4)
          // IconButton(
          //   icon: const Icon(
          //     Icons.notifications_none,
          //     color: CustomTheme.primaryColor,
          //   ),
          //   onPressed: () {
          //     print("notification");
          //   },
          // ),
          if (token != null && token!.length > 4)
            InkWell(
              onTap: appbarProvider.toggleBody,
              child: Padding(
                padding: const EdgeInsets.only(right: 5),
                child: SizedBox(
                  child: Consumer<UserViewModel>(
                      builder: (context, userViewModel, child) {
                    User? user = userViewModel.currentUser!.data!.user;
                    profileImagePath = user!.profile_photo_path ?? '.';
                    print(profileImagePath);
                    if (profileImagePath!.startsWith('http')) {
                      imageUrl = profileImagePath;
                    } else {
                      imageUrl =
                          '${AppUrl.baseImageStorageUrl}$profileImagePath';
                    }
                    if (!loaded) {
                      return CircularProgressIndicator.adaptive();
                    } else {
                      return Row(children: [
                        InkWell(
                          onTap: () =>
                              Navigator.pushNamed(context, RoutesName.profile),
                          child: Container(
                            height: 35,
                            width: 35,
                            decoration: const ShapeDecoration(
                              shape: CircleBorder(),
                            ),
                            child: ClipOval(
                              child: Image.network(
                                imageUrl.toString(),
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Image.asset(
                                    'assets/branding/images/avatar.png',
                                    fit: BoxFit.cover,
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ]);
                    }
                  }),

                  // CircleAvatar(
                  //   backgroundColor: Colors.transparent,
                  //   child: InkWell(
                  //     onTap: () =>
                  //         Navigator.pushNamed(context, RoutesName.profile),
                  //     child:
                  //     // Container(
                  //     //   width: 33.97,
                  //     //   height: 35,
                  //     //   decoration: const ShapeDecoration(
                  //     //     image: DecorationImage(
                  //     //       image:
                  //     //           AssetImage('assets/branding/images/avatar.png'),
                  //     //       fit: BoxFit.fill,
                  //     //     ),
                  //     //     shape: OvalBorder(),
                  //     //   ),
                  //     // ),
                  //     Container(
                  //                             height: 35,
                  //                             width: 35,
                  //                             decoration: const ShapeDecoration(
                  //                               shape: CircleBorder(),
                  //                             ),
                  //                             child: ClipOval(
                  //                               child: Image.network(
                  //                                 imageUrl.toString(),
                  //                                 fit: BoxFit.cover,
                  //                                 errorBuilder: (context, error,
                  //                                     stackTrace) {
                  //                                   return Image.asset(
                  //                                     'assets/branding/images/avatar.png',
                  //                                     fit: BoxFit.cover,
                  //                                   );
                  //                                 },
                  //                               ),
                  //                             ),
                  //                           ),
                  //   ),
                  //   // child: appbarProvider.showBody
                  //   // ? Container(
                  //   //     width: 33.97,
                  //   //     height: 35,
                  //   //     decoration: const ShapeDecoration(
                  //   //       image: DecorationImage(
                  //   //         image: AssetImage(
                  //   //             'assets/branding/images/avatar.png'),
                  //   //         fit: BoxFit.fill,
                  //   //       ),
                  //   //       shape: OvalBorder(),
                  //   //     ),
                  //   //   )
                  //   //     : Container(
                  //   //         width: 33.97,
                  //   //         height: 35,
                  //   //         child: const Icon(
                  //   //           Icons.home_outlined,
                  //   //           color: CustomTheme.primaryColor,
                  //   //           size: 30,
                  //   //         ),
                  //   //       ),
                  // ),
                ),
              ),
            ),
        ValueListenableBuilder(
          valueListenable: drawer,
          builder: (context, value, child) {
            return Container(
              margin: const EdgeInsets.only(right: 10),
              child: InkWell(
                onTap: () {
                  if (drawer.value) {
                    widget.scaffoldKey.currentState?.openEndDrawer();
                  } else {
                    widget.scaffoldKey.currentState?.openDrawer();
                  }
                  drawer.value = !drawer.value; // Toggle the drawer value
                },
                child: SvgPicture.asset('assets/branding/home/drawer.svg'),
              ),
            );
          },
        ),
      ],
      title: InkWell(
        onTap: () {
          Navigator.pushNamed(context, RoutesName.home);
        },
        child: SvgPicture.asset(
          'assets/branding/images/logo.svg',
          // fit: BoxFit.contain,
        ),

        // Image.asset(
        //   ,
        // ),
      ),
      elevation: 0,
    );
  }
}
