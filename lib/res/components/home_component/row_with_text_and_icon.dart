import 'package:flutter/material.dart';
import 'package:fotos_mobile/res/typo_theme_data.dart';

Widget buildRowWithIconAndText(
    String text, IconData iconData, VoidCallback onTap) {
  return Expanded(
    child: InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: CustomTheme.small),
          SizedBox(width: 5),
          Icon(
            iconData,
            size: 16,
            color: CustomTheme.lightBlackTextColor,
          ),
        ],
      ),
    ),
  );
}
