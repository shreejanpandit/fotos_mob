import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fotos_mobile/res/components/home_component/button_with_color_icon_and_text.dart';
import 'package:fotos_mobile/res/components/profile_component/submit_and_cancle_button.dart';
import 'package:fotos_mobile/res/typo_theme_data.dart';
import 'package:fotos_mobile/utils/routes/routes_name.dart';
import 'package:fotos_mobile/utils/utils.dart';
import 'package:fotos_mobile/view/profile/collection_screen.dart';
import 'package:fotos_mobile/view/profile/media_screen.dart';
import 'package:fotos_mobile/view/profile/message/message_screen.dart';
import 'package:fotos_mobile/view/profile/payment/payment_screen.dart';
import 'package:fotos_mobile/view/profile/user_profile_screen.dart';
import 'package:fotos_mobile/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

import '../../models/user_models.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userPreference = Provider.of<UserViewModel>(context);
    Future<UserModel> getUserData() => UserViewModel().getUser();
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;

    return Container(
      // homeuser4Sw (38:203)
      padding: EdgeInsets.fromLTRB(0, 22, 0, 0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xffffffff),
        borderRadius: BorderRadius.circular(20 * fem),
      ),
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          InkWell(
            onTap: () {
              print('profile clicked');
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => UserProfileScreen()));
            },
            child: SizedBox(
              height: 80,
              width: double.infinity,
              child: Container(
                padding: const EdgeInsets.only(left: 17, right: 26),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          child: const CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/branding/images/avatar.png'),
                          ),
                        ),
                        const SizedBox(width: 13),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'John Deo',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Photographer',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                                color: CustomTheme.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ],
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
            padding:
                const EdgeInsets.only(left: 12, right: 11, bottom: 23, top: 23),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 7, left: 21),
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PaymentScreen()));
                      },
                      textColor: Colors.white,
                      backgroundColor: CustomTheme.faintGreenColor,
                      image: 'assets/branding/home/payments.svg',
                      text: 'Payments',
                      wid: 113,
                    ),
                    ButtonWithColorIconAndText(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MessagesScreen()));
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
            padding: const EdgeInsets.only(left: 12, right: 11, bottom: 7),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 7, left: 20),
                  child: Text(
                    'General',
                    style: CustomTheme.base.copyWith(
                        color: CustomTheme.faintTextColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w300),
                  ),
                ),
                ContainerWithIconTextAndLeading(
                  ontap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MediaScreen()));
                  },
                  bgColor: CustomTheme.primaryColor,
                  imagePath: 'assets/branding/home/medias.svg',
                  text: 'My medias',
                  containerColor: CustomTheme.primaryColor,
                  containerText: '100+',
                ),
                ContainerWithIconTextAndLeading(
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CollectionScreen()));
                  },
                  bgColor: CustomTheme.yellowColor,
                  imagePath: 'assets/branding/home/collection.svg',
                  text: 'Collections',
                  containerColor: CustomTheme.yellowColor,
                  containerText: '200+',
                ),
                const ContainerWithIconTextAndLeading(
                  bgColor: CustomTheme.lightGreenColor,
                  imagePath: 'assets/branding/home/statistic.svg',
                  text: 'Statistics',
                  // containerColor: CustomTheme.primaryColor,
                  // containerText: '100+',
                ),
                const ContainerWithIconTextAndLeading(
                  bgColor: CustomTheme.pinkColor,
                  imagePath: 'assets/branding/home/favourite.svg',
                  text: 'Favourites',
                  // containerColor: CustomTheme.primaryColor,
                  // containerText: '100+',
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
                  padding: const EdgeInsets.only(bottom: 7, left: 21),
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
    );
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
                    SizedBox(
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
      return Container(
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
                            padding: EdgeInsets.only(left: 16),
                            child: Text(
                              'Select File',
                              style: CustomTheme.base.copyWith(
                                  color: CustomTheme.lightTextColor
                                      .withOpacity(0.4),
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                          Padding(
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
                            padding: EdgeInsets.only(left: 16),
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
                            padding: EdgeInsets.only(left: 16),
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
                            padding: EdgeInsets.only(left: 16, top: 3),
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
              SubmitAndCancleButton(),
            ],
          ),
        ),
      );
    },
  );
}
