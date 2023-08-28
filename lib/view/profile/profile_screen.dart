import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fotos_mobile/res/components/home_component/button_with_color_icon_and_text.dart';
import 'package:fotos_mobile/res/components/profile_component/green_and_cancle_button.dart';
import 'package:fotos_mobile/res/typo_theme_data.dart';
import 'package:fotos_mobile/utils/routes/routes_name.dart';
import 'package:fotos_mobile/utils/utils.dart';
import 'package:fotos_mobile/view_model/image_picker_view_model.dart';
import 'package:fotos_mobile/view_model/user_view_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../data/response/status.dart';
import '../../models/user_models.dart';
import '../../res/app_urls.dart';
import '../../res/components/appbar_widget.dart';
import '../../res/components/drawer_widget.dart';
import '../../view_model/media_view_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // MediaViewModel mediaViewModel = MediaViewModel();
  String? userId;
  dynamic userProvider;
  late UserModel user;
  String? userName;
  String? userProfession;
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
    });
    // Future.delayed(Duration.zero, () {
    //   Provider.of<MediaViewModel>(context, listen: false).fetchAuthMediaList();
    // });
    // Future.delayed(Duration.zero, () async {
    //   userProvider = Provider.of<UserViewModel>(context, listen: false);
    //   user = await userProvider.getUser();

    //   if (user.data?.accessToken != null) {
    //     setState(() {
    //       // userId = userProvider.userData.data!.id.toString();
    //       userId = user.data!.user!.id.toString();
    //       userName = user.data!.user!.name.toString();
    //       profileImagePath = user.data!.user!.profile_photo_path.toString();
    //       userProfession = user.data!.user!.profession.toString();

    //       if (profileImagePath!.startsWith('http')) {
    //         imageUrl = profileImagePath;
    //       } else {
    //         imageUrl = '${AppUrl.baseImageStorageUrl}$profileImagePath';
    //       }
    //     });
    //     print('profile screen user id is: $profileImagePath');

    //     // Check if userId is not null
    //     if (userId != null) {
    //       Future.delayed(const Duration(seconds: 1), () {
    //         Provider.of<MediaViewModel>(context, listen: false)
    //             .fetchUserMedia(userId!);
    //       });
    //     }
    //   }
    // });
    // Future.delayed(const Duration(seconds: 1), () {
    //   Provider.of<MediaViewModel>(context, listen: false).fetchAuthMediaList();

    //   Provider.of<MediaViewModel>(context, listen: false)
    //       .fetchUserMedia(userId!);
    // });
    // mediaViewModel.fetchAuthMediaList();
    // print(mediaViewModel.authMediaListItems);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userPreference = Provider.of<UserViewModel>(context, listen: false);
    // Future<UserModel> getUserData = UserViewModel().getUser();

    // Future.delayed(Duration.zero, () async {
    //   userProvider = Provider.of<UserViewModel>(context, listen: false);
    //   setState(() async {
    //     user = await userProvider.getUser();
    //   });
    // });
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
    return Scaffold(
        appBar: CustomAppBar(
          scaffoldKey: scaffoldKey,
          automaticallyImplyLeading: false,
        ),
        body: Scaffold(
            key: scaffoldKey,
            drawer: const AppDrawer(),
            body: Container(
              // homeuser4Sw (38:203)
              padding: const EdgeInsets.fromLTRB(0, 22, 0, 0),
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
                borderRadius: BorderRadius.circular(20 * fem),
              ),
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          // print('profile clicked');
                          Navigator.pushNamed(context, RoutesName.user_profile);
                        },
                        child: SizedBox(
                          height: 80,
                          width: double.infinity,
                          child: Container(
                            padding: const EdgeInsets.only(left: 17, right: 26),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Consumer<UserViewModel>(
                                  builder: (context, userViewModel, child) {
                                    User? user =
                                        userViewModel.currentUser!.data!.user;
                                    profileImagePath =
                                        user!.profile_photo_path ?? '.';
                                    print(profileImagePath);
                                    if (profileImagePath!.startsWith('http')) {
                                      imageUrl = profileImagePath;
                                    } else {
                                      imageUrl =
                                          '${AppUrl.baseImageStorageUrl}$profileImagePath';
                                    }
                                    if (!loaded) {
                                      return CircularProgressIndicator
                                          .adaptive();
                                    } else {
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
                                                errorBuilder: (context, error,
                                                    stackTrace) {
                                                  return Image.asset(
                                                    'assets/branding/images/avatar.png',
                                                    fit: BoxFit.cover,
                                                  );
                                                },
                                              ),
                                            ),
                                          ),

                                          // ClipOval(
                                          //   child: Container(
                                          //     height: 80,
                                          //     width: 80,
                                          //     decoration:
                                          //         const ShapeDecoration(
                                          //       shape: CircleBorder(),
                                          //     ),
                                          //     child: Image.network(
                                          //       imageUrl,
                                          //       fit: BoxFit.scaleDown,
                                          //       errorBuilder: (context, error,
                                          //           stackTrace) {
                                          //         return Image.asset(
                                          //           'assets/branding/images/avatar.png',
                                          //           fit: BoxFit.scaleDown,
                                          //         );
                                          //       },
                                          //     ),
                                          //   ),
                                          // ),

                                          const SizedBox(width: 13),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                user.name.toString(),
                                                style: const TextStyle(
                                                    fontSize: 30,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              const SizedBox(height: 4),
                                              Text(
                                                (user.profession != null)
                                                    ? user.profession.toString()
                                                    : 'Profession',
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w300,
                                                  color:
                                                      CustomTheme.primaryColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      );
                                    }
                                  },
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color(0xFFA7A7A7),
                                  size: 16,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            left: 12, right: 11, bottom: 23, top: 23),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 7, left: 21),
                              child: Text(
                                'Quick',
                                style: CustomTheme.base.copyWith(
                                    color: CustomTheme.faintTextColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ButtonWithColorIconAndText(
                                  onTap: () {
                                    // Inside a widget's build method or an onPressed callback
                                    _showBottomSheet(context);
                                  },
                                  textColor: Colors.white,
                                  backgroundColor: CustomTheme.yellowColor,
                                  image: 'assets/branding/home/upload.svg',
                                  text: 'upload',
                                  wid: 113,
                                ),
                                ButtonWithColorIconAndText(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, RoutesName.payment);
                                  },
                                  textColor: Colors.white,
                                  backgroundColor: CustomTheme.faintGreenColor,
                                  image: 'assets/branding/home/payments.svg',
                                  text: 'Payments',
                                  wid: 113,
                                ),
                                ButtonWithColorIconAndText(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, RoutesName.message);
                                  },
                                  textColor: Colors.white,
                                  backgroundColor: CustomTheme.primaryColor,
                                  image: 'assets/branding/home/messages.svg',
                                  text: 'Messages',
                                  wid: 113,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            left: 12, right: 11, bottom: 7),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 7, left: 20),
                              child: Text(
                                'General',
                                style: CustomTheme.base.copyWith(
                                    color: CustomTheme.faintTextColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                            Consumer<MediaViewModel>(
                              builder: (context, value, child) {
                                return ContainerWithIconTextAndLeading(
                                  ontap: () {
                                    Navigator.pushNamed(
                                        context, RoutesName.media);
                                  },
                                  bgColor: CustomTheme.primaryColor,
                                  imagePath: 'assets/branding/home/medias.svg',
                                  text: 'My medias',
                                  containerColor: CustomTheme.primaryColor,
                                  containerText: value.userMedia.data == null
                                      ? '...'
                                      : '${value.userMedia.data!.length}',
                                );
                              },
                            ),
                            Consumer<MediaViewModel>(
                              builder: (context, value, child) {
                                return ContainerWithIconTextAndLeading(
                                  ontap: () {
                                    // print(value.authMediaListItems);
                                    if (!value.authLoading) {
                                      Navigator.pushNamed(
                                          context, RoutesName.collection);
                                    }
                                    //
                                  },
                                  bgColor: CustomTheme.yellowColor,
                                  imagePath:
                                      'assets/branding/home/collection.svg',
                                  text: 'Collections',
                                  containerColor: CustomTheme.yellowColor,
                                  containerText: value.userMediaList.data ==
                                          null
                                      ? '...'
                                      : '${value.userMediaList.data!.length}',
                                );
                              },
                            ),
                            const ContainerWithIconTextAndLeading(
                              bgColor: CustomTheme.lightGreenColor,
                              imagePath: 'assets/branding/home/statistic.svg',
                              text: 'Statistics',
                              // containerColor: CustomTheme.primaryColor,
                              // containerText: '100+',
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, RoutesName.favourite);
                              },
                              child: const ContainerWithIconTextAndLeading(
                                bgColor: CustomTheme.pinkColor,
                                imagePath: 'assets/branding/home/favourite.svg',
                                text: 'Favourites',
                                // containerColor: CustomTheme.primaryColor,
                                // containerText: '100+',
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 12, right: 11),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 7, left: 21),
                              child: Text(
                                'Account',
                                style: CustomTheme.base.copyWith(
                                    color: CustomTheme.faintTextColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                            const ContainerWithIconTextAndLeading(
                              bgColor: CustomTheme.faintGreenColor,
                              imagePath: 'assets/branding/home/privacy.svg',
                              text: 'Privacy',
                            ),
                            const ContainerWithIconTextAndLeading(
                              bgColor: CustomTheme.primaryColor,
                              imagePath: 'assets/branding/home/switch.svg',
                              text: 'Switch Account',
                            ),
                            ContainerWithIconTextAndLeading(
                              ontap: () {
                                userPreference.removeUser();
                                Navigator.pushNamed(context, RoutesName.login);
                                Utils.snackBar(
                                    message: 'Logout sucessfully',
                                    context: context,
                                    bgColor: Colors.redAccent);
                              },
                              bgColor: CustomTheme.lightRedColor,
                              imagePath: 'assets/branding/home/logout.svg',
                              text: 'Log Out',
                            ),
                          ],
                        ),
                      )
                    ]),
              ),
            )));
  }
}

class ContainerWithIconTextAndLeading extends StatelessWidget {
  final String imagePath;
  final String text;
  final Color? containerColor;
  final Color? bgColor;
  final String? containerText;
  final VoidCallback? ontap;
  const ContainerWithIconTextAndLeading({
    required this.imagePath,
    required this.text,
    this.bgColor,
    this.containerColor,
    this.containerText,
    Key? key,
    this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: SizedBox(
          height: 37,
          width: double.infinity,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 37,
                      height: 37,
                      child: CircleAvatar(
                        backgroundColor: bgColor,
                        child: SvgPicture.asset(
                          imagePath,
                          height: 24,
                          width: 24,
                          // fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 13,
                    ),
                    Text(
                      text,
                      style: CustomTheme.base
                          .copyWith(fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                if (containerColor != null && containerText != null)
                  Container(
                    width: 36,
                    height: 23,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(26),
                      color: containerColor,
                    ),
                    child: Center(
                      child: Text(
                        containerText!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void _showBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled:
        true, // Make the bottom sheet take 3/4th of the screen height
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(35),
        topRight: Radius.circular(35),
      ),
    ),
    builder: (BuildContext context) {
      return SizedBox(
        height: MediaQuery.of(context).size.height *
            0.75, // Adjust the height to take 3/4th of the screen
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 77, top: 31, right: 65),
                child: Center(
                    child: Text(
                  'Upload Your Creativity',
                  style: CustomTheme.base
                      .copyWith(fontSize: 22, fontWeight: FontWeight.w500),
                )),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(28, 31, 27, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        'Choose Media',
                        style: CustomTheme.base.copyWith(
                            fontSize: 17, fontWeight: FontWeight.w200),
                      ),
                    ),
                    Consumer<ImagePickerModel>(
                        builder: (context, imagePickerModel, _) {
                      return Container(
                        width: 336,
                        height: 45.25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xFFF9F9F9),
                          border: Border.all(
                            color: const Color(0xFFCDECFF),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Text(
                                'Select File',
                                style: CustomTheme.base.copyWith(
                                    color: CustomTheme.lightTextColor
                                        .withOpacity(0.4),
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                imagePickerModel.pickImage(ImageSource.gallery);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 3),
                                child: Container(
                                  width: 86,
                                  height: 23,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: CustomTheme.primaryColor,
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Upload',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(28, 0, 27, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text('Choose Collection'),
                    ),
                    Container(
                      width: 336,
                      height: 45.25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFFF9F9F9),
                        border: Border.all(
                          color: const Color(0xFFCDECFF),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Text(
                              'Select Collection',
                              style: CustomTheme.base.copyWith(
                                  color: CustomTheme.lightTextColor
                                      .withOpacity(0.4),
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: SvgPicture.asset(
                              'assets/branding/home/down_arrow.svg',
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(28, 0, 27, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        'Media Name',
                        style: CustomTheme.base.copyWith(
                            fontSize: 17, fontWeight: FontWeight.w200),
                      ),
                    ),
                    Container(
                      width: 336,
                      height: 45.25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFFF9F9F9),
                        border: Border.all(
                          color: const Color(0xFFCDECFF),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Text(
                              'Enter Media Name',
                              style: CustomTheme.base.copyWith(
                                  color: CustomTheme.lightTextColor
                                      .withOpacity(0.4),
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(28, 0, 27, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        'Media Description',
                        style: CustomTheme.base.copyWith(
                            fontSize: 17, fontWeight: FontWeight.w200),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      width: 336,
                      height: 124,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFFF9F9F9),
                        border: Border.all(
                          color: const Color(0xFFCDECFF),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 16, top: 3),
                            child: Text(
                              'Enter Media Description',
                              style: CustomTheme.base.copyWith(
                                  color: CustomTheme.lightTextColor
                                      .withOpacity(0.4),
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              GreenAndCancleButton(
                greenButtonText: 'Submit',
                onGreenButton: () {
                  Navigator.pop(context);
                  Alert(
                      style: const AlertStyle(
                          titleStyle: TextStyle(color: Colors.white),
                          backgroundColor: CustomTheme.lightGreenColor),
                      context: context,
                      closeFunction: () {
                        Navigator.pop(context);
                      },
                      buttons: [],
                      image: SvgPicture.asset(
                        'assets/branding/home/tick.svg',
                        height: 41,
                        width: 41,
                      ),
                      title: 'Upload Sucessful !',
                      closeIcon: InkWell(
                        child: SvgPicture.asset(
                          'assets/branding/home/close.svg',
                          height: 20,
                          width: 20,
                        ),
                      )).show();
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}
