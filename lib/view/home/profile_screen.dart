import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fotos_mobile/res/components/home_component/button_with_color_icon_and_text.dart';
import 'package:fotos_mobile/res/typo_theme_data.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Container(
      // homeuser4Sw (38:203)
      padding: EdgeInsets.fromLTRB(0 * fem, 11 * fem, 0 * fem, 0 * fem),
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xffffffff),
        borderRadius: BorderRadius.circular(20 * fem),
      ),
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(
            height: 80,
            width: double.infinity,
            child: Container(
              padding: const EdgeInsets.only(left: 17, right: 26, bottom: 23),
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
          Container(
            padding: const EdgeInsets.only(left: 12, right: 11, bottom: 23),
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
                      onTap: () {},
                      textColor: Colors.white,
                      backgroundColor: CustomTheme.faintGreenColor,
                      image: 'assets/branding/home/payments.svg',
                      text: 'Payments',
                      wid: 113,
                    ),
                    ButtonWithColorIconAndText(
                      onTap: () {},
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
            padding: const EdgeInsets.only(left: 12, right: 11, bottom: 23),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 7, left: 21),
                  child: Text(
                    'General',
                    style: CustomTheme.base.copyWith(
                        color: CustomTheme.faintTextColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w300),
                  ),
                ),
                const ContainerWithIconTextAndLeading(
                  bgColor: CustomTheme.primaryColor,
                  imagePath: 'assets/branding/home/medias.svg',
                  text: 'My medias',
                  containerColor: CustomTheme.primaryColor,
                  containerText: '100+',
                ),
                const ContainerWithIconTextAndLeading(
                  bgColor: CustomTheme.yellowColor,
                  imagePath: 'assets/branding/home/collection.svg',
                  text: 'Collections',
                  containerColor: Colors.yellowAccent,
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
            padding: const EdgeInsets.only(left: 12, right: 11, bottom: 23),
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
                const ContainerWithIconTextAndLeading(
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

  const ContainerWithIconTextAndLeading({
    required this.imagePath,
    required this.text,
    this.bgColor,
    this.containerColor,
    this.containerText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 37,
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
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
                      height: 10,
                      width: 10,
                      // fit: BoxFit.contain,
                    ),
                  ),
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
                        color: const Color(0xFFF9F9F9),
                        border: Border.all(
                          color: const Color(0xFFCDECFF),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 16),
                            child: Text('Select File'),
                          ),
                          Container(
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
                        color: const Color(0xFFF9F9F9),
                        border: Border.all(
                          color: const Color(0xFFCDECFF),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 16),
                            child: Text('Select Collection'),
                          ),
                          Icon(Icons.arrow_downward)
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
                        color: const Color(0xFFF9F9F9),
                        border: Border.all(
                          color: const Color(0xFFCDECFF),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 16),
                            child: Text('Enter Media Name'),
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
                      width: 336,
                      height: 124,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF9F9F9),
                        border: Border.all(
                          color: const Color(0xFFCDECFF),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 16),
                            child: Text('Enter Media Description'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 37),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 113,
                      height: 37,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(33),
                        color: CustomTheme.faintGreenColor,
                      ),
                      child: const Center(
                        child: Text(
                          'Submit',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 17,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 113,
                        height: 37,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(33),
                          color: CustomTheme.faintTextColor,
                        ),
                        child: const Center(
                          child: Text(
                            'Cancel',
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
      );
    },
  );
}
