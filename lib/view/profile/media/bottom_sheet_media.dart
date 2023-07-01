
//   import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:multiselect_dropdown_flutter/multiselect_dropdown_flutter.dart';
// import 'package:provider/provider.dart';
// import 'package:rflutter_alert/rflutter_alert.dart';

// import '../../../models/image_open_model.dart';
// import '../../../res/components/profile_component/green_and_cancle_button.dart';
// import '../../../res/typo_theme_data.dart';
// import '../../../view_model/gerne_view_model.dart';
// import '../../../view_model/image_picker_view_model.dart';
// import '../../../view_model/media_view_model.dart';

// void _showBottomSheet(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled:
//           true, // Make the bottom sheet take 3/4th of the screen height
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(35),
//           topRight: Radius.circular(35),
//         ),
//       ),
//       builder: (BuildContext context) {
//         return Container(
//           height: MediaQuery.of(context).size.height *
//               0.75, // Adjust the height to take 3/4th of the screen
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(left: 77, top: 31, right: 65),
//                   child: Center(
//                       child: Text(
//                     'Upload Your Creativity',
//                     style: CustomTheme.base
//                         .copyWith(fontSize: 22, fontWeight: FontWeight.w500),
//                   )),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(28, 31, 27, 20),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(bottom: 10),
//                         child: Text(
//                           'Choose Media',
//                           style: TextStyle(
//                             fontSize: 17,
//                             fontWeight: FontWeight.w200,
//                           ),
//                         ),
//                       ),
//                       Consumer<ImagePickerModel>(
//                         builder: (context, _imagePickerModel, child) {
//                           return Container(
//                             width: 336,
//                             height: 45.25,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                               color: const Color(0xFFF9F9F9),
//                               border: Border.all(
//                                 color: const Color(0xFFCDECFF),
//                               ),
//                             ),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 16),
//                                   child: Container(
//                                     width: 200,
//                                     child: Text(
//                                       overflow: TextOverflow.ellipsis,
//                                       // filePath != null ? filePath! :
//                                       _imagePickerModel.pickedImage != null
//                                           ? _imagePickerModel.pickedImage!.path
//                                           : 'Select File',
//                                       style: TextStyle(
//                                         color: Colors.black,
//                                         fontWeight: FontWeight.w300,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.only(right: 3),
//                                   child: InkWell(
//                                     onTap: () async {
//                                       await _imagePickerModel
//                                           .pickImage(ImageSource.gallery);
//                                       // .pickImage(ImageSource.gallery);
//                                       // setState(() {});
//                                     },
//                                     child: Container(
//                                       width: 86,
//                                       height: 23,
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(10),
//                                         color: Colors.blue,
//                                       ),
//                                       child: Center(
//                                         child: Text(
//                                           'Upload',
//                                           style: TextStyle(
//                                             color: Colors.white,
//                                             fontSize: 12,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           );
//                         },
//                       )
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(28, 0, 27, 20),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Padding(
//                         padding: EdgeInsets.only(bottom: 10),
//                         child: Text('Choose Collection'),
//                       ),
//                       // Consumer<MediaViewModel>(
//                       //   builder: (context, value, child) {
//                       //     return Container(
//                       //       width: 336,
//                       //       height: 45.25,
//                       //       decoration: BoxDecoration(
//                       //         borderRadius: BorderRadius.circular(10),
//                       //         color: const Color(0xFFF9F9F9),
//                       //         border: Border.all(
//                       //           color: const Color(0xFFCDECFF),
//                       //         ),
//                       //       ),
//                       //       child: DropdownButton<String>(
//                       //         onChanged: (value) {},
//                       //         isExpanded: true,
//                       //         underline:
//                       //             Container(), // Removes the default underline
//                       //         // value: value
//                       //         //     .selectedCollection, // Holds the currently selected collection ID
//                       //         // onChanged: (newValue) {
//                       //         //   setState(() {
//                       //         //     value.selectedCollection = newValue!;
//                       //         //   });
//                       //         // },
//                       //         items: value.mediaListItems.map((item) {
//                       //           return DropdownMenuItem<String>(
//                       //             value: item['id'],
//                       //             child: Padding(
//                       //               padding: const EdgeInsets.only(left: 16),
//                       //               child: Text(
//                       //                 item['name'],
//                       //                 style: CustomTheme.base.copyWith(
//                       //                   color: CustomTheme.lightTextColor
//                       //                       .withOpacity(0.4),
//                       //                   fontWeight: FontWeight.w300,
//                       //                 ),
//                       //               ),
//                       //             ),
//                       //           );
//                       //         }).toList(),
//                       //       ),
//                       //     );
//                       //   },
//                       // ),
//                       Consumer<MediaViewModel>(
//                         builder: (context, value, child) {
//                           // print(value.selectedCollection);
//                           // print(value.mediaListItems);
//                           return Container(
//                             width: 336,
//                             height: 45.25,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                               color: const Color(0xFFF9F9F9),
//                               border: Border.all(
//                                 color: const Color(0xFFCDECFF),
//                               ),
//                             ),
//                             child: DropdownButton<String>(
//                               isExpanded: true,
//                               underline:
//                                   Container(), // Removes the default underline
//                               value: value.selectedCollection
//                                   .toString(), // Holds the currently selected collection ID
//                               onChanged: (newValue) {
//                                 // print("object");

//                                 value.setselectedCollection(newValue!);
//                                 print(value.selectedCollection);
//                               },
//                               // onChanged: (value) {},
//                               items: value.mediaListItems.map((item) {
//                                 return DropdownMenuItem<String>(
//                                   value: item['id'],
//                                   child: Padding(
//                                     padding: const EdgeInsets.only(left: 16),
//                                     child: Text(
//                                       item['name'],
//                                       style: CustomTheme.base.copyWith(
//                                         color: CustomTheme.lightTextColor
//                                             .withOpacity(0.4),
//                                         fontWeight: FontWeight.w300,
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                               }).toList(),
//                             ),
//                           );
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//                 Consumer<GenersViewModel>(builder: (context, value, child) {
//                   print("called this ml ${value.geners}");
//                   return MultiSelectDropdown.simpleList(
//                     list: value.geners,
//                     initiallySelected: const [],
//                     onChange: (newList) {
//                       // your logic
//                     },
//                     includeSearch: true,
//                     includeSelectAll: true,
//                     isLarge: true, // Modal size will be a little large
//                     // Give a definite width when rendering this widget in a row
//                     width: 150, // Must be a definite number
//                     boxDecoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                   );
//                 }),
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(28, 0, 27, 20),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(bottom: 10),
//                         child: Text(
//                           'Media Name',
//                           style: CustomTheme.base.copyWith(
//                               fontSize: 17, fontWeight: FontWeight.w200),
//                         ),
//                       ),
//                       Container(
//                         width: 336,
//                         height: 45.25,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           color: const Color(0xFFF9F9F9),
//                           border: Border.all(
//                             color: const Color(0xFFCDECFF),
//                           ),
//                         ),
//                         child: TextFormField(
//                           controller: mediaNameController,
//                           decoration: InputDecoration(
//                             contentPadding:
//                                 const EdgeInsets.symmetric(horizontal: 16),
//                             hintText: 'Enter Media Name',
//                             hintStyle: CustomTheme.base.copyWith(
//                               color:
//                                   CustomTheme.lightTextColor.withOpacity(0.4),
//                               fontWeight: FontWeight.w300,
//                             ),
//                             border: InputBorder.none,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(28, 0, 27, 20),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(bottom: 10),
//                         child: Text(
//                           'Media Description',
//                           style: CustomTheme.base.copyWith(
//                             fontSize: 17,
//                             fontWeight: FontWeight.w200,
//                           ),
//                         ),
//                       ),
//                       Container(
//                         alignment: Alignment.topLeft,
//                         width: 336,
//                         height: 124,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           color: const Color(0xFFF9F9F9),
//                           border: Border.all(
//                             color: const Color(0xFFCDECFF),
//                           ),
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.only(left: 16, top: 3),
//                           child: TextField(
//                             controller: mediaDescriptionController,
//                             maxLines: null, // Allow multiple lines of text
//                             decoration: InputDecoration(
//                               hintText: 'Enter Media Description',
//                               hintStyle: CustomTheme.base.copyWith(
//                                 color:
//                                     CustomTheme.lightTextColor.withOpacity(0.4),
//                                 fontWeight: FontWeight.w300,
//                               ),
//                               border: InputBorder.none,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 GreenAndCancleButton(
//                   greenButtonText: 'Submit',
//                   onGreenButton: () async {
//                     String title = mediaNameController.text;
//                     String description = mediaDescriptionController.text;
//                     var medialistData = MediaList(
//                       id: int.parse(
//                           Provider.of<MediaViewModel>(context, listen: false)
//                               .selectedCollection!),
//                     );
//                     String mediaList = medialistData.id.toString();

//                     // print(mediaList);
//                     bool res = await postFormData(
//                         title: title,
//                         description: description,
//                         mediaList: mediaList);

//                     if (res == true) {
//                       Navigator.pop(context);
//                       Alert(
//                           style: AlertStyle(
//                               titleStyle: TextStyle(color: Colors.white),
//                               backgroundColor: CustomTheme.lightGreenColor),
//                           context: context,
//                           closeFunction: () {
//                             Navigator.pop(context);
//                           },
//                           buttons: [],
//                           image: SvgPicture.asset(
//                             'assets/branding/home/tick.svg',
//                             height: 41,
//                             width: 41,
//                           ),
//                           title: 'Upload Sucessful !',
//                           closeIcon: InkWell(
//                             child: SvgPicture.asset(
//                               'assets/branding/home/close.svg',
//                               height: 20,
//                               width: 20,
//                             ),
//                           )).show();
//                     }
//                   },
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
