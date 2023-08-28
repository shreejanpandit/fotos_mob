// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:fotos_mobile/res/components/profile_component/green_and_cancle_button.dart';
import 'package:fotos_mobile/res/typo_theme_data.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../models/user_models.dart';
import '../../res/app_urls.dart';
import '../../utils/utils.dart';
import '../../view_model/image_picker_view_model.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import '../../view_model/media_view_model.dart';
import '../../view_model/user_view_model.dart';

class CollectionScreen extends StatefulWidget {
  const CollectionScreen({super.key});

  @override
  State<CollectionScreen> createState() => _CollectionScreenState();
}

class _CollectionScreenState extends State<CollectionScreen> {
  bool showPersonalInfo = true;
  // MediaViewModel _mediaViewModel = MediaViewModel();
  bool isImagePicked = false;
  TextEditingController collectionNameController = TextEditingController();
  TextEditingController collectionDescriptionController =
      TextEditingController();
  Future<UserModel> getUserData() => UserViewModel().getUser();
  ValueNotifier<String> selectedValueNotifier = ValueNotifier<String>('photo');

  Future<bool> postCollectionFormData(
      {required String description,
      required String collectionType,
      required String title}) async {
    var userData = await getUserData();
    var token = userData.data?.accessToken.toString();

    var request = http.MultipartRequest(
        'POST', Uri.parse('${AppUrl.baseUrl}auth/media-lists'));

    // Set headers
    request.headers['Authorization'] =
        'Bearer $token'; // Replace with your actual token
    request.headers['Content-Type'] = 'multipart/form-data';

    // Add form fields
    request.fields['name'] = title;
    request.fields['description'] = description;
    request.fields['type'] = collectionType;

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
    print(result.body.toString());
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
    } else if (response.statusCode == 500) {
      // Request successful
      print(result.body);
    } else {
      // Request failed
      print('Error sending form data. Status code: ${response.statusCode}');
    }
    return false;
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
                    'Create your Collection',
                    style: CustomTheme.base
                        .copyWith(fontSize: 22, fontWeight: FontWeight.w500),
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(28, 31, 27, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text(
                          'Choose Collection Cover',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                      ),
                      Consumer<ImagePickerModel>(
                        builder: (context, _imagePickerModel, child) {
                          isImagePicked = _imagePickerModel.pickedImage != null
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
                                  child: Container(
                                    width: 200,
                                    child: Text(
                                      overflow: TextOverflow.ellipsis,
                                      // filePath != null ? filePath! :
                                      _imagePickerModel.pickedImage != null
                                          ? _imagePickerModel.pickedImage!.path
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
                                      await _imagePickerModel
                                          .pickImage(ImageSource.gallery);
                                      // .pickImage(ImageSource.gallery);
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
                          'Collection Name',
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
                          controller: collectionNameController,
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 16),
                            hintText: 'Enter Collection Name',
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
                      const Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text('Collection Type'),
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
                        child: ValueListenableBuilder(
                          valueListenable: selectedValueNotifier,
                          builder: (BuildContext context, String selectedValue,
                              Widget? child) {
                            return DropdownButton<String>(
                              isExpanded: true,
                              underline:
                                  Container(), // Removes the default underline
                              value:
                                  selectedValue, // Holds the currently selected collection ID
                              onChanged: (newValue) {
                                selectedValueNotifier.value = newValue!;
                              },
                              items: [
                                'photo',
                                'video',
                                'art',
                                'illustration',
                              ].map((item) {
                                return DropdownMenuItem<String>(
                                  value: item,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 16),
                                    child: Text(
                                      item,
                                      style: CustomTheme.base.copyWith(
                                        color: CustomTheme.lightTextColor
                                            .withOpacity(0.4),
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            );
                          },
                        ),
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
                          'Collection Description',
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
                            controller: collectionDescriptionController,
                            maxLines: null, // Allow multiple lines of text
                            decoration: InputDecoration(
                              hintText: 'Enter Description',
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
                    String title = collectionNameController.text;
                    String description = collectionDescriptionController.text;
                    String collectionType =
                        selectedValueNotifier.value.toString();
                    if (title == '' && title.isEmpty) {
                      Utils.flushBarErrorMessage(
                          'Collectoin name can\'t be empty', context);
                    } else if (description == '' && description.isEmpty) {
                      Utils.flushBarErrorMessage(
                          'Description can\'t be empty', context);
                    } else if (!isImagePicked) {
                      Utils.flushBarErrorMessage(
                          'Select media to upload', context);
                    } else {
                      bool res = await postCollectionFormData(
                          title: title.trim(),
                          description: description.trim(),
                          collectionType: collectionType);

                      if (res == true) {
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
            'My collection',
            style: TextStyle(color: Colors.black),
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 5),
            child: CircleAvatar(
              radius: 19,
              backgroundColor: Colors.black,
              child: IconButton(
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                onPressed: () {
                  _showBottomSheet(context);
                },
              ),
            ),
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 24, right: 26, bottom: 28),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 14, bottom: 18),
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
              Column(
                children: [
                  Consumer<MediaViewModel>(
                    builder: (context, value, child) {
                      // print(
                      //     'Hi media view consumer collection screen ${value.authMediaListItems}');
                      final authMediaListItems = value.userMediaList.data;
                      print(
                          'authMediaListItems length: ${authMediaListItems!.length}');

                      final itemCount = authMediaListItems!.length;
                      final rows = (itemCount / 2).ceil();

                      return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: authMediaListItems.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 10, mainAxisExtent: 80,
                          crossAxisSpacing: 10,
                          // childAspectRatio: 8 /
                          //     8, // Adjust the aspect ratio to match desired height and width
                        ),
                        itemBuilder: (context, index) {
                          String imagePath =
                              authMediaListItems[index].path.toString();

                          String imageUrl;

                          if (imagePath.startsWith('http')) {
                            imageUrl = imagePath;
                          } else {
                            imageUrl =
                                '${AppUrl.baseImageStorageUrl}$imagePath';
                          }

                          return CardWithImageAndText(
                            imagePath: imageUrl,
                            text: authMediaListItems[index].name.toString(),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
              const ShowMore(
                text: 'Show More',
              ),
              const Padding(
                padding: EdgeInsets.only(top: 14, bottom: 18),
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
              Column(
                children: [
                  Consumer<MediaViewModel>(
                    builder: (context, value, child) {
                      // print(
                      //     'Hi media view consumer collection screen ${value.authMediaListItems}');
                      final authMediaListItems = value.authMediaListItems;
                      final itemCount = authMediaListItems.length;
                      final rows = (itemCount / 2).ceil();

                      return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: itemCount,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 10, mainAxisExtent: 80,
                          crossAxisSpacing: 10,
                          // childAspectRatio: 8 /
                          //     8, // Adjust the aspect ratio to match desired height and width
                        ),
                        itemBuilder: (context, index) {
                          String imagePath = value.authMediaListItems[index]
                                  ['image_path']
                              .toString();
                          String imageUrl;

                          if (imagePath.startsWith('http')) {
                            imageUrl = imagePath;
                          } else {
                            imageUrl =
                                '${AppUrl.baseImageStorageUrl}$imagePath';
                          }

                          return CardWithImageAndText(
                            imagePath: imageUrl,
                            text: authMediaListItems[index]['name'],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
              const ShowMore(
                text: 'Show More',
              ),
            ],
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
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Container(
        height: 81,
        width: 159,
        decoration: BoxDecoration(
          // color: CustomTheme.faintTextColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.network(
              imagePath,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset('assets/photos/saturn.png');
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Center(
                child: Text(
                  text,
                  style: CustomTheme.base.copyWith(
                    color: CustomTheme.whiteTextColor,
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
