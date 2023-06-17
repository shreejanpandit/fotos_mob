// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:fotos_mobile/res/typo_theme_data.dart';

class Gerne extends StatelessWidget {
  final String imagePath;
  final String text;
  const Gerne({
    Key? key,
    required this.imagePath,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Container(
        decoration: BoxDecoration(
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
      ),
    );
  }
}
