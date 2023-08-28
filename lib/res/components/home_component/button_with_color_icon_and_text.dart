import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ButtonWithColorIconAndText extends StatelessWidget {
  final String text;
  final Color textColor;
  final String image;
  final Color backgroundColor;
  final double wid;
  final VoidCallback? onTap;

  const ButtonWithColorIconAndText({
    Key? key,
    required this.text,
    required this.textColor,
    required this.image,
    required this.wid,
    required this.backgroundColor,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap, // Added onTap callback
      child: Container(
        width: wid,
        height: 32,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26),
          color: backgroundColor,
        ),
        padding: const EdgeInsets.only(
          top: 5,
          bottom: 6,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: SvgPicture.asset(
                image,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: 5),
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 15,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
