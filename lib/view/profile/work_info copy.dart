import 'package:flutter/material.dart';
import 'package:fotos_mobile/res/components/profile_component/textfield_with_icon_and_text.dart';

class WorkInfo extends StatelessWidget {
  final bool isEditable;
  const WorkInfo({super.key, required this.isEditable});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextfieldWithIconAndText(
          isEditable: isEditable,
          icon: Icons.business,
          labelText: 'Company Name',
          initialValue: 'XYZ Limited',
        ),
        TextfieldWithIconAndText(
          isEditable: isEditable,
          icon: Icons.card_membership,
          labelText: 'Postion',
          initialValue: 'Pohotographer',
        ),
        TextfieldWithIconAndText(
          isEditable: isEditable,
          icon: Icons.location_on_outlined,
          labelText: 'Address',
          initialValue: 'Pokhara-19, Kaski, Nepal',
        ),
      ],
    );
  }
}
