import 'package:flutter/material.dart';
import 'package:fotos_mobile/res/components/profile_component/textfield_with_icon_and_text.dart';
import 'package:fotos_mobile/res/typo_theme_data.dart';

class PersonalInfo extends StatelessWidget {
  final bool isEditable;
  PersonalInfo({super.key, required this.isEditable});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextfieldWithIconAndText(
          isEditable: isEditable,
          icon: Icons.person,
          labelText: 'Name',
          initialValue: 'John Doe',
        ),
        TextfieldWithIconAndText(
          isEditable: isEditable,
          icon: Icons.mail_outline,
          labelText: 'Email',
          initialValue: 'johndoe@gmail.com',
        ),
        TextfieldWithIconAndText(
          isEditable: isEditable,
          icon: Icons.call_outlined,
          labelText: 'Phone',
          initialValue: '+9779857553047',
        ),
        TextfieldWithIconAndText(
          isEditable: isEditable,
          icon: Icons.location_on_outlined,
          labelText: 'Address',
          initialValue: 'Pokhara-19, Kaski, Nepal',
        ),
        TextfieldWithIconAndText(
          isEditable: isEditable,
          icon: Icons.calendar_month,
          labelText: 'Date of Birth',
          initialValue: '2059-06-27',
        ),
      ],
    );
  }
}
