import 'package:flutter/material.dart';
import 'package:fotos_mobile/res/components/profile_component/textfield_with_icon_and_text.dart';
import 'package:provider/provider.dart';

import '../../data/response/status.dart';
import '../../view_model/user_view_model.dart';

class WorkInfo extends StatelessWidget {
  final bool isEditable;
  const WorkInfo({super.key, required this.isEditable});

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
                  icon: Icons.business,
                  labelText: 'Company Name',
                  initialValue: 'XYZ Limited',
                ),
                TextfieldWithIconAndText(
                  isEditable: isEditable,
                  icon: Icons.card_membership,
                  labelText: 'Postion',
                  initialValue: value.userData.data!.profession.toString(),
                ),
                TextfieldWithIconAndText(
                  isEditable: isEditable,
                  icon: Icons.location_on_outlined,
                  labelText: 'Address',
                  initialValue: value.userData.data!.address.toString(),
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
