import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fotos_mobile/models/media_model.dart';
import 'package:fotos_mobile/res/components/profile_component/green_and_cancle_button.dart';

import 'package:fotos_mobile/res/typo_theme_data.dart';
import 'package:fotos_mobile/utils/utils.dart';
import 'package:fotos_mobile/view_model/favourite_view_model.dart';
import 'package:fotos_mobile/view_model/gerne_view_model.dart';
import 'package:fotos_mobile/view_model/media_view_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multiselect_dropdown_flutter/multiselect_dropdown_flutter.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

import '../../../data/response/status.dart';
import '../../../models/media_list_model.dart';
import '../../../models/user_models.dart';
import '../../../res/app_urls.dart';
import '../../../utils/routes/routes_name.dart';
import '../../../view_model/image_open_view_model.dart';
import '../../../view_model/image_picker_view_model.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'dart:io';

import '../../../view_model/user_view_model.dart';

class MediaScreen extends StatefulWidget {
  const MediaScreen({super.key});

  @override
  State<MediaScreen> createState() => _MediaScreenState();
}

class _MediaScreenState extends State<MediaScreen> {
  // @override
  // void initState() {
  //   super.initState();
  // }
  bool isImagePicked = false;
  bool showPersonalInfo = true;
  String? userId;

  List<String> imageList = [
    'assets/photos/seagull.png',
    'assets/photos/tree.jpg',
    'assets/photos/seagull.png',
    'assets/photos/tree.jpg',
  ];
  TextEditingController mediaNameController = TextEditingController();
  TextEditingController mediaDescriptionController = TextEditingController();
  Future<UserModel> getUserData() => UserViewModel().getUser();
  String? token = '';
  FocusNode descriptionFocusNode = FocusNode();

  Future<bool> postFormData(
      {required String description,
      required String mediaList,
      required String title}) async {
    var userData = await getUserData();
    var token = userData.data?.accessToken.toString();

    var request = http.MultipartRequest(
        'POST', Uri.parse('${AppUrl.baseUrl}auth/medias'));

    // Set headers
    request.headers['Authorization'] =
        'Bearer $token'; // Replace with your actual token
    request.headers['Content-Type'] = 'multipart/form-data';

    // Add form fields
    request.fields['title'] = title;
    request.fields['description'] = description;
    request.fields['media_list_id'] = mediaList;
    request.fields['genres'] = '[1,2]';

    var image =
        Provider.of<ImagePickerModel>(context, listen: false).pickedImage!.path;
    // print(image);
    // Add image file
    var imageFile = File(image);
    var stream = http.ByteStream(imageFile.openRead());
    var length = await imageFile.length();

    var multipartFile = http.MultipartFile(
      'image',
      stream,
      length,
      filename: imageFile.path.split('/').last,
      contentType: MediaType(
          'image', 'jpeg'), // Adjust the content type based on your image type
    );

    // Add the image file to the request
    request.files.add(multipartFile);

    // Send the request and retrieve the response
    var response = await request.send().timeout(const Duration(seconds: 20));
    var result = await http.Response.fromStream(response);
    // print(result.body.toString());
    // Check the response status code
    if (response.statusCode == 302) {
      // Request redirected
      var redirectUrl = response.headers['location'];

      // Make a new request to the redirected URL
      var redirectResponse = await http.get(Uri.parse(redirectUrl!));

      // Handle the redirect response
      if (redirectResponse.statusCode == 200) {
        // Redirect successful
        print('Form data sent successfully after redirect!');
        return true;
      } else {
        // Redirect failed
        print(
            'Error sending form data after redirect. Status code: ${redirectResponse.statusCode}');
        return false;
      }
    } else if (response.statusCode == 200) {
      // Request successful
      print('Form data sent successfully!');
      return true;
    } else if (response.statusCode == 500) {
      // Request successful
      print(result.body);
    } else {
      // Request failed
      print('Error sending form data. Status code: ${response.statusCode}');
    }
    return false;
  }

  Future<bool> updateFormData({
    required String mediaId,
    required String description,
    required String mediaList,
    required dynamic image, // Change the type from 'var' to 'dynamic'
    required String title,
    required BuildContext context,
  }) async {
    print('$title $description $mediaList');
    var userData = await getUserData();
    var token = userData.data?.accessToken.toString();

    var request = http.MultipartRequest(
        'POST', Uri.parse('${AppUrl.baseUrl}auth/medias/$mediaId'));

    // Set headers
    request.headers['Authorization'] = 'Bearer $token';

    // Add form fields
    request.fields['title'] = title;
    request.fields['description'] = description;
    request.fields['media_list_id'] = mediaList;
    request.fields['genres'] = '1';
    request.fields['_method'] = 'put';

    var pickedImage =
        Provider.of<ImagePickerModel>(context, listen: false).pickedImage;

    if (pickedImage != null) {
      // New image is picked
      var imageFile = File(pickedImage.path);

      var stream = http.ByteStream(imageFile.openRead());
      var length = await imageFile.length();

      var multipartFile = http.MultipartFile(
        'image',
        stream,
        length,
        filename: imageFile.path.split('/').last,
        contentType: MediaType('image', 'jpeg'),
      );

      // Add the image file to the request
      request.files.add(multipartFile);
    } else {
      // Handle the case when pickedImage is null
      print('No image selected.');

      // Create a new map to hold the updated form fields
      var updatedFields = {
        'title': title,
        'description': description,
        'media_list_id': mediaList,
        'genres': '1',
        '_method': 'put',
      };

      // Update only the other values except for the image
      updatedFields.forEach((key, value) {
        request.fields[key] = value;
      });
    }

    // Send the request and retrieve the response
    var response = await request.send().timeout(const Duration(seconds: 20));
    var result = await http.Response.fromStream(response);

    // Check the response status code
    if (response.statusCode == 302) {
      // Request redirected
      var redirectUrl = response.headers['location'];

      // Make a new request to the redirected URL
      var redirectResponse = await http.get(Uri.parse(redirectUrl!));

      // Handle the redirect response
      if (redirectResponse.statusCode == 200) {
        // Redirect successful
        print('Form data sent successfully after redirect!');
        return true;
      } else {
        // Redirect failed
        print(
            'Error sending form data after redirect. Status code: ${redirectResponse.statusCode}');
        return false;
      }
    } else if (response.statusCode == 200) {
      // Request successful
      print('Form data sent successfully!');
      return true;
    } else if (response.statusCode == 500) {
      // Request successful
      print(result.body);
    } else {
      // Request failed
      print('Error sending form data. Status code: ${response.statusCode}');
    }
    return false;
  }

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      print('widget key media screen is ${widget.key}');
      var userProvider = Provider.of<UserViewModel>(context, listen: false);
      userProvider.getUser().then((value) {
        setState(() {
          userId = value.data?.user!.id.toString();

          if (userId != null) {
            Future.delayed(const Duration(seconds: 1), () {
              Provider.of<MediaViewModel>(context, listen: false)
                  .fetchUserMedia(userId!);
              Provider.of<MediaViewModel>(context, listen: false)
                  .fetchUserMediaList();
              final arguments = ModalRoute.of(context)?.settings.arguments
                  as Map<String, dynamic>?;

              if (arguments != null &&
                  arguments.containsKey('fromUpload') &&
                  arguments['fromUpload']) {
                _showBottomSheetPOST(context);
              }
            });
          }
        });
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    mediaDescriptionController.dispose();
    mediaNameController.dispose();
  }

  void _showBottomSheetPOST(BuildContext context) {
    descriptionFocusNode.addListener(() {
      if (!descriptionFocusNode.hasFocus) {
        // Focus lost, dismiss the keyboard
        FocusScope.of(context).unfocus();
      }
    });
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
                        builder: (context, imagePickerModel, child) {
                          isImagePicked = imagePickerModel.pickedImage != null
                              ? true
                              : false;
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
                                  child: SizedBox(
                                    width: 200,
                                    child: Text(
                                      overflow: TextOverflow.ellipsis,
                                      // filePath != null ? filePath! :
                                      imagePickerModel.pickedImage != null
                                          ? imagePickerModel.pickedImage!.path
                                          : 'Select File',
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 3),
                                  child: InkWell(
                                    onTap: () async {
                                      await imagePickerModel
                                          .pickImage(ImageSource.gallery);
                                      // .pickImage(ImageSource.gallery);
                                      setState(() {});
                                    },
                                    child: Container(
                                      width: 86,
                                      height: 23,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.blue,
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
                        },
                      )
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
                          'Choose Collection',
                          style: CustomTheme.base.copyWith(
                              fontSize: 17, fontWeight: FontWeight.w200),
                        ),
                      ),
                      Consumer<MediaViewModel>(
                        builder: (context, value, child) {
                          print(value.selectedCollection);
                          print(value.mediaListItems);
                          if (value.userMediaList.data == null) {
                            return CircularProgressIndicator.adaptive();
                          } else {
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
                              child: DropdownButton<String>(
                                isExpanded: true,
                                underline:
                                    Container(), // Removes the default underline
                                value: value.selectedCollection
                                    .toString(), // Holds the currently selected collection ID
                                onChanged: (newValue) {
                                  // print("object");

                                  value.setselectedCollection(newValue!);
                                  // print(value.selectedCollection);
                                },
                                // onChanged: (value) {},
                                items: value.userMediaList.data!.map((item) {
                                  return DropdownMenuItem<String>(
                                    value: item.id.toString(),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 16),
                                      child: Text(
                                        item.name.toString(),
                                        style: CustomTheme.base.copyWith(
                                          color: CustomTheme.lightTextColor
                                              .withOpacity(0.4),
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            );
                          }
                        },
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
                          'Select Gerne',
                          style: CustomTheme.base.copyWith(
                              fontSize: 17, fontWeight: FontWeight.w200),
                        ),
                      ),
                      Consumer<GenersViewModel>(
                          builder: (context, value, child) {
                        // print("called this ml ${value.gerne}");
                        return MultiSelectDropdown.simpleList(
                          list: value.geners,
                          initiallySelected: const [],
                          onChange: (newList) {
                            // your logic
                          },
                          includeSearch: true,
                          includeSelectAll: false,
                          isLarge: true, // Modal size will be a little large
                          // Give a definite width when rendering this widget in a row
                          width: double.infinity, // Must be a definite number
                          boxDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
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
                        child: TextFormField(
                          controller: mediaNameController,
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 16),
                            hintText: 'Enter Media Name',
                            hintStyle: CustomTheme.base.copyWith(
                              color:
                                  CustomTheme.lightTextColor.withOpacity(0.4),
                              fontWeight: FontWeight.w300,
                            ),
                            border: InputBorder.none,
                          ),
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
                            fontSize: 17,
                            fontWeight: FontWeight.w200,
                          ),
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
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16, top: 3),
                          child: TextField(
                            focusNode:
                                descriptionFocusNode, // Attach the FocusNode here
                            controller: mediaDescriptionController,
                            // maxLines: null,
                            decoration: InputDecoration(
                              hintText: 'Enter Media Description',
                              hintStyle: CustomTheme.base.copyWith(
                                color:
                                    CustomTheme.lightTextColor.withOpacity(0.4),
                                fontWeight: FontWeight.w300,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                GreenAndCancleButton(
                  greenButtonText: 'Submit',
                  onGreenButton: () async {
                    String title = mediaNameController.text;
                    String description = mediaDescriptionController.text;
                    var medialistData = MediaListData(
                      id: int.parse(
                          Provider.of<MediaViewModel>(context, listen: false)
                              .selectedCollection!),
                    );

                    String mediaList = medialistData.id.toString();

                    if (title == '' && title.isEmpty) {
                      Utils.flushBarErrorMessage(
                          'Title can\'t be empty', context);
                    } else if (description == '' && description.isEmpty) {
                      Utils.flushBarErrorMessage(
                          'Description can\'t be empty', context);
                    } else if (!isImagePicked) {
                      Utils.flushBarErrorMessage(
                          'Select media to upload', context);
                    } else {
                      bool res = await postFormData(
                          title: title.trim(),
                          description: description.trim(),
                          mediaList: mediaList);
                      print('$title $description $mediaList');
                      if (res == true) {
                        Navigator.pop(context);
                        Navigator.pushNamedAndRemoveUntil(
                            context, RoutesName.media, (route) => true);
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
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showBottomSheetUpdate(BuildContext context, userData) {
    TextEditingController mediaNameController =
        TextEditingController(text: userData['data']['title']);
    TextEditingController mediaDescriptionController =
        TextEditingController(text: userData['data']['description']);

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
                    'Update Your Creativity',
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
                        builder: (context, imagePickerModel, child) {
                          isImagePicked = imagePickerModel.pickedImage != null
                              ? true
                              : false;
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
                                  child: SizedBox(
                                    width: 200,
                                    child: Text(
                                      overflow: TextOverflow.ellipsis,
                                      // filePath != null ? filePath! :
                                      imagePickerModel.pickedImage != null
                                          ? imagePickerModel.pickedImage!.path
                                          : userData['data']['image_path']
                                              .toString(),
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 3),
                                  child: InkWell(
                                    onTap: () async {
                                      await imagePickerModel
                                          .pickImage(ImageSource.gallery);
                                      // .pickImage(ImageSource.gallery);
                                      setState(() {});
                                    },
                                    child: Container(
                                      width: 86,
                                      height: 23,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.blue,
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
                        },
                      )
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
                          'Choose Collection',
                          style: CustomTheme.base.copyWith(
                              fontSize: 17, fontWeight: FontWeight.w200),
                        ),
                      ),
                      Consumer<MediaViewModel>(
                        builder: (context, value, child) {
                          print(
                              'update modal data ${userData['data']['media_list']['id']}');
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
                            child: DropdownButton<String>(
                              isExpanded: true,
                              underline:
                                  Container(), // Removes the default underline
                              value: userData['data']['media_list']['id']
                                  .toString(),
                              onChanged: (newValue) {
                                value.setselectedCollection(newValue!);
                                // Update the value of 'userData['data']['media_list']['id']' to the selected dropdown value
                                setState(() {
                                  userData['data']['media_list']['id'] =
                                      newValue;
                                });
                              },
                              items: value.userMediaList.data!.map((item) {
                                return DropdownMenuItem<String>(
                                  value: item.id.toString(),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 16),
                                    child: Text(
                                      item.name.toString(),
                                      style: CustomTheme.base.copyWith(
                                        color: CustomTheme.lightTextColor
                                            .withOpacity(0.4),
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          );
                        },
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
                          'Select Gerne',
                          style: CustomTheme.base.copyWith(
                              fontSize: 17, fontWeight: FontWeight.w200),
                        ),
                      ),
                      Consumer<GenersViewModel>(
                          builder: (context, value, child) {
                        // print("called this ml ${value.gerne}");
                        return MultiSelectDropdown.simpleList(
                          list: value.geners,
                          initiallySelected: const [],
                          onChange: (newList) {
                            // your logic
                          },
                          includeSearch: true,
                          includeSelectAll: false,
                          isLarge: true, // Modal size will be a little large
                          // Give a definite width when rendering this widget in a row
                          width: double.infinity, // Must be a definite number
                          boxDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
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
                        child: TextFormField(
                          // initialValue: userData['title'],
                          controller: mediaNameController,
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 16),
                            hintText: 'Enter Media Name',
                            hintStyle: CustomTheme.base.copyWith(
                              color:
                                  CustomTheme.lightTextColor.withOpacity(0.4),
                              fontWeight: FontWeight.w300,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.fromLTRB(28, 0, 27, 20),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Padding(
                //         padding: const EdgeInsets.only(bottom: 10),
                //         child: Text(
                //           'Media Description',
                //           style: CustomTheme.base.copyWith(
                //             fontSize: 17,
                //             fontWeight: FontWeight.w200,
                //           ),
                //         ),
                //       ),
                //       Container(
                //         alignment: Alignment.topLeft,
                //         width: 336,
                //         height: 124,
                //         decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(10),
                //           color: const Color(0xFFF9F9F9),
                //           border: Border.all(
                //             color: const Color(0xFFCDECFF),
                //           ),
                //         ),
                //         child: Padding(
                //           padding: const EdgeInsets.only(left: 16, top: 3),
                //           child: TextFormField(
                //             // initialValue: mediaDescription,
                //             controller: mediaDescriptionController,
                //             maxLines: null, // Allow multiple lines of text
                //             decoration: InputDecoration(
                //               hintText: 'Enter Media Description',
                //               hintStyle: CustomTheme.base.copyWith(
                //                 color:
                //                     CustomTheme.lightTextColor.withOpacity(0.4),
                //                 fontWeight: FontWeight.w300,
                //               ),
                //               border: InputBorder.none,
                //             ),
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
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
                            fontSize: 17,
                            fontWeight: FontWeight.w200,
                          ),
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
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16, top: 3),
                          child: TextField(
                            focusNode:
                                descriptionFocusNode, // Attach the FocusNode here
                            controller: mediaDescriptionController,
                            // maxLines: null,
                            decoration: InputDecoration(
                              hintText: 'Enter Media Description',
                              hintStyle: CustomTheme.base.copyWith(
                                color:
                                    CustomTheme.lightTextColor.withOpacity(0.4),
                                fontWeight: FontWeight.w300,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                GreenAndCancleButton(
                  greenButtonText: 'Submit',
                  onGreenButton: () async {
                    String title = mediaNameController.text;
                    String description = mediaDescriptionController.text;

                    String mediaList =
                        userData['data']['media_list']['id'].toString();

                    if (title == '' && title.isEmpty) {
                      Utils.flushBarErrorMessage(
                          'Title can\'t be empty', context);
                    } else if (description == '' && description.isEmpty) {
                      Utils.flushBarErrorMessage(
                          'Description can\'t be empty', context);
                    } else {
                      print('media ttile ${title.trim()}');
                      bool res = await updateFormData(
                          context: context,
                          mediaId: userData['data']['id'].toString(),
                          image: userData['data']['image_path'],
                          title: title.trim(),
                          description: description.trim(),
                          mediaList: mediaList);

                      if (res == true) {
                        Navigator.pop(context);
                        // Navigator.pushNamed(context, RoutesName.media);
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
                            title: 'Updated Sucessful !',
                            closeIcon: InkWell(
                              child: SvgPicture.asset(
                                'assets/branding/home/close.svg',
                                height: 20,
                                width: 20,
                              ),
                            )).show();
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var imageOpenViewModel = Provider.of<ImageOpenViewModel>(context);
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
              'My Medias',
              style: TextStyle(color: Colors.black),
            ),
          ),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 5),
              child: CircleAvatar(
                  radius: 19,
                  backgroundColor: Colors.black,
                  child: Consumer<MediaViewModel>(
                    builder: (context, value, child) {
                      return IconButton(
                          icon: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          onPressed: () async {
                            // await Provider.of<GenersViewModel>(context,
                            //         listen: false)
                            //     .fetchGernes();
                            await value.userMediaList;

                            Future.delayed(const Duration(seconds: 1));
                            if (!value.loading) {
                              _showBottomSheetPOST(context);
                            }
                          });
                    },
                  )),
            ),
          ],
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 14, bottom: 14, left: 24),
                      child: Text(
                        "Images",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 19,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Consumer<MediaViewModel>(
                      builder: (context, value, child) {
                        switch (value.userMedia.status) {
                          case Status.LOADING:
                            return Center(
                              child: CircularProgressIndicator.adaptive(),
                            );
                          case Status.ERROR:
                            return Text(value.userMedia.message.toString());
                          case Status.COMPLETED:
                            return value.userMedia.data!.isNotEmpty
                                ? SizedBox(
                                    height: MediaQuery.of(context).size.height,
                                    child: StaggeredGridView.countBuilder(
                                      crossAxisCount: 2,
                                      itemCount: value.userMedia.data!.length,
                                      itemBuilder: (context, index) {
                                        String imagePath = value
                                            .userMedia.data![index].imagePath
                                            .toString();
                                        String imageUrl;

                                        if (imagePath.startsWith('http')) {
                                          imageUrl = imagePath;
                                        } else {
                                          imageUrl =
                                              '${AppUrl.baseImageStorageUrl}$imagePath';
                                        }

                                        bool isFavorite = value.userMedia
                                                .data![index].isFavourite ??
                                            false;

                                        return Card(
                                          child: Stack(
                                            alignment: Alignment.topRight,
                                            children: [
                                              InkWell(
                                                onTap: () async {
                                                  final String slug = value
                                                      .userMedia
                                                      .data![index]
                                                      .slug
                                                      .toString();
                                                  final String mediaId = value
                                                      .userMedia.data![index].id
                                                      .toString();
                                                  await imageOpenViewModel
                                                      .fetchImageOpenMedia(slug,
                                                          context, mediaId);

                                                  print(
                                                      'media screen image open ${slug}');
                                                  if (!imageOpenViewModel
                                                      .loading) {
                                                    if (context.mounted) {
                                                      Navigator.pushNamed(
                                                          context,
                                                          RoutesName
                                                              .image_open);
                                                    }
                                                  }
                                                },
                                                child: Image.network(
                                                  imageUrl,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Positioned(
                                                top: 3,
                                                right: 2,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    IconButton(
                                                      onPressed: () async {
                                                        if (isFavorite) {
                                                          final provider = Provider
                                                              .of<FavouriteViewModel>(
                                                                  context,
                                                                  listen:
                                                                      false);
                                                          provider
                                                              .deleteFavouriteMedia(
                                                                  value
                                                                      .userMedia
                                                                      .data![
                                                                          index]
                                                                      .id
                                                                      .toString(),
                                                                  context,
                                                                  provider)
                                                              .catchError(
                                                                  (error) {
                                                            // Handle the error case
                                                            print(error);
                                                          });
                                                        } else {
                                                          final provider = Provider
                                                              .of<FavouriteViewModel>(
                                                                  context,
                                                                  listen:
                                                                      false);
                                                          provider
                                                              .addFavouriteMedia(
                                                                  value
                                                                      .userMedia
                                                                      .data![
                                                                          index]
                                                                      .id
                                                                      .toString(),
                                                                  context,
                                                                  provider)
                                                              .catchError(
                                                                  (error) {
                                                            // Handle the error case
                                                            print(error);
                                                          });
                                                        }
                                                      },
                                                      icon: Icon(
                                                        isFavorite
                                                            ? Icons.favorite
                                                            : Icons
                                                                .favorite_outline,
                                                        color: isFavorite
                                                            ? Colors.red
                                                            : Colors.white,
                                                      ),
                                                    ),
                                                    InkWell(
                                                      onTap: () async {
                                                        await value
                                                            .fetchUserMediaList();
                                                        // print(value
                                                        //     .authMediaListItems);
                                                        // Future.delayed(
                                                        //     const Duration(
                                                        //         seconds: 1));
                                                        // print(value.userMedia
                                                        //     .data![index].id
                                                        //     .toString());
                                                        final String slug =
                                                            value
                                                                .userMedia
                                                                .data![index]
                                                                .slug
                                                                .toString();
                                                        final String mediaId =
                                                            value.userMedia
                                                                .data![index].id
                                                                .toString();

                                                        await imageOpenViewModel
                                                            .fetchImageOpenMedia(
                                                                slug,
                                                                context,
                                                                mediaId);
                                                        var userData =
                                                            imageOpenViewModel
                                                                .data;
                                                        print(
                                                            'user data media screen is $userData');

                                                        if (value.userMediaList
                                                                .status !=
                                                            Status.LOADING) {
                                                          _showBottomSheetUpdate(
                                                              context,
                                                              userData);
                                                        }

                                                        // if (!value
                                                        //     .authLoading) {}
                                                      },
                                                      child: const Icon(
                                                        Icons.edit,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        final String mediaId =
                                                            value.userMedia
                                                                .data![index].id
                                                                .toString();

                                                        showDialog(
                                                          context: context,
                                                          builder: (BuildContext
                                                              context) {
                                                            return Dialog(
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.0),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        16.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  children: [
                                                                    Text(
                                                                      "Are you sure you want to delete this item?",
                                                                      style:
                                                                          TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        fontSize:
                                                                            18.0,
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                        height:
                                                                            24.0),
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceEvenly,
                                                                      children: [
                                                                        ElevatedButton(
                                                                          style:
                                                                              ButtonStyle(
                                                                            backgroundColor:
                                                                                MaterialStateProperty.all(
                                                                              Colors.grey,
                                                                            ),
                                                                          ),
                                                                          onPressed:
                                                                              () {
                                                                            Navigator.of(context).pop(); // Close the dialog
                                                                          },
                                                                          child:
                                                                              Text("Cancel"),
                                                                        ),
                                                                        ElevatedButton(
                                                                          style:
                                                                              ButtonStyle(
                                                                            backgroundColor:
                                                                                MaterialStateProperty.all(
                                                                              Colors.red,
                                                                            ),
                                                                          ),
                                                                          onPressed:
                                                                              () async {
                                                                            final provider =
                                                                                Provider.of<MediaViewModel>(context, listen: false);
                                                                            await provider.deleteUserMedia(
                                                                              mediaId,
                                                                              context,
                                                                              provider,
                                                                            );
                                                                            Navigator.of(context).pop(); // Close the dialog
                                                                            Utils.flushBarErrorMessage(
                                                                              'User media deleted successfully',
                                                                              context,
                                                                            );
                                                                          },
                                                                          child:
                                                                              Text("Delete"),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                      child: const Icon(
                                                        Icons.delete_forever,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                      staggeredTileBuilder: (index) =>
                                          StaggeredTile.fit(1),
                                      mainAxisSpacing: 8.0,
                                      crossAxisSpacing: 8.0,
                                    ),
                                  )
                                : Center(
                                    child: Container(
                                      child: const Text(
                                          'No item added to favourite'),
                                    ),
                                  );
                          default:
                            return Container();
                        }
                      },
                    )
                  ],
                ),
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 14, bottom: 14, left: 24),
                        child: Text(
                          "Videos",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 19,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: SizedBox(
                          height: 226,
                          child: CustomScrollView(
                            slivers: [
                              SliverPadding(
                                padding: const EdgeInsets.all(5),
                                sliver: SliverMasonryGrid(
                                  delegate: SliverChildBuilderDelegate(
                                    (context, index) => Card(
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Image.asset(
                                            imageList[index],
                                          ),
                                          const Positioned(
                                            top: 0,
                                            right: 0,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Icon(
                                                  Icons.favorite_outline,
                                                  color: Colors.white,
                                                ),
                                                Icon(
                                                  Icons.bookmark_add_outlined,
                                                  color: Colors.white,
                                                ),
                                                Icon(
                                                  Icons.share_outlined,
                                                  color: Colors.white,
                                                ),
                                              ],
                                            ),
                                          ),
                                          const Icon(
                                            Icons.play_circle_fill_outlined,
                                            size: 40,
                                            color: Colors.white,
                                          ),
                                        ],
                                      ),
                                    ),
                                    childCount: 1,
                                  ),
                                  gridDelegate:
                                      const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: ShowMore(
                          text: 'Show More',
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ShowMore extends StatelessWidget {
  final String text;
  const ShowMore({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: InkWell(
      onTap: () {}, // Added onTap callback
      child: Container(
        width: 111,
        height: 32,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26),
          color: CustomTheme.primaryColor,
        ),
        padding: const EdgeInsets.only(
          top: 5,
          bottom: 6,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text,
              style: const TextStyle(
                color: CustomTheme.whiteTextColor,
                fontSize: 15,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class CardWithImageAndText extends StatelessWidget {
  final String imagePath;
  final String text;

  const CardWithImageAndText({
    Key? key,
    required this.imagePath,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 81,
      width: 159,
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(18),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              imagePath,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Text(
              text,
              style: CustomTheme.base.copyWith(
                color: CustomTheme.whiteTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
