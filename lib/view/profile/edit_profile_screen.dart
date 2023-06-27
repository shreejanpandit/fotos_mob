import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fotos_mobile/res/components/profile_component/green_and_cancle_button.dart';
import 'package:fotos_mobile/view/profile/work_info%20copy.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../res/typo_theme_data.dart';
import '../../view/profile/personal_info.dart';
import '../../view_model/image_picker_view_model.dart';

class EditUserProfileScreen extends StatefulWidget {
  const EditUserProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditUserProfileScreen> createState() => _EditUserProfileScreenState();
}

class _EditUserProfileScreenState extends State<EditUserProfileScreen> {
  bool showPersonalInfo = true;

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
            'Edit Profile',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
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
                              builder: (context, imagePickerModel, _) {
                                return PopupMenuButton(
                                  position: PopupMenuPosition.under,
                                  shadowColor: CustomTheme.primaryColor,
                                  tooltip: 'Upload data',
                                  color: Colors.grey.shade300,
                                  child: ClipOval(
                                    child: Container(
                                      height: 80,
                                      width: 80,
                                      decoration: ShapeDecoration(
                                          shape: CircleBorder()),
                                      child: imagePickerModel.pickedImage !=
                                              null
                                          ? Image.file(
                                              imagePickerModel.pickedImage!)
                                          : Image.asset(
                                              'assets/branding/images/avatar.png'),
                                    ),
                                  ),
                                  itemBuilder: (BuildContext context) {
                                    return [
                                      _buildPopupMenuItem(
                                          'Select from Device', Icons.upload,
                                          () {
                                        imagePickerModel
                                            .pickImage(ImageSource.gallery);
                                        Navigator.pop(context);
                                      }),
                                      _buildPopupMenuItem('Remove Profile',
                                          Icons.remove_circle_outline, () {
                                        Navigator.pop(context);
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
                                  borderRadius: BorderRadius.circular(100),
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
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
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
                    )
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 23, left: 15, right: 15),
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
                Container(
                  height: MediaQuery.of(context).size.height * 0.68,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          margin: const EdgeInsets.only(
                              top: 31, left: 40, right: 40),
                          child: showPersonalInfo
                              ? PersonalInfo(isEditable: true)
                              : const WorkInfo(isEditable: true),
                        ),
                        GreenAndCancleButton(
                          greenButtonText: 'Submit',
                          onGreenButton: () {
                            Navigator.pop(context);
                            Alert(
                              style: const AlertStyle(
                                titleStyle: TextStyle(color: Colors.white),
                                backgroundColor: CustomTheme.lightGreenColor,
                              ),
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
                              title: 'Upload Successful!',
                              closeIcon: InkWell(
                                child: SvgPicture.asset(
                                  'assets/branding/home/close.svg',
                                  height: 20,
                                  width: 20,
                                ),
                              ),
                            ).show();
                          },
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ToggleButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const ToggleButton({
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
