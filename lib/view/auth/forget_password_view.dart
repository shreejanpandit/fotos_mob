// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:fotos_mobile/res/typo_theme_data.dart';
import 'package:fotos_mobile/utils/routes/routes_name.dart';
import 'package:fotos_mobile/utils/utils.dart';
import 'package:fotos_mobile/view_model/auth_view_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  final TextEditingController _emailController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
    _emailController.dispose();

    emailFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    bool loading = authViewModel.loading;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          toolbarHeight: 10,
          elevation: 0,
        ),
        resizeToAvoidBottomInset: false,
        backgroundColor: CustomTheme.primaryColor,
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    // group49z7 (268:88)
                    margin: EdgeInsets.fromLTRB(
                        126 * fem, 0 * fem, 125 * fem, 13 * fem),
                    width: double.infinity,

                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // logorNj (265:186)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0.25 * fem, 10.89 * fem, 0 * fem),
                          width: 25.11 * fem,
                          height: 28.25 * fem,
                          child: Image.asset(
                            'assets/branding/images/logo.png',
                          ),
                        ),
                        Text('Fotos',
                            style: GoogleFonts.lobster().copyWith(
                              fontSize: 40 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.25 * ffem / fem,
                              color: CustomTheme.whiteTextColor,
                            )),
                      ],
                    ),
                  ),
                  Container(
                    // yourmemoriesmarketplaceUuu (265:294)
                    margin: EdgeInsets.fromLTRB(
                        2 * fem, 0 * fem, 0 * fem, 20 * fem),
                    child: Text('Your memories marketplace',
                        style: GoogleFonts.kaushanScript().copyWith(
                          fontSize: 20 * ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.4525 * ffem / fem,
                          color: CustomTheme.whiteTextColor,
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        19 * fem, 100 * fem, 18 * fem, 36 * fem),
                    padding: const EdgeInsets.only(right: 0, bottom: 0),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            style: BorderStyle.solid, color: Colors.white),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.email_outlined, color: Colors.white),
                        Expanded(
                          child: TextFormField(
                            textInputAction: TextInputAction.next,
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            focusNode: emailFocusNode,
                            onFieldSubmitted: (_) =>
                                FocusScope.of(context).unfocus(),
                            decoration: const InputDecoration(
                              hintText: "Email",
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                              hintStyle: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            style: CustomTheme.base.copyWith(
                              color: CustomTheme.whiteTextColor,
                              fontFamily: 'Avenir',
                            ),
                            autocorrect: false,
                          ),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_emailController.text.isEmpty) {
                        Utils.flushBarErrorMessage(
                            "Please enter Email", context);
                      } else {
                        Map data = {
                          "email": _emailController.text.toString(),
                        };
                        authViewModel.loginApi(data, context);
                      }
                    },
                    child: Container(
                        // group3ECF (268:87)
                        margin: EdgeInsets.fromLTRB(
                            45 * fem, 0 * fem, 39 * fem, 0 * fem),
                        width: double.infinity,
                        height: 48 * fem,
                        decoration: BoxDecoration(
                          color: const Color(0xffffffff),
                          borderRadius: BorderRadius.circular(50 * fem),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0x3f000000),
                              offset: Offset(0 * fem, 4 * fem),
                              blurRadius: 2 * fem,
                            ),
                          ],
                        ),
                        child: Center(
                            child: loading
                                ? const CircularProgressIndicator(
                                    color: CustomTheme.whiteTextColor,
                                  )
                                : Text('SEND RESET LINK',
                                    style: GoogleFonts.inter().copyWith(
                                      fontWeight: FontWeight.w600,
                                      height: 1.2125 * ffem / fem,
                                      letterSpacing: 2.25 * fem,
                                      color: const Color(0xff239de9),
                                    ) // Center(
                                    ))),
                  ),
                ],
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: ClipPath(
                  clipper: BottomDecClipper(),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.40,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [
                          Color.fromARGB(255, 255, 255, 255),
                          Color.fromARGB(255, 255, 255, 255),
                        ],
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding:
                            EdgeInsets.only(right: 60 * fem, bottom: 50 * fem),
                        child: InkWell(
                          onTap: () =>
                              Navigator.pushNamed(context, RoutesName.login),
                          child: RichText(
                            textAlign: TextAlign.end,
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: "Back to  ",
                                  style: CustomTheme.xSmall.copyWith(
                                      color: CustomTheme.lightBlackTextColor),
                                ),
                                TextSpan(
                                  text: "Login",
                                  style: CustomTheme.small.copyWith(
                                    color: CustomTheme.primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class BottomDecClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height);
    path.cubicTo(size.width * .25, size.height * 0.25, size.width * .85,
        size.height * .85, size.width, 0);
    path.lineTo(size.width, size.height);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
