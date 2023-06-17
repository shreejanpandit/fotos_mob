import 'package:flutter/material.dart';
import 'package:fotos_mobile/res/typo_theme_data.dart';

class ProfileIconWithText extends StatelessWidget {
  // final String? imagePath;
  final String text;
  final IconData icon;

  const ProfileIconWithText({
    Key? key,
    // this.imagePath,
    required this.text,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 50,
        ),
        // Image.asset(
        //   imagePath!,
        //   height: 80,
        //   width: 80,
        // ),
        Text(
          text,
          style: CustomTheme.base.copyWith(
            fontWeight: FontWeight.w400,
            color: CustomTheme.primaryColor,
          ),
        ),
      ],
    );
  }
}
