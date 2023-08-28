// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fotos_mobile/res/typo_theme_data.dart';
import 'package:fotos_mobile/utils/routes/routes_name.dart';
import 'package:fotos_mobile/utils/utils.dart';
import 'package:fotos_mobile/view_model/auth_view_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LogInView extends StatefulWidget {
  const LogInView({super.key});

  @override
  State<LogInView> createState() => _LogInViewState();
}

class _LogInViewState extends State<LogInView> {
  final ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();

    _obsecurePassword.dispose();
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
          toolbarHeight: 10,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
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
                    child:
                        SvgPicture.asset('assets/branding/images/logo_white.svg'
                            // fit: BoxFit.contain,
                            ),
                  ),
                  Container(
                    // yourmemoriesmarketplaceUuu (265:294)
                    margin: EdgeInsets.fromLTRB(
                        2 * fem, 0 * fem, 0 * fem, 50 * fem),
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
                        19 * fem, 0 * fem, 18 * fem, 36 * fem),
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
                            onFieldSubmitted: (value) => Utils.fieldFocusChange(
                                context, emailFocusNode, passwordFocusNode),
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
                  ValueListenableBuilder(
                      valueListenable: _obsecurePassword,
                      builder: ((context, value, child) {
                        return Container(
                          // logininputbox2TZ (265:248)
                          margin: EdgeInsets.fromLTRB(
                              19 * fem, 0 * fem, 18 * fem, 36 * fem),
                          padding: const EdgeInsets.only(right: 0, bottom: 0),
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  style: BorderStyle.solid,
                                  color: Colors.white),
                            ),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  _obsecurePassword.value =
                                      !_obsecurePassword.value;
                                },
                                child: Icon(
                                  _obsecurePassword.value
                                      ? Icons.lock_open
                                      : Icons.lock,
                                  color: Colors.white,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        textInputAction: TextInputAction.done,
                                        obscureText: _obsecurePassword.value,
                                        obscuringCharacter: '*',
                                        controller: _passwordController,
                                        focusNode: passwordFocusNode,
                                        keyboardType: TextInputType.multiline,
                                        onFieldSubmitted: (_) =>
                                            FocusScope.of(context).unfocus(),
                                        decoration: const InputDecoration(
                                          hintText: 'Password',
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  0, 194, 109, 109),
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  0, 202, 75, 75),
                                            ),
                                          ),
                                          disabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  0, 218, 98, 98),
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  0, 247, 109, 109),
                                            ),
                                          ),
                                          hintStyle: TextStyle(
                                            color: CustomTheme.whiteTextColor,
                                          ),
                                        ),
                                        style: CustomTheme.base.copyWith(
                                          color: CustomTheme.whiteTextColor,
                                          fontFamily: 'Avenir',
                                        ),
                                        autocorrect: false,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(context,
                                            RoutesName.forget_password);
                                      },
                                      child: const SizedBox(
                                        width: 70,
                                        child: Text(
                                          "FORGOT",
                                          style: TextStyle(
                                              color:
                                                  CustomTheme.whiteTextColor),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      })),
                  GestureDetector(
                    onTap: () {
                      if (_emailController.text.isEmpty) {
                        Utils.flushBarErrorMessage(
                            "Please enter Email", context);
                      } else if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(_emailController.text)) {
                        Utils.flushBarErrorMessage(
                            "Please enter Email in proper format", context);
                      } else if (_passwordController.text.isEmpty) {
                        Utils.flushBarErrorMessage(
                            "Please enter Password", context);
                      } else if (_passwordController.text.length < 7) {
                        Utils.flushBarErrorMessage(
                            "Password must be atleast 8 character", context);
                      } else {
                        Map data = {
                          "email": _emailController.text.toString(),
                          "password": _passwordController.text.toString(),
                        };
                        print(data);
                        authViewModel.loginApi(data, context);
                      }
                    },
                    child: Container(
                        // group3ECF (268:87)
                        margin: EdgeInsets.fromLTRB(
                            45 * fem, 0 * fem, 39 * fem, 10 * fem),
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
                                    color: CustomTheme.primaryColor,
                                  )
                                : Text('Login',
                                    style: GoogleFonts.inter().copyWith(
                                      // fontSize: 20 * ffem,
                                      fontWeight: FontWeight.w600,
                                      height: 1.2125 * ffem / fem,
                                      letterSpacing: 2.25 * fem,
                                      color: const Color(0xff239de9),
                                    ) // Center(
                                    ))),
                  ),
                  Text(
                    'OR',
                    style: CustomTheme.base.copyWith(
                        fontWeight: FontWeight.bold,
                        color: CustomTheme.whiteTextColor),
                  ),
                  // GestureDetector(
                  //   onTap: () {
                  //     print('Login with google');
                  //   },
                  //   child: Container(
                  //       // group3ECF (268:87)
                  //       margin: EdgeInsets.fromLTRB(
                  //           45 * fem, 10 * fem, 39 * fem, 0 * fem),
                  //       width: double.infinity,
                  //       height: 48 * fem,
                  //       decoration: BoxDecoration(
                  //         color: const Color(0xffffffff),
                  //         borderRadius: BorderRadius.circular(50 * fem),
                  //         boxShadow: [
                  //           BoxShadow(
                  //             color: const Color(0x3f000000),
                  //             offset: Offset(0 * fem, 4 * fem),
                  //             blurRadius: 2 * fem,
                  //           ),
                  //         ],
                  //       ),
                  //       child: Center(
                  //         child: loading
                  //             ? CircularProgressIndicator(
                  //                 color: CustomTheme.primaryColor,
                  //               )
                  //             : SvgPicture.asset(
                  //                 'assets/icons/google.svg',
                  //                 height: 40,
                  //                 fit: BoxFit.contain,
                  //               ),
                  //       )),
                  // ),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        45 * fem, 10 * fem, 39 * fem, 0 * fem),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                            onTap: () {
                              print('Google');
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white,

                                    width: 5, // Adjust the width of the border
                                  ),
                                ),
                                child: Image.asset('assets/icons/gg.png'))),
                        InkWell(
                            onTap: () {
                              print('Facebook');
                            },
                            child: const Icon(
                              Icons.facebook_outlined,
                              color: Colors.white,
                              size: 50,
                            )),
                      ],
                    ),
                  )
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
                            EdgeInsets.only(right: 50 * fem, bottom: 50 * fem),
                        child: InkWell(
                          onTap: () =>
                              Navigator.pushNamed(context, RoutesName.signup),
                          child: RichText(
                            textAlign: TextAlign.end,
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: "Don't have an account?  ",
                                  style: CustomTheme.xSmall.copyWith(
                                      color: CustomTheme.lightBlackTextColor),
                                ),
                                TextSpan(
                                  text: "Signup",
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


/*
SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                focusNode: emailFocusNode,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  prefixIcon: Icon(Icons.alternate_email),
                ),
                onFieldSubmitted: (value) => Utils.fieldFocusChange(
                    context, emailFocusNode, passwordFocusNode),
              ),
              ValueListenableBuilder(
                  valueListenable: _obsecurePassword,
                  builder: ((context, value, child) {
                    return TextFormField(
                      obscureText: _obsecurePassword.value,
                      obscuringCharacter: '*',
                      controller: _passwordController,
                      focusNode: passwordFocusNode,
                      decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Enter your password',
                          prefixIcon: Icon(Icons.lock_outline),
                          suffixIcon: InkWell(
                              onTap: () {
                                _obsecurePassword.value =
                                    !_obsecurePassword.value;
                              },
                              child: Icon(_obsecurePassword.value
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined))),
                    );
                  })),
              SizedBox(
                height: fem,
                child: RoundButton(
                  title: 'Login',
                  loading: authViewModel.loading,
                  onPress: () {
                    if (_emailController.text.isEmpty) {
                      Utils.flushBarErrorMessage("Please enter Email", context);
                    } else if (_passwordController.text.isEmpty) {
                      Utils.flushBarErrorMessage(
                          "Please enter Password", context);
                    } else if (_passwordController.text.length < 7) {
                      Utils.flushBarErrorMessage(
                          "Password must be atleast 8 character", context);
                    } else {
                      Map data = {
                        "email": _emailController.text.toString(),
                        "password": _passwordController.text.toString(),
                      };
                      authViewModel.loginApi(data, context);
                    }
                  },
                ),
              ),
              SizedBox(
                height: fem * 0.02,
                child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.signup);
                    },
                    child: Text("Dont have an account ? SingUP")),
              )
            ],
          ),
        )
 */