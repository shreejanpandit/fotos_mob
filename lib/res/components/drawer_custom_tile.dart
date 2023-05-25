// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:fotos_mobile/res/typo_theme_data.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final double fontSize;
  final double opacity;
  final Color fontColor;
  final FontWeight fontWeight;

  const CustomListTile({
    Key? key,
    required this.title,
    required this.onTap,
    this.fontSize = 14,
    required this.opacity,
    this.fontColor = CustomTheme.whiteTextColor,
    this.fontWeight = FontWeight.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListTile(
        visualDensity: VisualDensity(horizontal: 0, vertical: -4),
        title: Text(
          title,
          style: TextStyle(
            fontSize: fontSize,
            color: fontColor,
            fontWeight: fontWeight,
            fontFamily: "Poppins",
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
