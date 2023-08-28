import 'package:flutter/material.dart';
import 'package:fotos_mobile/res/components/profile_component/textfield_with_icon_and_text.dart';
import 'package:provider/provider.dart';

import '../../data/response/status.dart';
import '../../models/user_models.dart';
import '../../view_model/user_view_model.dart';

class WorkInfo extends StatefulWidget {
  final bool isEditable;
  User? userData;
  WorkInfo({super.key, required this.isEditable, required this.userData});

  @override
  State<WorkInfo> createState() => _WorkInfoState();
}

class _WorkInfoState extends State<WorkInfo> {
  dynamic userProvider;
  late UserModel user;
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
    return Consumer<UserViewModel>(
      builder: (context, userViewModel, child) {
        User? user = userViewModel.currentUser!.data!.user;

        if (!loaded) {
          return CircularProgressIndicator.adaptive();
        } else {
          return Column(
            children: [
              TextfieldWithIconAndText(
                isEditable: widget.isEditable,
                icon: Icons.business,
                labelText: 'Company Name',
                initialValue: 'XYZ Limited',
              ),
              TextfieldWithIconAndText(
                isEditable: widget.isEditable,
                icon: Icons.card_membership,
                labelText: 'Postion',
                initialValue: user!.profession.toString(),
              ),
              TextfieldWithIconAndText(
                isEditable: widget.isEditable,
                icon: Icons.location_on_outlined,
                labelText: 'Address',
                initialValue: user.address.toString(),
              ),
            ],
          );
        }
      },
    );
  }
}
