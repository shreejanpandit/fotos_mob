import 'package:flutter/material.dart';
import 'package:fotos_mobile/res/components/home_component/profile_icons_with_text.dart';
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
      padding: EdgeInsets.fromLTRB(0 * fem, 11 * fem, 0 * fem, 0 * fem),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFFEBEBEB),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 0 * fem, 21 * fem),
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/branding/images/profile.jpg',
                          height: 49,
                          width: 49,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 13),
                          child: Text(
                            'John Doe',
                            style: CustomTheme.h6.copyWith(
                                color: CustomTheme.primaryColor,
                                fontFamily: GoogleFonts.inter().toString(),
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 550 * fem,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0 * fem,
                          top: 0 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 390 * fem,
                              height: 228 * fem,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xff239de9),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(50 * fem),
                                    topRight: Radius.circular(50 * fem),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0 * fem,
                          top: 170 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 390 * fem,
                              height: 400 * fem,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xffffffff),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(50 * fem),
                                    topRight: Radius.circular(50 * fem),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(30),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ProfileIconWithText(
                                            icon: Icons.person,
                                            text: 'Profile',
                                          ),
                                          ProfileIconWithText(
                                            icon: Icons.subscriptions_outlined,
                                            text: 'Subscription',
                                          ),
                                          ProfileIconWithText(
                                            icon: Icons.photo_album,
                                            text: 'Media',
                                          ),
                                        ],
                                      ),
                                      const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ProfileIconWithText(
                                            icon: Icons.settings,
                                            text: 'Settings',
                                          ),
                                          ProfileIconWithText(
                                            icon: Icons.auto_graph,
                                            text: 'Statistics',
                                          ),
                                          ProfileIconWithText(
                                            icon: Icons.message_outlined,
                                            text: 'Messages',
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(left: 20),
                                            child: ProfileIconWithText(
                                              icon: Icons.collections_outlined,
                                              text: 'Collection',
                                            ),
                                          ),
                                          const SizedBox(width: 20),
                                          Container(
                                            height: 99,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(18),
                                              border: Border.all(
                                                color: const Color(0xff239de9),
                                                width: 4,
                                              ),
                                              boxShadow: const [
                                                BoxShadow(
                                                  color: Color(0x19000000),
                                                  blurRadius: 0,
                                                  offset: Offset(0, 0),
                                                ),
                                              ],
                                              color: Colors.white,
                                            ),
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 15,
                                              vertical: 20,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "UPLOAD",
                                                  style:
                                                      CustomTheme.h6.copyWith(
                                                    color: CustomTheme
                                                        .primaryColor,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                const SizedBox(width: 13),
                                                Image.asset(
                                                    'assets/branding/images/upload.png'),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 32 * fem,
                          top: 37 * fem,
                          child: Container(
                            padding: EdgeInsets.fromLTRB(
                                34 * fem, 13 * fem, 33 * fem, 13 * fem),
                            width: 146 * fem,
                            height: 99 * fem,
                            decoration: BoxDecoration(
                              color: const Color(0xffffffff),
                              borderRadius: BorderRadius.circular(18 * fem),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0x19000000),
                                  offset: Offset(0 * fem, 0 * fem),
                                  blurRadius: 0 * fem,
                                ),
                                BoxShadow(
                                  color: const Color(0x19000000),
                                  offset: Offset(0 * fem, 6 * fem),
                                  blurRadius: 6.5 * fem,
                                ),
                                BoxShadow(
                                  color: const Color(0x16000000),
                                  offset: Offset(-1 * fem, 24 * fem),
                                  blurRadius: 12 * fem,
                                ),
                                BoxShadow(
                                  color: const Color(0x0c000000),
                                  offset: Offset(-2 * fem, 54 * fem),
                                  blurRadius: 16 * fem,
                                ),
                                BoxShadow(
                                  color: const Color(0x02000000),
                                  offset: Offset(-3 * fem, 96 * fem),
                                  blurRadius: 19 * fem,
                                ),
                                BoxShadow(
                                  color: const Color(0x00000000),
                                  offset: Offset(-5 * fem, 150 * fem),
                                  blurRadius: 21 * fem,
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 15),
                                  child: Text(
                                    'Followers',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 1 * fem, 0 * fem),
                                  child: Text(
                                    '45+',
                                    style: CustomTheme.h5.copyWith(
                                        color: CustomTheme.primaryColor,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 211 * fem,
                          top: 37 * fem,
                          child: Container(
                            padding: EdgeInsets.fromLTRB(
                                30 * fem, 13 * fem, 30 * fem, 13 * fem),
                            width: 146 * fem,
                            height: 99 * fem,
                            decoration: BoxDecoration(
                              color: const Color(0xffffffff),
                              borderRadius: BorderRadius.circular(18 * fem),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0x19000000),
                                  offset: Offset(0 * fem, 0 * fem),
                                  blurRadius: 0 * fem,
                                ),
                                BoxShadow(
                                  color: const Color(0x19000000),
                                  offset: Offset(0 * fem, 6 * fem),
                                  blurRadius: 6.5 * fem,
                                ),
                                BoxShadow(
                                  color: const Color(0x16000000),
                                  offset: Offset(-1 * fem, 24 * fem),
                                  blurRadius: 12 * fem,
                                ),
                                BoxShadow(
                                  color: const Color(0x0c000000),
                                  offset: Offset(-2 * fem, 54 * fem),
                                  blurRadius: 16 * fem,
                                ),
                                BoxShadow(
                                  color: const Color(0x02000000),
                                  offset: Offset(-3 * fem, 96 * fem),
                                  blurRadius: 19 * fem,
                                ),
                                BoxShadow(
                                  color: const Color(0x00000000),
                                  offset: Offset(-5 * fem, 150 * fem),
                                  blurRadius: 21 * fem,
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    'Collection',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 1 * fem, 0 * fem),
                                  child: Text(
                                    '10+',
                                    style: CustomTheme.h5.copyWith(
                                        color: CustomTheme.primaryColor,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
