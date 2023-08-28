// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fotos_mobile/res/typo_theme_data.dart';
import 'package:fotos_mobile/utils/routes/routes_name.dart';
import 'package:fotos_mobile/utils/utils.dart';
import 'package:fotos_mobile/view_model/auth_view_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../view_model/image_picker_view_model.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  bool isChecked = false;
  bool isImagePicked = false;

  final ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);
  final ValueNotifier<bool> _obsecureConfirmPassword =
      ValueNotifier<bool>(true);

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _zipCodeController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _professionController = TextEditingController();
  final TextEditingController _ImageController = TextEditingController();

  FocusNode userNameFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode confirmPasswordFocusNode = FocusNode();
  FocusNode countryFocusNode = FocusNode();
  FocusNode cityFocusNode = FocusNode();
  FocusNode stateFocusNode = FocusNode();
  FocusNode zipCodeFocusNode = FocusNode();
  FocusNode addressFocusNode = FocusNode();
  FocusNode contactFocusNode = FocusNode();
  FocusNode professionFocusNode = FocusNode();
  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
    _userNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _countryController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _zipCodeController.dispose();
    _addressController.dispose();
    _contactController.dispose();
    _professionController.dispose();

    userNameFocusNode.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
    countryFocusNode.dispose();
    cityFocusNode.dispose();
    stateFocusNode.dispose();
    zipCodeFocusNode.dispose();
    addressFocusNode.dispose();
    contactFocusNode.dispose();
    professionFocusNode.dispose();

    _obsecurePassword.dispose();
    _obsecureConfirmPassword.dispose();
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
          child: SingleChildScrollView(
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
                      child: SvgPicture.asset(
                          'assets/branding/images/logo_white.svg'
                          // fit: BoxFit.contain,
                          ),
                    ),
                    Container(
                      // yourmemoriesmarketplaceUuu (265:294)
                      margin: EdgeInsets.fromLTRB(
                          2 * fem, 0 * fem, 0 * fem, 15 * fem),
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
                          19 * fem, 0 * fem, 18 * fem, 5 * fem),
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
                          const Icon(Icons.person_outline, color: Colors.white),
                          Expanded(
                            child: TextFormField(
                              textInputAction: TextInputAction.next,
                              controller: _userNameController,
                              // keyboardType: TextInputType.emailAddress,
                              focusNode: userNameFocusNode,
                              onFieldSubmitted: (value) =>
                                  Utils.fieldFocusChange(context,
                                      userNameFocusNode, emailFocusNode),
                              decoration: const InputDecoration(
                                hintText: "User name",
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
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          19 * fem, 0 * fem, 18 * fem, 5 * fem),
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
                              onFieldSubmitted: (value) =>
                                  Utils.fieldFocusChange(context,
                                      emailFocusNode, passwordFocusNode),
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
                                19 * fem, 0 * fem, 18 * fem, 15 * fem),
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
                                          onFieldSubmitted: (value) =>
                                              Utils.fieldFocusChange(
                                                  context,
                                                  passwordFocusNode,
                                                  confirmPasswordFocusNode),
                                          // onFieldSubmitted: (_) =>
                                          //     FocusScope.of(context).unfocus(),
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
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        })),
                    ValueListenableBuilder(
                        valueListenable: _obsecureConfirmPassword,
                        builder: ((context, value, child) {
                          return Container(
                            // logininputbox2TZ (265:248)
                            margin: EdgeInsets.fromLTRB(
                                19 * fem, 0 * fem, 18 * fem, 15 * fem),
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
                                    _obsecureConfirmPassword.value =
                                        !_obsecureConfirmPassword.value;
                                  },
                                  child: Icon(
                                    _obsecureConfirmPassword.value
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
                                          obscureText:
                                              _obsecureConfirmPassword.value,
                                          obscuringCharacter: '*',
                                          controller:
                                              _confirmPasswordController,
                                          focusNode: confirmPasswordFocusNode,
                                          keyboardType: TextInputType.multiline,
                                          onFieldSubmitted: (value) =>
                                              Utils.fieldFocusChange(
                                                  context,
                                                  confirmPasswordFocusNode,
                                                  countryFocusNode),
                                          decoration: const InputDecoration(
                                            hintText: 'Confirm Password',
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
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        })),
                    // Container(
                    //   margin: EdgeInsets.fromLTRB(
                    //       19 * fem, 0 * fem, 18 * fem, 5 * fem),
                    //   padding: const EdgeInsets.only(right: 0, bottom: 0),
                    //   width: double.infinity,
                    //   child: Row(
                    //     crossAxisAlignment: CrossAxisAlignment.center,
                    //     children: [
                    //       Expanded(
                    //         child: Container(
                    //           margin: EdgeInsets.only(right: 5 * fem),
                    //           decoration: const BoxDecoration(
                    //             border: Border(
                    //               bottom: BorderSide(
                    //                   style: BorderStyle.solid,
                    //                   color: Colors.white),
                    //             ),
                    //           ),
                    //           child: Row(
                    //             crossAxisAlignment: CrossAxisAlignment.center,
                    //             children: [
                    //               const Icon(Icons.public, color: Colors.white),
                    //               Expanded(
                    //                 child: TextFormField(
                    //                   textInputAction: TextInputAction.next,
                    //                   controller: _countryController,
                    //                   keyboardType: TextInputType.multiline,
                    //                   focusNode: countryFocusNode,
                    //                   onFieldSubmitted: (value) =>
                    //                       Utils.fieldFocusChange(context,
                    //                           countryFocusNode, cityFocusNode),
                    //                   decoration: const InputDecoration(
                    //                     hintText: "Country",
                    //                     border: OutlineInputBorder(
                    //                       borderSide: BorderSide(
                    //                           color: Colors.transparent),
                    //                     ),
                    //                     enabledBorder: OutlineInputBorder(
                    //                       borderSide: BorderSide(
                    //                           color: Colors.transparent),
                    //                     ),
                    //                     disabledBorder: OutlineInputBorder(
                    //                       borderSide: BorderSide(
                    //                           color: Colors.transparent),
                    //                     ),
                    //                     focusedBorder: OutlineInputBorder(
                    //                       borderSide: BorderSide(
                    //                           color: Colors.transparent),
                    //                     ),
                    //                     hintStyle: TextStyle(
                    //                       color: Colors.white,
                    //                     ),
                    //                   ),
                    //                   style: CustomTheme.base.copyWith(
                    //                     color: CustomTheme.whiteTextColor,
                    //                     fontFamily: 'Avenir',
                    //                   ),
                    //                   autocorrect: false,
                    //                 ),
                    //               )
                    //             ],
                    //           ),
                    //         ),
                    //       ),
                    //       const SizedBox(
                    //         width: 10,
                    //       ),
                    //       Expanded(
                    //         child: Container(
                    //           decoration: const BoxDecoration(
                    //             border: Border(
                    //               bottom: BorderSide(
                    //                   style: BorderStyle.solid,
                    //                   color: Colors.white),
                    //             ),
                    //           ),
                    //           margin: EdgeInsets.only(left: 5 * fem),
                    //           child: Row(
                    //             crossAxisAlignment: CrossAxisAlignment.center,
                    //             children: [
                    //               const Icon(Icons.location_city,
                    //                   color: Colors.white),
                    //               Expanded(
                    //                 child: TextFormField(
                    //                   textInputAction: TextInputAction.next,
                    //                   controller: _cityController,
                    //                   keyboardType: TextInputType.emailAddress,
                    //                   focusNode: cityFocusNode,
                    //                   onFieldSubmitted: (value) =>
                    //                       Utils.fieldFocusChange(context,
                    //                           cityFocusNode, stateFocusNode),
                    //                   decoration: const InputDecoration(
                    //                     hintText: "City",
                    //                     border: OutlineInputBorder(
                    //                       borderSide: BorderSide(
                    //                           color: Colors.transparent),
                    //                     ),
                    //                     enabledBorder: OutlineInputBorder(
                    //                       borderSide: BorderSide(
                    //                           color: Colors.transparent),
                    //                     ),
                    //                     disabledBorder: OutlineInputBorder(
                    //                       borderSide: BorderSide(
                    //                           color: Colors.transparent),
                    //                     ),
                    //                     focusedBorder: OutlineInputBorder(
                    //                       borderSide: BorderSide(
                    //                           color: Colors.transparent),
                    //                     ),
                    //                     hintStyle: TextStyle(
                    //                       color: Colors.white,
                    //                     ),
                    //                   ),
                    //                   style: CustomTheme.base.copyWith(
                    //                     color: CustomTheme.whiteTextColor,
                    //                     fontFamily: 'Avenir',
                    //                   ),
                    //                   autocorrect: false,
                    //                 ),
                    //               )
                    //             ],
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // Container(
                    //   margin: EdgeInsets.fromLTRB(
                    //       19 * fem, 0 * fem, 18 * fem, 5 * fem),
                    //   padding: const EdgeInsets.only(right: 0, bottom: 0),
                    //   width: double.infinity,
                    //   child: Row(
                    //     crossAxisAlignment: CrossAxisAlignment.center,
                    //     children: [
                    //       Expanded(
                    //         child: Container(
                    //           margin: EdgeInsets.only(right: 5 * fem),
                    //           decoration: const BoxDecoration(
                    //             border: Border(
                    //               bottom: BorderSide(
                    //                   style: BorderStyle.solid,
                    //                   color: Colors.white),
                    //             ),
                    //           ),
                    //           child: Row(
                    //             crossAxisAlignment: CrossAxisAlignment.center,
                    //             children: [
                    //               const Icon(Icons.holiday_village_outlined,
                    //                   color: Colors.white),
                    //               Expanded(
                    //                 child: TextFormField(
                    //                   textInputAction: TextInputAction.next,
                    //                   controller: _stateController,
                    //                   keyboardType: TextInputType.emailAddress,
                    //                   focusNode: stateFocusNode,
                    //                   onFieldSubmitted: (value) =>
                    //                       Utils.fieldFocusChange(context,
                    //                           stateFocusNode, zipCodeFocusNode),
                    //                   decoration: const InputDecoration(
                    //                     hintText: "State",
                    //                     border: OutlineInputBorder(
                    //                       borderSide: BorderSide(
                    //                           color: Colors.transparent),
                    //                     ),
                    //                     enabledBorder: OutlineInputBorder(
                    //                       borderSide: BorderSide(
                    //                           color: Colors.transparent),
                    //                     ),
                    //                     disabledBorder: OutlineInputBorder(
                    //                       borderSide: BorderSide(
                    //                           color: Colors.transparent),
                    //                     ),
                    //                     focusedBorder: OutlineInputBorder(
                    //                       borderSide: BorderSide(
                    //                           color: Colors.transparent),
                    //                     ),
                    //                     hintStyle: TextStyle(
                    //                       color: Colors.white,
                    //                     ),
                    //                   ),
                    //                   style: CustomTheme.base.copyWith(
                    //                     color: CustomTheme.whiteTextColor,
                    //                     fontFamily: 'Avenir',
                    //                   ),
                    //                   autocorrect: false,
                    //                 ),
                    //               )
                    //             ],
                    //           ),
                    //         ),
                    //       ),
                    //       const SizedBox(
                    //         width: 10,
                    //       ),
                    //       Expanded(
                    //         child: Container(
                    //           decoration: const BoxDecoration(
                    //             border: Border(
                    //               bottom: BorderSide(
                    //                   style: BorderStyle.solid,
                    //                   color: Colors.white),
                    //             ),
                    //           ),
                    //           margin: EdgeInsets.only(left: 5 * fem),
                    //           child: Row(
                    //             crossAxisAlignment: CrossAxisAlignment.center,
                    //             children: [
                    //               const Icon(Icons.code_rounded,
                    //                   color: Colors.white),
                    //               Expanded(
                    //                 child: TextFormField(
                    //                   textInputAction: TextInputAction.next,
                    //                   controller: _zipCodeController,
                    //                   keyboardType: TextInputType.emailAddress,
                    //                   focusNode: zipCodeFocusNode,
                    //                   onFieldSubmitted: (value) =>
                    //                       Utils.fieldFocusChange(
                    //                           context,
                    //                           zipCodeFocusNode,
                    //                           addressFocusNode),
                    //                   decoration: const InputDecoration(
                    //                     hintText: "Zip Code",
                    //                     border: OutlineInputBorder(
                    //                       borderSide: BorderSide(
                    //                           color: Colors.transparent),
                    //                     ),
                    //                     enabledBorder: OutlineInputBorder(
                    //                       borderSide: BorderSide(
                    //                           color: Colors.transparent),
                    //                     ),
                    //                     disabledBorder: OutlineInputBorder(
                    //                       borderSide: BorderSide(
                    //                           color: Colors.transparent),
                    //                     ),
                    //                     focusedBorder: OutlineInputBorder(
                    //                       borderSide: BorderSide(
                    //                           color: Colors.transparent),
                    //                     ),
                    //                     hintStyle: TextStyle(
                    //                       color: Colors.white,
                    //                     ),
                    //                   ),
                    //                   style: CustomTheme.base.copyWith(
                    //                     color: CustomTheme.whiteTextColor,
                    //                     fontFamily: 'Avenir',
                    //                   ),
                    //                   autocorrect: false,
                    //                 ),
                    //               )
                    //             ],
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // Container(
                    //   margin: EdgeInsets.fromLTRB(
                    //       19 * fem, 0 * fem, 18 * fem, 5 * fem),
                    //   padding: const EdgeInsets.only(right: 0, bottom: 0),
                    //   width: double.infinity,
                    //   child: Row(
                    //     crossAxisAlignment: CrossAxisAlignment.center,
                    //     children: [
                    //       Expanded(
                    //         child: Container(
                    //           margin: EdgeInsets.only(right: 5 * fem),
                    //           decoration: const BoxDecoration(
                    //             border: Border(
                    //               bottom: BorderSide(
                    //                   style: BorderStyle.solid,
                    //                   color: Colors.white),
                    //             ),
                    //           ),
                    //           child: Row(
                    //             crossAxisAlignment: CrossAxisAlignment.center,
                    //             children: [
                    //               const Icon(Icons.maps_home_work_outlined,
                    //                   color: Colors.white),
                    //               Expanded(
                    //                 child: TextFormField(
                    //                   textInputAction: TextInputAction.next,
                    //                   controller: _addressController,
                    //                   keyboardType: TextInputType.emailAddress,
                    //                   focusNode: addressFocusNode,
                    //                   onFieldSubmitted: (value) =>
                    //                       Utils.fieldFocusChange(
                    //                           context,
                    //                           addressFocusNode,
                    //                           contactFocusNode),
                    //                   decoration: const InputDecoration(
                    //                     hintText: "Address",
                    //                     border: OutlineInputBorder(
                    //                       borderSide: BorderSide(
                    //                           color: Colors.transparent),
                    //                     ),
                    //                     enabledBorder: OutlineInputBorder(
                    //                       borderSide: BorderSide(
                    //                           color: Colors.transparent),
                    //                     ),
                    //                     disabledBorder: OutlineInputBorder(
                    //                       borderSide: BorderSide(
                    //                           color: Colors.transparent),
                    //                     ),
                    //                     focusedBorder: OutlineInputBorder(
                    //                       borderSide: BorderSide(
                    //                           color: Colors.transparent),
                    //                     ),
                    //                     hintStyle: TextStyle(
                    //                       color: Colors.white,
                    //                     ),
                    //                   ),
                    //                   style: CustomTheme.base.copyWith(
                    //                     color: CustomTheme.whiteTextColor,
                    //                     fontFamily: 'Avenir',
                    //                   ),
                    //                   autocorrect: false,
                    //                 ),
                    //               )
                    //             ],
                    //           ),
                    //         ),
                    //       ),
                    //       const SizedBox(
                    //         width: 10,
                    //       ),
                    //       Expanded(
                    //         child: Container(
                    //           decoration: const BoxDecoration(
                    //             border: Border(
                    //               bottom: BorderSide(
                    //                   style: BorderStyle.solid,
                    //                   color: Colors.white),
                    //             ),
                    //           ),
                    //           margin: EdgeInsets.only(left: 5 * fem),
                    //           child: Row(
                    //             crossAxisAlignment: CrossAxisAlignment.center,
                    //             children: [
                    //               const Icon(Icons.contact_phone_outlined,
                    //                   color: Colors.white),
                    //               Expanded(
                    //                 child: TextFormField(
                    //                   textInputAction: TextInputAction.next,
                    //                   controller: _contactController,
                    //                   keyboardType: TextInputType.emailAddress,
                    //                   focusNode: contactFocusNode,
                    //                   onFieldSubmitted: (value) =>
                    //                       Utils.fieldFocusChange(
                    //                           context,
                    //                           contactFocusNode,
                    //                           professionFocusNode),
                    //                   decoration: const InputDecoration(
                    //                     hintText: "Contact",
                    //                     border: OutlineInputBorder(
                    //                       borderSide: BorderSide(
                    //                           color: Colors.transparent),
                    //                     ),
                    //                     enabledBorder: OutlineInputBorder(
                    //                       borderSide: BorderSide(
                    //                           color: Colors.transparent),
                    //                     ),
                    //                     disabledBorder: OutlineInputBorder(
                    //                       borderSide: BorderSide(
                    //                           color: Colors.transparent),
                    //                     ),
                    //                     focusedBorder: OutlineInputBorder(
                    //                       borderSide: BorderSide(
                    //                           color: Colors.transparent),
                    //                     ),
                    //                     hintStyle: TextStyle(
                    //                       color: Colors.white,
                    //                     ),
                    //                   ),
                    //                   style: CustomTheme.base.copyWith(
                    //                     color: CustomTheme.whiteTextColor,
                    //                     fontFamily: 'Avenir',
                    //                   ),
                    //                   autocorrect: false,
                    //                 ),
                    //               )
                    //             ],
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // Container(
                    //   margin: EdgeInsets.fromLTRB(
                    //       19 * fem, 0 * fem, 18 * fem, 10 * fem),
                    //   padding: const EdgeInsets.only(right: 0, bottom: 0),
                    //   width: double.infinity,
                    //   child: Row(
                    //     crossAxisAlignment: CrossAxisAlignment.center,
                    //     children: [
                    //       Expanded(
                    //         child: Container(
                    //           margin: EdgeInsets.only(right: 5 * fem),
                    //           decoration: const BoxDecoration(
                    //             border: Border(
                    //               bottom: BorderSide(
                    //                   style: BorderStyle.solid,
                    //                   color: Colors.white),
                    //             ),
                    //           ),
                    //           child: Row(
                    //             crossAxisAlignment: CrossAxisAlignment.center,
                    //             children: [
                    //               const Icon(Icons.work_outline,
                    //                   color: Colors.white),
                    //               Expanded(
                    //                 child: TextFormField(
                    //                   textInputAction: TextInputAction.next,
                    //                   controller: _professionController,
                    //                   keyboardType: TextInputType.emailAddress,
                    //                   focusNode: professionFocusNode,
                    //                   onFieldSubmitted: (_) =>
                    //                       FocusScope.of(context).unfocus(),
                    //                   decoration: const InputDecoration(
                    //                     hintText: "Profession",
                    //                     border: OutlineInputBorder(
                    //                       borderSide: BorderSide(
                    //                           color: Colors.transparent),
                    //                     ),
                    //                     enabledBorder: OutlineInputBorder(
                    //                       borderSide: BorderSide(
                    //                           color: Colors.transparent),
                    //                     ),
                    //                     disabledBorder: OutlineInputBorder(
                    //                       borderSide: BorderSide(
                    //                           color: Colors.transparent),
                    //                     ),
                    //                     focusedBorder: OutlineInputBorder(
                    //                       borderSide: BorderSide(
                    //                           color: Colors.transparent),
                    //                     ),
                    //                     hintStyle: TextStyle(
                    //                       color: Colors.white,
                    //                     ),
                    //                   ),
                    //                   style: CustomTheme.base.copyWith(
                    //                     color: CustomTheme.whiteTextColor,
                    //                     fontFamily: 'Avenir',
                    //                   ),
                    //                   autocorrect: false,
                    //                 ),
                    //               )
                    //             ],
                    //           ),
                    //         ),
                    //       ),
                    //       const SizedBox(
                    //         width: 10,
                    //       ),
                    //       Expanded(
                    //         child: Container(
                    //           decoration: const BoxDecoration(
                    //             border: Border(
                    //               bottom: BorderSide(
                    //                   style: BorderStyle.solid,
                    //                   color: Colors.white),
                    //             ),
                    //           ),
                    //           // margin: EdgeInsets.only(left: 5 * fem),
                    //           child: Row(
                    //             crossAxisAlignment: CrossAxisAlignment.center,
                    //             children: [
                    //               const Icon(Icons.file_upload,
                    //                   color: Colors.white),
                    //               Expanded(child: Consumer<ImagePickerModel>(
                    //                 builder:
                    //                     (context, imagePickerModel, child) {
                    //                   isImagePicked =
                    //                       imagePickerModel.pickedImage != null
                    //                           ? true
                    //                           : false;
                    //                   return SizedBox(
                    //                     // width: 336,
                    //                     height: 45.25,

                    //                     child: Row(
                    //                       mainAxisAlignment:
                    //                           MainAxisAlignment.spaceBetween,
                    //                       children: [
                    //                         Padding(
                    //                           padding: const EdgeInsets.only(
                    //                               left: 5),
                    //                           child: SizedBox(
                    //                             width: 80,
                    //                             child: Text(
                    //                               overflow:
                    //                                   TextOverflow.ellipsis,
                    //                               // filePath != null ? filePath! :
                    //                               imagePickerModel
                    //                                           .pickedImage !=
                    //                                       null
                    //                                   ? imagePickerModel
                    //                                       .pickedImage!.path
                    //                                   : 'Select File',

                    //                               style:
                    //                                   CustomTheme.base.copyWith(
                    //                                 color: CustomTheme
                    //                                     .whiteTextColor,
                    //                                 fontFamily: 'Avenir',
                    //                               ),
                    //                             ),
                    //                           ),
                    //                         ),
                    //                         Padding(
                    //                           padding: const EdgeInsets.only(
                    //                               right: 3),
                    //                           child: InkWell(
                    //                             onTap: () async {
                    //                               await imagePickerModel
                    //                                   .pickImage(
                    //                                       ImageSource.gallery);
                    //                               // .pickImage(ImageSource.gallery);
                    //                               setState(() {});
                    //                             },
                    //                             child: Container(
                    //                               width: 56,
                    //                               height: 23,
                    //                               decoration: BoxDecoration(
                    //                                 borderRadius:
                    //                                     BorderRadius.circular(
                    //                                         10),
                    //                                 color: Colors.white,
                    //                               ),
                    //                               child: const Center(
                    //                                 child: Text(
                    //                                   'Upload',
                    //                                   style: TextStyle(
                    //                                     color: CustomTheme
                    //                                         .primaryColor,
                    //                                     fontSize: 12,
                    //                                     fontWeight:
                    //                                         FontWeight.bold,
                    //                                   ),
                    //                                 ),
                    //                               ),
                    //                             ),
                    //                           ),
                    //                         ),
                    //                       ],
                    //                     ),
                    //                   );
                    //                 },
                    //               ))
                    //             ],
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    Row(
                      children: [
                        Theme(
                          data: ThemeData(
                            unselectedWidgetColor:
                                Colors.white, // Set the color to white
                          ),
                          child: Checkbox(
                            activeColor: Colors.white,
                            checkColor: CustomTheme.primaryColor,
                            value: isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value ?? false;
                              });
                            },
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Welcome to FOTOS!'),
                                  content: Text(
                                    'Terms and Conditions',
                                    style: CustomTheme.base
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  actions: [
                                    Center(
                                        child: Text(
                                      "Please read before proceeding.",
                                      style: CustomTheme.base.copyWith(
                                          fontWeight: FontWeight.w500),
                                    )),
                                    const SizedBox(height: 10),
                                    const Text(
                                      "FOTOS is a photo library application where you can purchase high-quality images for your projects or use free images available in our collection.",
                                    ),
                                    const SizedBox(height: 10),
                                    const Text(
                                      "By using FOTOS, you agree to our Terms and Conditions. Please read them carefully before using the application.",
                                    ),
                                    const SizedBox(height: 10),
                                    const Text(
                                      "For any questions or support, please contact our team at support@fotosapp.com.",
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pushNamed(
                                                  context,
                                                  RoutesName
                                                      .terms_And_condition);
                                              // Navigator.of(context).pop();
                                            },
                                            child: const Text(
                                                'Terms & Conditions')),
                                        TextButton(
                                            onPressed: () {
                                              isChecked = true;
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text('Agree')),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text('Close')),
                                      ],
                                    )
                                  ],
                                );
                              },
                            );
                          },
                          child: RichText(
                            textAlign: TextAlign.end,
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: "I read and agree to ",
                                  style: CustomTheme.xSmall.copyWith(
                                      color: CustomTheme.lightBlackTextColor),
                                ),
                                TextSpan(
                                  text: "Terms & Condition",
                                  style: CustomTheme.small.copyWith(
                                    color: CustomTheme.whiteTextColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        if (isChecked) {
                          if (_userNameController.text.isEmpty) {
                            Utils.flushBarErrorMessage(
                                "Please Username", context);
                          } else if (_emailController.text.isEmpty) {
                            Utils.flushBarErrorMessage(
                                "Please enter Email", context);
                          } //_emailController.text.isEmpty
                          else if (!RegExp(
                                  r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                              .hasMatch(_emailController.text.trim())) {
                            Utils.flushBarErrorMessage(
                                "Please enter valid Email", context);
                          } else if (_passwordController.text.isEmpty) {
                            Utils.flushBarErrorMessage(
                                "Please enter Password", context);
                          } else if (_passwordController.text.trim() !=
                              _confirmPasswordController.text.trim()) {
                            Utils.flushBarErrorMessage(
                                "Sorry! password did not match", context);
                          } else if (_passwordController.text.length < 7) {
                            Utils.flushBarErrorMessage(
                                "Password must be atleast 8 character",
                                context);
                          } else {
                            Map data = {
                              "name": _userNameController.text.toString(),
                              "email": _emailController.text.toString(),
                              "password": _passwordController.text.toString(),
                              "password_confirmation":
                                  _passwordController.text.toString(),
                              // "country":
                              //     _countryController.text.trim().toString(),
                              // "city": _cityController.text.trim().toString(),
                              // "state": _stateController.text.trim().toString(),
                              // "zipcode":
                              //     _zipCodeController.text.trim().toString(),
                              // "address":
                              //     _addressController.text.trim().toString(),
                              // "contact":
                              //     _contactController.text.trim().toString(),
                              // "profession":
                              //     _professionController.text.trim().toString(),
                            };
                            authViewModel.signupApi(data, context);
                          }
                        } else {
                          Utils.flushBarErrorMessage(
                              "You must agree our Terms and Condition to proceed.",
                              context);
                        }
                      },
                      child: Container(
                          // group3ECF (268:87)
                          margin: EdgeInsets.fromLTRB(
                              45 * fem, 5 * fem, 39 * fem, 10 * fem),
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
                                  : Text('Signup',
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
                    Container(
                      margin: EdgeInsets.fromLTRB(45 * fem, 10 * fem, 39 * fem,
                          MediaQuery.of(context).size.height * 0.20 * fem),
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

                                      width:
                                          5, // Adjust the width of the border
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
                          padding: EdgeInsets.only(
                              right: 50 * fem, bottom: 50 * fem),
                          child: InkWell(
                            onTap: () =>
                                Navigator.pushNamed(context, RoutesName.login),
                            child: RichText(
                              textAlign: TextAlign.end,
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "Already Have an account? ",
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
