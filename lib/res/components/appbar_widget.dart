import 'package:flutter/material.dart';
import 'package:fotos_mobile/res/typo_theme_data.dart';
import 'package:fotos_mobile/view_model/drawer_view_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'home_component/row_with_text_and_icon.dart';

AppBar appBar(context, GlobalKey<ScaffoldState> scaffoldKey) {
  final drawerProvider = Provider.of<DrawerViewModel>(context);
  final ValueNotifier<bool> _drawer = drawerProvider.drawerOpenNotifier;
  return AppBar(
    // backgroundColor: Colors.white,
    automaticallyImplyLeading: false,
    actions: [
      IconButton(
        icon: Icon(
          Icons.notifications_none,
          // color: CustomTheme.primaryColor,
        ),
        onPressed: () {
          print("notification");
        },
      ),
      PopupMenuButton(
        position: PopupMenuPosition.under,
        surfaceTintColor: CustomTheme.otherColor3,
        clipBehavior: Clip.hardEdge,
        shadowColor: CustomTheme.primaryColor,
        elevation: 30,
        splashRadius: 50,
        tooltip: 'User Profile',
        color: CustomTheme.otherColor2,
        icon: CircleAvatar(
          backgroundImage: AssetImage('assets/branding/images/avatar.jpg'),
          backgroundColor: CustomTheme.primaryColor,
        ),
        itemBuilder: (BuildContext context) {
          if (_drawer.value) {
            scaffoldKey.currentState?.openEndDrawer();
          }
          return [
            PopupMenuItem(
              child: Container(
                width: 300.0,
                height: 170.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildRowWithIconAndText(
                          'My Profile',
                          Icons.person,
                          () {
                            print("Profile clicked");
                          },
                        ),
                        buildRowWithIconAndText(
                          'My Media',
                          Icons.image,
                          () {
                            // Add your code to handle the click event here
                          },
                        ),
                        buildRowWithIconAndText(
                          'Statistics',
                          Icons.insert_chart,
                          () {
                            // Add your code to handle the click event here
                          },
                        ),
                        buildRowWithIconAndText(
                          'Collection',
                          Icons.layers,
                          () {
                            // Add your code to handle the click event here
                          },
                        ),
                        buildRowWithIconAndText(
                          'Following',
                          Icons.account_circle,
                          () {
                            // Add your code to handle the click event here
                          },
                        ),
                        buildRowWithIconAndText(
                          'Messages',
                          Icons.message,
                          () {
                            // Add your code to handle the click event here
                          },
                        ),
                        buildRowWithIconAndText(
                          'Settings',
                          Icons.settings,
                          () {
                            // Add your code to handle the click event here
                          },
                        ),
                      ],
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 1.0,
                          ),
                        ),
                        child: InkWell(
                          onTap: () {
                            print("Trying to upload your data..");
                          },
                          child: SizedBox(
                            width: 116,
                            height: 61,
                            child: Center(
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.file_upload_outlined,
                                    size: 30,
                                    color: Colors.lightBlue,
                                  ),
                                  Text(
                                    "Upload",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
      ),
      ValueListenableBuilder(
          valueListenable: _drawer,
          builder: ((context, value, child) {
            return Container(
              margin: EdgeInsets.only(right: 10),
              child: CircleAvatar(
                backgroundColor: CustomTheme.primaryColor,
                child: IconButton(
                    icon: const Icon(Icons.dehaze),
                    onPressed: () {
                      if (_drawer.value) {
                        scaffoldKey.currentState?.openEndDrawer();
                      } else {
                        scaffoldKey.currentState?.openDrawer();
                      }
                      _drawer.value = !_drawer.value; // Toggle the drawer value
                    }),
              ),
            );
          })),
    ],
    title: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 30.0,
          child: Image.asset(
            'assets/branding/images/logo.png',
          ),
        ),
        const SizedBox(width: 10),
        Text('Fotos',
            style: GoogleFonts.lobster(
                fontSize: 40, color: CustomTheme.primaryColor))
      ],
    ),
    elevation: 0,
  );
}
