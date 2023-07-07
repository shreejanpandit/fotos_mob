import 'package:flutter/material.dart';
import 'package:fotos_mobile/res/components/profile_component/textfield_with_icon_and_text.dart';
import 'package:provider/provider.dart';

import '../../data/response/status.dart';
import '../../view_model/user_view_model.dart';

class PersonalInfo extends StatelessWidget {
  final bool isEditable;
  PersonalInfo({super.key, required this.isEditable});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserViewModel>(
      builder: (context, value, child) {
        // print(value.userData.data!.id.toString());

        switch (value.userData.status) {
          case Status.LOADING:
            return Center(
              child: CircularProgressIndicator.adaptive(),
            );
          case Status.ERROR:
            return Text(value.userData.message.toString());
          case Status.COMPLETED:
            return Column(
              children: [
                TextfieldWithIconAndText(
                  isEditable: isEditable,
                  icon: Icons.person,
                  labelText: 'Name',
                  initialValue: value.userData.data!.name.toString(),
                ),
                TextfieldWithIconAndText(
                  isEditable: isEditable,
                  icon: Icons.mail_outline,
                  labelText: 'Email',
                  initialValue: value.userData.data!.email.toString(),
                ),
                TextfieldWithIconAndText(
                  isEditable: isEditable,
                  icon: Icons.call_outlined,
                  labelText: 'Phone',
                  initialValue: value.userData.data!.contact.toString(),
                ),
                TextfieldWithIconAndText(
                  isEditable: isEditable,
                  icon: Icons.location_on_outlined,
                  labelText: 'Address',
                  initialValue: value.userData.data!.address.toString(),
                ),
                TextfieldWithIconAndText(
                  isEditable: isEditable,
                  icon: Icons.calendar_month,
                  labelText: 'Date of Birth',
                  initialValue: value.userData.data!.dob.toString(),
                ),
              ],
            );
          default:
            return Container();
        }
      },
    );
  }
}
