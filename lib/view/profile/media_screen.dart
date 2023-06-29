import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fotos_mobile/res/components/profile_component/green_and_cancle_button.dart';

import 'package:fotos_mobile/res/typo_theme_data.dart';
import 'package:fotos_mobile/view_model/gerne_view_model.dart';
import 'package:fotos_mobile/view_model/media_view_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multiselect_dropdown_flutter/multiselect_dropdown_flutter.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../models/image_open_model.dart';
import '../../models/user_models.dart';
import '../../view_model/image_picker_view_model.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'dart:io';

import '../../view_model/user_view_model.dart';

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

  bool showPersonalInfo = true;

  List<String> imageList = [
    'assets/photos/seagull.png',
    'assets/photos/tree.jpg',
    'assets/photos/seagull.png',
    'assets/photos/tree.jpg',
  ];
  // final ImagePickerModel _imagePickerModel = ImagePickerModel();
  MediaViewModel _mediaViewModel = MediaViewModel();
  TextEditingController mediaNameController = TextEditingController();
  TextEditingController mediaDescriptionController = TextEditingController();
  Future<UserModel> getUserData() => UserViewModel().getUser();
  String? token = '';

  Future<bool> postFormData(
      {required String description,
      required String mediaList,
      required String title}) async {
    var userData = await getUserData();
    var token = userData.token.toString();

    var request = http.MultipartRequest(
        'POST', Uri.parse('http://192.168.18.4:8000/api/v1/auth/medias'));

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
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                      ),
                      Consumer<ImagePickerModel>(
                        builder: (context, _imagePickerModel, child) {
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
                                      style: TextStyle(
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
                                      setState(() {});
                                    },
                                    child: Container(
                                      width: 86,
                                      height: 23,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.blue,
                                      ),
                                      child: Center(
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
                      const Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text('Choose Collection'),
                      ),
                      // Consumer<MediaViewModel>(
                      //   builder: (context, value, child) {
                      //     return Container(
                      //       width: 336,
                      //       height: 45.25,
                      //       decoration: BoxDecoration(
                      //         borderRadius: BorderRadius.circular(10),
                      //         color: const Color(0xFFF9F9F9),
                      //         border: Border.all(
                      //           color: const Color(0xFFCDECFF),
                      //         ),
                      //       ),
                      //       child: DropdownButton<String>(
                      //         onChanged: (value) {},
                      //         isExpanded: true,
                      //         underline:
                      //             Container(), // Removes the default underline
                      //         // value: value
                      //         //     .selectedCollection, // Holds the currently selected collection ID
                      //         // onChanged: (newValue) {
                      //         //   setState(() {
                      //         //     value.selectedCollection = newValue!;
                      //         //   });
                      //         // },
                      //         items: value.mediaListItems.map((item) {
                      //           return DropdownMenuItem<String>(
                      //             value: item['id'],
                      //             child: Padding(
                      //               padding: const EdgeInsets.only(left: 16),
                      //               child: Text(
                      //                 item['name'],
                      //                 style: CustomTheme.base.copyWith(
                      //                   color: CustomTheme.lightTextColor
                      //                       .withOpacity(0.4),
                      //                   fontWeight: FontWeight.w300,
                      //                 ),
                      //               ),
                      //             ),
                      //           );
                      //         }).toList(),
                      //       ),
                      //     );
                      //   },
                      // ),
                      Consumer<MediaViewModel>(
                        builder: (context, value, child) {
                          // print(value.selectedCollection);
                          // print(value.mediaListItems);
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
                                print(value.selectedCollection);
                              },
                              // onChanged: (value) {},
                              items: value.mediaListItems.map((item) {
                                return DropdownMenuItem<String>(
                                  value: item['id'],
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 16),
                                    child: Text(
                                      item['name'],
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
                Consumer<GenersViewModel>(builder: (context, value, child) {
                  print("called this ml ${value.geners}");
                  return MultiSelectDropdown.simpleList(
                    list: value.geners,
                    initiallySelected: const [],
                    onChange: (newList) {
                      // your logic
                    },
                    includeSearch: true,
                    includeSelectAll: true,
                    isLarge: true, // Modal size will be a little large
                    // Give a definite width when rendering this widget in a row
                    width: 150, // Must be a definite number
                    boxDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  );
                }),
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
                            controller: mediaDescriptionController,
                            maxLines: null, // Allow multiple lines of text
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
                    var medialistData = MediaList(
                      id: int.parse(
                          Provider.of<MediaViewModel>(context, listen: false)
                              .selectedCollection!),
                    );
                    String mediaList = medialistData.id.toString();

                    // print(mediaList);
                    bool res = await postFormData(
                        title: title,
                        description: description,
                        mediaList: mediaList);

                    if (res == true) {
                      Navigator.pop(context);
                      Alert(
                          style: AlertStyle(
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
                            await Provider.of<GenersViewModel>(context,
                                    listen: false)
                                .fetchGernes();
                            await value.fetchMediaList();

                            Future.delayed(Duration(seconds: 1));
                            if (!value.loading) {
                              _showBottomSheet(context);
                            }
                          });
                    },
                  )),
            ),
          ],
        ),
        body: Container(
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
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Container(
                        height: 296,
                        child: CustomScrollView(
                          slivers: [
                            SliverPadding(
                              padding: const EdgeInsets.all(5),
                              sliver: SliverMasonryGrid(
                                  delegate: SliverChildBuilderDelegate(
                                    (context, index) => Card(
                                      child: Stack(
                                        alignment: Alignment.topRight,
                                        children: [
                                          Image.asset(
                                            imageList[index],
                                            fit: BoxFit.cover,
                                          ),
                                          const Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Icon(
                                                Icons.favorite_border_outlined,
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
                                        ],
                                      ),
                                    ),
                                    childCount: imageList.length,
                                  ),
                                  gridDelegate:
                                      const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const ShowMore(
                      text: 'Show More',
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
                        child: Container(
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
