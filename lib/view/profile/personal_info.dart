import 'package:flutter/material.dart';
import 'package:fotos_mobile/res/components/profile_component/textfield_with_icon_and_text.dart';
import 'package:provider/provider.dart';

import '../../data/response/status.dart';
import '../../models/user_models.dart';
import '../../view_model/user_view_model.dart';

class PersonalInfo extends StatefulWidget {
  final bool isEditable;
  User? userData;
  PersonalInfo({super.key, required this.isEditable, required this.userData});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  dynamic userProvider;
  // late UserModel user;
  User? userData;

  bool loaded = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () {
      var userProvider = Provider.of<UserViewModel>(context, listen: false);
      userProvider.getUser().then((value) {
        setState(() {
          loaded = true;
        });
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isEditable = widget.isEditable;
    return Consumer<UserViewModel>(
      builder: (context, userViewModel, child) {
        User? user = userViewModel.currentUser!.data!.user;

        if (!loaded) {
          return CircularProgressIndicator.adaptive();
        } else {
          return Column(
            children: [
              TextfieldWithIconAndText(
                isEditable: isEditable,
                icon: Icons.person,
                labelText: 'Name',
                // initialValue: user.data!.user!.name.toString(),
                initialValue: user!.name.toString(),
              ),
              TextfieldWithIconAndText(
                isEditable: isEditable,
                icon: Icons.mail_outline,
                labelText: 'Email',
                initialValue: user.email.toString(),
              ),
              TextfieldWithIconAndText(
                isEditable: isEditable,
                icon: Icons.call_outlined,
                labelText: 'Phone',
                initialValue: user.contact.toString(),
              ),
              TextfieldWithIconAndText(
                isEditable: isEditable,
                icon: Icons.location_on_outlined,
                labelText: 'Address',
                initialValue: user.address.toString(),
              ),
              TextfieldWithIconAndText(
                isEditable: isEditable,
                icon: Icons.calendar_month,
                labelText: 'Date of Birth',
                initialValue: user.dob.toString(),
              ),
            ],
          );
        }
      },
    );
  }
}
