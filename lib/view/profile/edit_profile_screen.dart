import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fotos_mobile/res/components/profile_component/submit_and_cancle_button.dart';
import 'package:fotos_mobile/res/typo_theme_data.dart';
import 'package:fotos_mobile/view/profile/personal_info.dart';
import 'package:fotos_mobile/view/profile/work_info%20copy.dart';

class EditUserProfileScreen extends StatefulWidget {
  const EditUserProfileScreen({super.key});

  @override
  State<EditUserProfileScreen> createState() => _EditUserProfileScreenState();
}

class _EditUserProfileScreenState extends State<EditUserProfileScreen> {
  bool showPersonalInfo = true;
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
          title: Center(
            child: Text(
              'Edit Profile',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        body: Container(
          child: Column(
            children: [
              SizedBox(
                height: 80,
                width: double.infinity,
                child: Container(
                  padding: const EdgeInsets.only(left: 17, right: 26),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              print('profile pic clicked');
                            },
                            child: Stack(
                              children: [
                                Container(
                                  width: 80,
                                  height: 80,
                                  child: const CircleAvatar(
                                    backgroundImage: AssetImage(
                                        'assets/branding/images/avatar.png'),
                                  ),
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
                                            BorderRadius.circular(100)),
                                    child: SvgPicture.asset(
                                      'assets/branding/home/edit.svg',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 23, left: 15, right: 15),
                    padding: EdgeInsets.only(),
                    height: 45,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFFD9D9D9).withOpacity(0.48),
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
                            margin:
                                EdgeInsets.only(top: 31, left: 40, right: 40),
                            child: showPersonalInfo
                                ? PersonalInfo(isEditable: true)
                                : WorkInfo(isEditable: true),
                          ),
                          SubmitAndCancleButton(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
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
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : null,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.black : Colors.transparent,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
