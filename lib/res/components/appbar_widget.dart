import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fotos_mobile/res/typo_theme_data.dart';
import 'package:fotos_mobile/view_model/appbar_item_view_model.dart';
import 'package:provider/provider.dart';

import '../../models/user_models.dart';
import '../../utils/routes/routes_name.dart';
import '../../view_model/user_view_model.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final bool automaticallyImplyLeading;

  const CustomAppBar({
    required this.scaffoldKey,
    required this.automaticallyImplyLeading,
  });

  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  late UserViewModel _userViewModel;
  bool isVisible = false;

  @override
  void initState() {
    super.initState();
    _userViewModel = UserViewModel();
    _checkUserToken();
  }

  void _checkUserToken() async {
    UserModel user = await _userViewModel.getUser();
    setState(() {
      isVisible = user.token != null && user.token!.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    final appbarProvider = Provider.of<AppbarViewModel>(context);
    final ValueNotifier<bool> _drawer = appbarProvider.drawerOpenNotifier;

    return AppBar(
      automaticallyImplyLeading: widget.automaticallyImplyLeading,
      iconTheme: IconThemeData(
        color: CustomTheme.primaryColor, // change your color here
      ),
      actions: [
        if (isVisible)
          IconButton(
            icon: const Icon(
              Icons.notifications_none,
              color: CustomTheme.primaryColor,
            ),
            onPressed: () {
              print("notification");
            },
          ),
        if (isVisible)
          InkWell(
            onTap: appbarProvider.toggleBody,
            child: Padding(
              padding: const EdgeInsets.only(right: 5),
              child: SizedBox(
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: appbarProvider.showBody
                      ? Container(
                          width: 33.97,
                          height: 35,
                          decoration: const ShapeDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/branding/images/avatar.png'),
                              fit: BoxFit.fill,
                            ),
                            shape: OvalBorder(),
                          ),
                        )
                      : Container(
                          width: 33.97,
                          height: 35,
                          child: const Icon(
                            Icons.home_outlined,
                            color: CustomTheme.primaryColor,
                            size: 30,
                          ),
                        ),
                ),
              ),
            ),
          ),
        ValueListenableBuilder(
          valueListenable: _drawer,
          builder: (context, value, child) {
            return Container(
              margin: const EdgeInsets.only(right: 10),
              child: InkWell(
                onTap: () {
                  if (_drawer.value) {
                    widget.scaffoldKey.currentState?.openEndDrawer();
                  } else {
                    widget.scaffoldKey.currentState?.openDrawer();
                  }
                  _drawer.value = !_drawer.value; // Toggle the drawer value
                },
                child: SvgPicture.asset('assets/branding/home/drawer.svg'),
              ),
            );
          },
        ),
      ],
      title: InkWell(
        onTap: () {
          Navigator.pushNamed(context, RoutesName.home);
        },
        child: Image.asset(
          'assets/branding/images/logo.png',
        ),
      ),
      elevation: 0,
    );
  }
}
