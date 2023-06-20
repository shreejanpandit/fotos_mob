import 'package:flutter/material.dart';
import 'package:fotos_mobile/res/typo_theme_data.dart';

class TextfieldWithIconAndText extends StatelessWidget {
  final String initialValue;
  final IconData icon;
  final String labelText;
  final bool isEditable;

  const TextfieldWithIconAndText({
    super.key,
    required this.initialValue,
    required this.icon,
    required this.labelText,
    required this.isEditable,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 15,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Icon(
                    icon,
                    color: Color(0xFF8E8E8E),
                    size: 19,
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Text(
                    labelText,
                    style: TextStyle(
                      color: Color(0xFF8E8E8E),
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 35,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 0, bottom: 0),
                child: TextFormField(
                  enabled: isEditable,
                  initialValue: initialValue,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 0.2,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 0.2,
                      ),
                    ),
                  ),
                  style: CustomTheme.base.copyWith(
                    fontFamily: 'Avenir',
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
