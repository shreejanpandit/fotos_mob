import 'package:flutter/material.dart';
import 'package:fotos_mobile/res/typo_theme_data.dart';
import 'package:fotos_mobile/utils/routes/routes_name.dart';
import 'package:fotos_mobile/view/profile/edit_profile_screen.dart';
import 'package:fotos_mobile/view/profile/personal_info.dart';
import 'package:fotos_mobile/view/profile/work_info.dart';
import 'package:provider/provider.dart';

import '../../data/response/status.dart';
import '../../res/app_urls.dart';
import '../../view_model/user_view_model.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
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
          title: Center(
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
                icon: Icon(
                  Icons.edit,
                  color: Colors.black,
                ))
          ],
        ),
        body: Container(
          child: Column(
            children: [
              SizedBox(
                height: 80,
                width: double.infinity,
                child: Container(
                  padding: const EdgeInsets.only(left: 17, right: 26),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Consumer<UserViewModel>(
                        builder: (context, value, child) {
                          // print(value.userData.data!.id.toString());
                          String imagePath =
                              value.userData.data!.imagePath.toString();
                          String imageUrl;

                          if (imagePath.startsWith('http')) {
                            imageUrl = imagePath;
                          } else {
                            imageUrl =
                                '${AppUrl.baseImageStorageUrl}$imagePath';
                          }
                          switch (value.userData.status) {
                            case Status.LOADING:
                              return Center(
                                child: CircularProgressIndicator.adaptive(),
                              );
                            case Status.ERROR:
                              return Text(value.userData.message.toString());
                            case Status.COMPLETED:
                              return Row(
                                children: [
                                  // Container(
                                  //   width: 80,
                                  //   height: 80,
                                  //   child: const CircleAvatar(
                                  //     backgroundImage: AssetImage(
                                  //         'assets/branding/images/avatar.png'),
                                  //   ),
                                  // ),

                                  ClipOval(
                                    child: Container(
                                      height: 80,
                                      width: 80,
                                      decoration: const ShapeDecoration(
                                        shape: CircleBorder(),
                                      ),
                                      child: Image.network(
                                        imageUrl,
                                        fit: BoxFit.scaleDown,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return Image.asset(
                                            'assets/branding/images/avatar.png',
                                            fit: BoxFit.scaleDown,
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 13),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        value.userData.data!.name.toString(),
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        value.userData.data!.profession
                                            .toString(),
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w300,
                                          color: CustomTheme.primaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            default:
                              return Container();
                          }
                        },
                      ),
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
                      margin: EdgeInsets.only(top: 23, left: 15, right: 15),
                      padding: EdgeInsets.only(),
                      height: 45,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xFFD9D9D9).withOpacity(0.48),
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
                      margin: EdgeInsets.only(top: 31, left: 40, right: 40),
                      child: showPersonalInfo
                          ? PersonalInfo(
                              isEditable: false,
                            )
                          : WorkInfo(isEditable: false),
                    ),
                  ],
                ),
              ),
            ],
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
