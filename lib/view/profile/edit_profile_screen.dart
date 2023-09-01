import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fotos_mobile/res/components/profile_component/green_and_cancle_button.dart';
import 'package:fotos_mobile/view/profile/work_info.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../models/user_models.dart';
import '../../res/app_urls.dart';
import '../../res/typo_theme_data.dart';
import '../../utils/routes/routes_name.dart';
import '../../utils/utils.dart';
import '../../view/profile/personal_info.dart';
import '../../view_model/image_picker_view_model.dart';
import '../../view_model/user_view_model.dart';
import 'package:http/http.dart' as http;

class EditUserProfileScreen extends StatefulWidget {
  const EditUserProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditUserProfileScreen> createState() => _EditUserProfileScreenState();
}

class _EditUserProfileScreenState extends State<EditUserProfileScreen> {
  bool showPersonalInfo = true;
  String? userId;
  dynamic userProvider;
  UserModel? user;
  String? profileImagePath;
  String? imageUrl;
  bool isImagePicked = false;
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
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future<void> postProfileImageData(BuildContext context,
        UserViewModel userViewModel, String accessToken) async {
      try {
        var token = accessToken;

        var request =
            http.MultipartRequest('POST', Uri.parse('${AppUrl.profileImage}'));

        // Set headers
        request.headers['Authorization'] = 'Bearer $token';
        request.headers['Content-Type'] = 'multipart/form-data';
        request.headers['X-Requested-With'] = 'XMLHttpRequest';
        // Add form fields

        var img = Provider.of<ImagePickerModel>(context, listen: false);
        var image = Provider.of<ImagePickerModel>(context, listen: false)
            .pickedImage!
            .path;

        // Add image file
        var imageFile = File(image);
        var stream = http.ByteStream(imageFile.openRead());
        var length = await imageFile.length();

        var multipartFile = http.MultipartFile(
          'profile_photo_path',
          stream,
          length,
          filename: imageFile.path.split('/').last,
          // contentType: MediaType('image', 'jpeg'),
        );
        // print(multipartFile.field);
        // Add the image file to the request
        request.files.add(multipartFile);

        // Send the request and retrieve the response
        var response = await request.send();

        if (response.statusCode == 200) {
          // Success
          // print('Success');
          // img.clearPickedImage();
          dynamic responseBody = await response.stream.bytesToString();

          var jsonResponse = json.decode(responseBody);
          print('Response body: ${jsonResponse['data']['profile_photo_path']}');
          userViewModel
              .changeProfileImage(jsonResponse['data']['profile_photo_path']);

          // Notify listeners to update the UI
          // userViewModel.notifyListeners();

          Navigator.pushNamed(context, RoutesName.user_profile_edit);
          Utils.flushBarSucessMessage(
              'Profile image changed sucessfully', context);
        } else if (response.statusCode == 422) {
          // Unprocessable Entity
          String responseBody = await response.stream.bytesToString();
          var decodedResponse = json.decode(responseBody);
          // print('Error: ${decodedResponse.toString()}');
          Utils.flushBarErrorMessage(decodedResponse['message'], context);
        } else {
          // Other status codes
          print('Error: ${response.statusCode}');
        }
      } catch (error) {
        // Exception occurred, handle the error
        print('Signup Failed. Exception: $error');
        // Handle the exception here
      }
    }

    return Scaffold(
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
            'Edit Profile',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: SingleChildScrollView(
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
                    width: double.infinity,
                    child: Container(
                      padding: const EdgeInsets.only(left: 17, right: 26),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Stack(
                                children: [
                                  Consumer<ImagePickerModel>(
                                    builder:
                                        (context, imagePickerModel, child) {
                                      isImagePicked =
                                          imagePickerModel.pickedImage != null
                                              ? true
                                              : false;
                                      return PopupMenuButton(
                                        position: PopupMenuPosition.under,
                                        shadowColor: CustomTheme.primaryColor,
                                        tooltip: 'Upload data',
                                        color: Colors.grey.shade300,
                                        child: ClipOval(
                                          child: Container(
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
                                        ),
                                        itemBuilder: (BuildContext context) {
                                          return [
                                            _buildPopupMenuItem(
                                                'Select from Device',
                                                Icons.upload, () async {
                                              Navigator.pop(context);
                                              await imagePickerModel.pickImage(
                                                  ImageSource.gallery);
                                              // .pickImage(ImageSource.gallery);
                                              setState(() {});
                                              final userprovider =
                                                  Provider.of<UserViewModel>(
                                                      context,
                                                      listen: false);

                                              // print(
                                              //     'is thi done?? ${imagePickerModel.pickedImage}');

                                              postProfileImageData(
                                                  context,
                                                  userprovider,
                                                  userViewModel.currentUser!
                                                      .data!.accessToken!);
                                            }),
                                            _buildPopupMenuItem(
                                                'Remove Profile',
                                                Icons.remove_circle_outline,
                                                () {
                                              Navigator.pop(context);
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return Dialog(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              16.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Text(
                                                            "Are you sure you want to remove your profile image ?",
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 18.0,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                              height: 24.0),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              ElevatedButton(
                                                                style:
                                                                    ButtonStyle(
                                                                  backgroundColor:
                                                                      MaterialStateProperty
                                                                          .all(
                                                                    Colors.grey,
                                                                  ),
                                                                ),
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop(); // Close the dialog
                                                                },
                                                                child: Text(
                                                                    "Cancel"),
                                                              ),
                                                              ElevatedButton(
                                                                style:
                                                                    ButtonStyle(
                                                                  backgroundColor:
                                                                      MaterialStateProperty
                                                                          .all(
                                                                    Colors.red,
                                                                  ),
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  final provider = Provider.of<
                                                                          ImagePickerModel>(
                                                                      context,
                                                                      listen:
                                                                          false);
                                                                  final userprovider = Provider.of<
                                                                          UserViewModel>(
                                                                      context,
                                                                      listen:
                                                                          false);
                                                                  // provider.deleteUserMedia(
                                                                  //   mediaId,
                                                                  //   context,
                                                                  //   provider,
                                                                  // );

                                                                  bool res = await provider
                                                                      .deleteUserProfileImage(
                                                                          context,
                                                                          provider,
                                                                          userprovider);
                                                                  if (res) {
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop(); // Close the dialog
                                                                    // Navigator.pushNamed(
                                                                    //     context,
                                                                    //     RoutesName
                                                                    //         .user_profile_edit);
                                                                    Utils
                                                                        .flushBarErrorMessage(
                                                                      'Profile image removed successfully',
                                                                      context,
                                                                    );
                                                                  }
                                                                  print(res);
                                                                },
                                                                child: Text(
                                                                    "Delete"),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            })
                                          ];
                                        },
                                      );
                                    },
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 10,
                                    child: Container(
                                      height: 20,
                                      width: 21,
                                      decoration: BoxDecoration(
                                        color: CustomTheme.lightGreenColor,
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                      child: SvgPicture.asset(
                                        'assets/branding/home/edit.svg',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 13),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    user.name.toString(),
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    user.profession.toString(),
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                      color: CustomTheme.primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        margin:
                            const EdgeInsets.only(top: 23, left: 15, right: 15),
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
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.68,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.topLeft,
                                margin: const EdgeInsets.only(
                                    top: 31, left: 40, right: 40),
                                child: showPersonalInfo
                                    ? PersonalDataEdit(
                                        userData: user,
                                      )
                                    : WorkDataEdit(
                                        userData: user,
                                      ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

class WorkDataEdit extends StatefulWidget {
  User? userData;
  WorkDataEdit({super.key, required this.userData});

  @override
  State<WorkDataEdit> createState() => _WorkDataEditState();
}

class _WorkDataEditState extends State<WorkDataEdit> {
  dynamic userProvider;
  DateTime? _selectedDate;
  // late UserModel user;
  User? userData;

  TextEditingController companyNameController = TextEditingController();
  TextEditingController professionController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userData = widget.userData;
    Future.delayed(Duration.zero, () async {
      // userProvider = Provider.of<UserViewModel>(context, listen: false);
      // user = await userProvider.getUser();

      setState(() {});
    });
    companyNameController.text = 'XYZ company';
    professionController.text = widget.userData!.profession.toString();
    addressController.text = widget.userData!.address.toString();
  }

  @override
  void dispose() {
    companyNameController.dispose();
    professionController.dispose();
    addressController.dispose();
    // ... dispose other controllers
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: SizedBox(
            height: 50,
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.business,
                        color: const Color(0xFF8E8E8E),
                        size: 19,
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Text(
                        'Company Name',
                        style: const TextStyle(
                          color: Color(0xFF8E8E8E),
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 35,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, top: 0, bottom: 0),
                    child: TextFormField(
                      controller: companyNameController,
                      enabled: true,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 0.2,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 0.2,
                          ),
                        ),
                      ),
                      style: CustomTheme.base.copyWith(
                        fontFamily: 'Avenir',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: SizedBox(
            height: 50,
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.card_membership,
                        color: const Color(0xFF8E8E8E),
                        size: 19,
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Text(
                        'Profession',
                        style: const TextStyle(
                          color: Color(0xFF8E8E8E),
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 35,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, top: 0, bottom: 0),
                    child: TextFormField(
                      controller: professionController,
                      enabled: true,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 0.2,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 0.2,
                          ),
                        ),
                      ),
                      style: CustomTheme.base.copyWith(
                        fontFamily: 'Avenir',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: SizedBox(
            height: 50,
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: const Color(0xFF8E8E8E),
                        size: 19,
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Text(
                        'Address',
                        style: const TextStyle(
                          color: Color(0xFF8E8E8E),
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 35,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, top: 0, bottom: 0),
                    child: TextFormField(
                      controller: addressController,
                      enabled: true,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 0.2,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 0.2,
                          ),
                        ),
                      ),
                      style: CustomTheme.base.copyWith(
                        fontFamily: 'Avenir',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        GreenAndCancleButton(
          greenButtonText: 'Submit',
          onGreenButton: () {
            String newCompanyName = companyNameController.text;
            // String newEmail = emailController.text;
            String newProfession = professionController.text;
            String newAddress = addressController.text;
            Map data = {
              "id": userData!.id,
              "name": userData!.name,
              "address": newAddress,
              "profession": newProfession,
              "contact": userData!.contact
            };
            print(data);
            var provider = Provider.of<UserViewModel>(context, listen: false);
            provider.updateProfileData(data, userData!.id.toString());
            Utils.flushBarSucessMessage(
              'Profile detail updated successfully',
              context,
            );
            // Navigator.pop(context);
            // Alert(
            //   style: const AlertStyle(
            //     titleStyle: TextStyle(color: Colors.white),
            //     backgroundColor: CustomTheme.lightGreenColor,
            //   ),
            //   context: context,
            //   closeFunction: () {
            //     Navigator.pop(context);
            //   },
            //   buttons: [],
            //   image: SvgPicture.asset(
            //     'assets/branding/home/tick.svg',
            //     height: 41,
            //     width: 41,
            //   ),
            //   title: 'Upload Successful!',
            //   closeIcon: InkWell(
            //     child: SvgPicture.asset(
            //       'assets/branding/home/close.svg',
            //       height: 20,
            //       width: 20,
            //     ),
            //   ),
            // ).show();
          },
        ),
      ],
    );
  }
}

class PersonalDataEdit extends StatefulWidget {
  User? userData;
  PersonalDataEdit({super.key, required this.userData});

  @override
  State<PersonalDataEdit> createState() => _PersonalDataEditState();
}

class _PersonalDataEditState extends State<PersonalDataEdit> {
  dynamic userProvider;
  DateTime? _selectedDate;
  // late UserModel user;
  User? userData;
  TextEditingController dobController = TextEditingController();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userData = widget.userData;
    Future.delayed(Duration.zero, () async {
      // userProvider = Provider.of<UserViewModel>(context, listen: false);
      // user = await userProvider.getUser();

      setState(() {});
    });
    nameController.text = widget.userData!.name.toString();
    emailController.text = widget.userData!.email.toString();
    phoneController.text = widget.userData!.contact.toString();
    addressController.text = widget.userData!.address.toString();
    dobController.text = widget.userData!.dob.toString();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    dobController.dispose();
    // ... dispose other controllers
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        dobController.text = DateFormat('yyyy-MM-dd').format(_selectedDate!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: SizedBox(
            height: 50,
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.person,
                        color: const Color(0xFF8E8E8E),
                        size: 19,
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Text(
                        'Name',
                        style: const TextStyle(
                          color: Color(0xFF8E8E8E),
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 35,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, top: 0, bottom: 0),
                    child: TextFormField(
                      controller: nameController,
                      enabled: true,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 0.2,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 0.2,
                          ),
                        ),
                      ),
                      style: CustomTheme.base.copyWith(
                        fontFamily: 'Avenir',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: SizedBox(
            height: 50,
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.mail_outline,
                        color: const Color(0xFF8E8E8E),
                        size: 19,
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Text(
                        'Email',
                        style: const TextStyle(
                          color: Color(0xFF8E8E8E),
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 35,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, top: 0, bottom: 0),
                    child: TextFormField(
                      controller: emailController,
                      enabled: false,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 0.2,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 0.2,
                          ),
                        ),
                      ),
                      style: CustomTheme.base.copyWith(
                        fontFamily: 'Avenir',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: SizedBox(
            height: 50,
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.call_outlined,
                        color: const Color(0xFF8E8E8E),
                        size: 19,
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Text(
                        'Phone',
                        style: const TextStyle(
                          color: Color(0xFF8E8E8E),
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 35,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, top: 0, bottom: 0),
                    child: TextFormField(
                      controller: phoneController,
                      enabled: true,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 0.2,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 0.2,
                          ),
                        ),
                      ),
                      style: CustomTheme.base.copyWith(
                        fontFamily: 'Avenir',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: SizedBox(
            height: 50,
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: const Color(0xFF8E8E8E),
                        size: 19,
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Text(
                        'Address',
                        style: const TextStyle(
                          color: Color(0xFF8E8E8E),
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 35,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, top: 0, bottom: 0),
                    child: TextFormField(
                      controller: addressController,
                      enabled: true,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 0.2,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 0.2,
                          ),
                        ),
                      ),
                      style: CustomTheme.base.copyWith(
                        fontFamily: 'Avenir',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: SizedBox(
            height: 50,
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.calendar_month,
                        color: const Color(0xFF8E8E8E),
                        size: 19,
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Text(
                        'Date Of Birth',
                        style: const TextStyle(
                          color: Color(0xFF8E8E8E),
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 35,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, top: 0, bottom: 0),
                    child: GestureDetector(
                      onTap: () {
                        _selectDate(
                            context); // Call your date picker function here
                      },
                      child: AbsorbPointer(
                        child: TextField(
                          controller: dobController,
                          enabled: true,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 0.2,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 0.2,
                              ),
                            ),
                          ),
                          style: CustomTheme.base.copyWith(
                            fontFamily: 'Avenir',
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),

        // TextfieldWithIconAndText(
        //     isEditable: isEditable,
        //     icon: Icons.person,
        //     labelText: 'Name',
        //     controller: nameController,
        //     initialValue: nameController.text),
        // TextfieldWithIconAndText(
        //     isEditable: isEditable,
        //     icon: Icons.mail_outline,
        //     labelText: 'Email',
        //     controller: emailController,
        //     initialValue: emailController.text),
        // TextfieldWithIconAndText(
        //     isEditable: isEditable,
        //     icon: Icons.call_outlined,
        //     labelText: 'Phone',
        //     controller: phoneController,
        //     initialValue: phoneController.text),
        // TextfieldWithIconAndText(
        //   isEditable: isEditable,
        //   icon: Icons.location_on_outlined,
        //   labelText: 'Address',
        //   controller: addressController,
        //   initialValue: addressController.text,
        // ),
        // TextfieldWithIconAndText(
        //   isEditable: isEditable,
        //   icon: Icons.calendar_month,
        //   labelText: 'Date of Birth',
        //   initialValue: userData!.dob.toString(),
        // ),

        GreenAndCancleButton(
          greenButtonText: 'Submit',
          onGreenButton: () {
            String newName = nameController.text;
            // String newEmail = emailController.text;
            String newPhone = phoneController.text;
            String newAddress = addressController.text;
            String newDob = dobController.text;
            Map data = {
              "id": userData!.id,
              "name": newName,
              "address": newAddress,
              "contact": newPhone,
              "dob": newDob,
              "profession": userData!.profession
            };
            print(data);
            var provider = Provider.of<UserViewModel>(context, listen: false);
            provider.updateProfileData(data, userData!.id.toString());
            Utils.flushBarSucessMessage(
              'Profile detail updated successfully',
              context,
            );
            // Navigator.pop(context);
            // Alert(
            //   style: const AlertStyle(
            //     titleStyle: TextStyle(color: Colors.white),
            //     backgroundColor: CustomTheme.lightGreenColor,
            //   ),
            //   context: context,
            //   closeFunction: () {
            //     Navigator.pop(context);
            //   },
            //   buttons: [],
            //   image: SvgPicture.asset(
            //     'assets/branding/home/tick.svg',
            //     height: 41,
            //     width: 41,
            //   ),
            //   title: 'Upload Successful!',
            //   closeIcon: InkWell(
            //     child: SvgPicture.asset(
            //       'assets/branding/home/close.svg',
            //       height: 20,
            //       width: 20,
            //     ),
            //   ),
            // ).show();
          },
        ),
      ],
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

PopupMenuItem _buildPopupMenuItem(
    String title, IconData iconData, VoidCallback onTap) {
  return PopupMenuItem(
    child: ListTile(leading: Icon(iconData), title: Text(title), onTap: onTap),
  );
}
