import 'package:flutter/material.dart';
import 'package:fotos_mobile/res/typo_theme_data.dart';
import 'package:fotos_mobile/utils/routes/routes_name.dart';
import 'package:fotos_mobile/view/profile/personal_info.dart';
import 'package:fotos_mobile/view/profile/work_info.dart';
import 'package:provider/provider.dart';

import '../../data/response/status.dart';
import '../../models/user_models.dart';
import '../../res/app_urls.dart';
import '../../view_model/user_view_model.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  String? userId;
  dynamic userProvider;
  UserModel? user;
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
        });
      });
      // print('this is appbar $token');
      // print('this is appbar $isVisible');
    });
    // Future.delayed(Duration.zero, () async {
    //   userProvider = Provider.of<UserViewModel>(context, listen: false);
    //   user = await userProvider.getUser();

    //   if (user.data?.accessToken != null) {
    //     setState(() {
    //       // userId = userProvider.userData.data!.id.toString();
    //       userId = user.data!.user!.id.toString();
    //       profileImagePath = user.data!.user!.profile_photo_path.toString();

    //       if (profileImagePath!.startsWith('http')) {
    //         imageUrl = profileImagePath;
    //       } else {
    //         imageUrl = '${AppUrl.baseImageStorageUrl}$profileImagePath';
    //       }
    //     });
    //     print('profile screen user id is: $profileImagePath');
    //   }
    // });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  bool showPersonalInfo = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Color(0xFFA7A7A7),
              size: 16,
            ),
          ),
          title: const Center(
            child: Text(
              'My profile',
              style: TextStyle(color: Colors.black),
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, RoutesName.user_profile_edit);
                },
                icon: const Icon(
                  Icons.edit,
                  color: Colors.black,
                ))
          ],
        ),
        body: Container(
          child: Consumer<UserViewModel>(
            builder: (context, userViewModel, child) {
              User? user = userViewModel.currentUser!.data!.user;
              profileImagePath = user!.profile_photo_path ?? '.';
              print(profileImagePath);
              if (profileImagePath!.startsWith('http')) {
                imageUrl = profileImagePath;
              } else {
                imageUrl = '${AppUrl.baseImageStorageUrl}$profileImagePath';
              }
              if (!loaded) {
                return CircularProgressIndicator.adaptive();
              } else {
                return Column(
                  children: [
                    SizedBox(
                      height: 80,
                      width: double.infinity,
                      child: Container(
                        padding: const EdgeInsets.only(left: 17, right: 26),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Text(user.data!.user!.profile_photo_path.toString()),
                            Row(
                              children: [
                                Container(
                                  height: 80,
                                  width: 80,
                                  decoration: const ShapeDecoration(
                                    shape: CircleBorder(),
                                  ),
                                  child: ClipOval(
                                    child: Image.network(
                                      imageUrl.toString(),
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Image.asset(
                                          'assets/branding/images/avatar.png',
                                          fit: BoxFit.cover,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 13),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      user.name.toString(),
                                      style: const TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      user.profession.toString(),
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300,
                                        color: CustomTheme.primaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            // Consumer<UserViewModel>(
                            //   builder: (context, value, child) {
                            //     print(user.data!.user?.name);
                            // String imagePath = value
                            //     .userData.data!.profile_photo_path
                            //     .toString();
                            // String imageUrl;

                            // if (imagePath.startsWith('http')) {
                            //   imageUrl = imagePath;
                            // } else {
                            //   imageUrl =
                            //       '${AppUrl.baseImageStorageUrl}$imagePath';
                            //     }
                            //     switch (value.userData.status) {
                            //       case Status.LOADING:
                            //         return const Center(
                            //           child: CircularProgressIndicator.adaptive(),
                            //         );
                            //       case Status.ERROR:
                            //         return Text(value.userData.message.toString());
                            //       case Status.COMPLETED:
                            //         return Row(
                            //           children: [
                            //             // Container(
                            //             //   width: 80,
                            //             //   height: 80,
                            //             //   child: const CircleAvatar(
                            //             //     backgroundImage: AssetImage(
                            //             //         'assets/branding/images/avatar.png'),
                            //             //   ),
                            //             // ),

                            //             Container(
                            //               height: 80,
                            //               width: 80,
                            //               decoration: const ShapeDecoration(
                            //                 shape: CircleBorder(),
                            //               ),
                            //               child: ClipOval(
                            //                 child: Image.network(
                            //                   imageUrl,
                            //                   fit: BoxFit.cover,
                            //                   errorBuilder:
                            //                       (context, error, stackTrace) {
                            //                     return Image.asset(
                            //                       'assets/branding/images/avatar.png',
                            //                       fit: BoxFit.cover,
                            //                     );
                            //                   },
                            //                 ),
                            //               ),
                            //             ),
                            //             const SizedBox(width: 13),
                            //             Column(
                            //               crossAxisAlignment:
                            //                   CrossAxisAlignment.start,
                            //               mainAxisAlignment: MainAxisAlignment.center,
                            //               children: [
                            //                 Text(
                            //                   value.userData.data!.name.toString(),
                            //                   style: const TextStyle(
                            //                       fontSize: 30,
                            //                       fontWeight: FontWeight.w500),
                            //                 ),
                            //                 const SizedBox(height: 4),
                            //                 Text(
                            //                   value.userData.data!.profession
                            //                       .toString(),
                            //                   style: const TextStyle(
                            //                     fontSize: 14,
                            //                     fontWeight: FontWeight.w300,
                            //                     color: CustomTheme.primaryColor,
                            //                   ),
                            //                 ),
                            //               ],
                            //             ),
                            //           ],
                            //         );
                            //       default:
                            //         return Container();
                            //     }
                            //   },
                            // ),
                            // Row(
                            //   children: [
                            //     Container(
                            //       width: 80,
                            //       height: 80,
                            //       child: const CircleAvatar(
                            //         backgroundImage: AssetImage(
                            //             'assets/branding/images/avatar.png'),
                            //       ),
                            //     ),
                            //     const SizedBox(width: 13),
                            //     const Column(
                            //       crossAxisAlignment: CrossAxisAlignment.start,
                            //       mainAxisAlignment: MainAxisAlignment.center,
                            //       children: [
                            //         Text(
                            //           'John Deo',
                            //           style: TextStyle(
                            //               fontSize: 30, fontWeight: FontWeight.w500),
                            //         ),
                            //         SizedBox(height: 4),
                            //         Text(
                            //           'Photographer',
                            //           style: TextStyle(
                            //             fontSize: 14,
                            //             fontWeight: FontWeight.w300,
                            //             color: CustomTheme.primaryColor,
                            //           ),
                            //         ),
                            //       ],
                            //     ),
                            //   ],
                            // ),
                          ],
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                                top: 23, left: 15, right: 15),
                            padding: const EdgeInsets.only(),
                            height: 45,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color(0xFFD9D9D9).withOpacity(0.48),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ToggleButton(
                                  text: 'Personal Info',
                                  isSelected: showPersonalInfo,
                                  onTap: () {
                                    setState(() {
                                      showPersonalInfo = true;
                                    });
                                  },
                                ),
                                ToggleButton(
                                  text: 'Work Info',
                                  isSelected: !showPersonalInfo,
                                  onTap: () {
                                    setState(() {
                                      showPersonalInfo = false;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            margin: const EdgeInsets.only(
                                top: 31, left: 40, right: 40),
                            child: showPersonalInfo
                                ? PersonalInfo(
                                    isEditable: false,
                                    userData: user,
                                  )
                                : WorkInfo(isEditable: false, userData: user),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

class ToggleButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const ToggleButton({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        width: MediaQuery.of(context).size.width * 0.45,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : null,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              // color: isSelected ? Colors.black : Colors.transparent,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
