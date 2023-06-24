import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fotos_mobile/res/typo_theme_data.dart';
import 'package:fotos_mobile/view_model/appbar_item_view_model.dart';
import 'package:provider/provider.dart';

AppBar appBar(context, GlobalKey<ScaffoldState> scaffoldKey) {
  final appbarProvider = Provider.of<AppbarViewModel>(context);
  final ValueNotifier<bool> _drawer = appbarProvider.drawerOpenNotifier;
  return AppBar(
    automaticallyImplyLeading: false,
    actions: [
      IconButton(
        icon: const Icon(
          Icons.notifications_none,
          color: CustomTheme.primaryColor,
        ),
        onPressed: () {
          print("notification");
        },
      ),
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
                            image:
                                AssetImage('assets/branding/images/avatar.png'),
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
                      )),
          ),
        ),
      ),
      // PopupMenuButton(
      //   position: PopupMenuPosition.under,
      //   // surfaceTintColor: CustomTheme.otherColor3,
      //   // clipBehavior: Clip.antiAlias,
      //   shadowColor: CustomTheme.primaryColor,
      //   // elevation: 10,
      //   // splashRadius: 50,
      //   tooltip: 'User Profile',
      //   color: Colors.grey.shade300,
      //   icon: const CircleAvatar(
      // backgroundImage: AssetImage('assets/branding/images/avatar.jpg'),
      // backgroundColor: CustomTheme.primaryColor,
      //   ),
      //   itemBuilder: (BuildContext context) {
      //     if (_drawer.value) {
      //       scaffoldKey.currentState?.openEndDrawer();
      //     }
      //     return [
      //       PopupMenuItem(
      //         child: Container(
      //           width: 300.0,
      //           height: 170.0,
      //           child: Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             crossAxisAlignment: CrossAxisAlignment.center,
      //             children: [
      //               Column(
      //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                 children: [
      //                   buildRowWithIconAndText(
      //                     'My Profile',
      //                     Icons.person,
      //                     () {
      //                       print("Profile clicked");
      //                     },
      //                   ),
      //                   buildRowWithIconAndText(
      //                     'My Media',
      //                     Icons.image,
      //                     () {
      //                       // Add your code to handle the click event here
      //                     },
      //                   ),
      //                   buildRowWithIconAndText(
      //                     'Statistics',
      //                     Icons.insert_chart,
      //                     () {
      //                       // Add your code to handle the click event here
      //                     },
      //                   ),
      //                   buildRowWithIconAndText(
      //                     'Collection',
      //                     Icons.layers,
      //                     () {
      //                       // Add your code to handle the click event here
      //                     },
      //                   ),
      //                   buildRowWithIconAndText(
      //                     'Following',
      //                     Icons.account_circle,
      //                     () {
      //                       // Add your code to handle the click event here
      //                     },
      //                   ),
      //                   buildRowWithIconAndText(
      //                     'Messages',
      //                     Icons.message,
      //                     () {
      //                       // Add your code to handle the click event here
      //                     },
      //                   ),
      //                   buildRowWithIconAndText(
      //                     'Settings',
      //                     Icons.settings,
      //                     () {
      //                       // Add your code to handle the click event here
      //                     },
      //                   ),
      //                 ],
      //               ),
      //               ClipRRect(
      //                 borderRadius: BorderRadius.circular(5),
      //                 child: DottedBorder(
      //                   borderType: BorderType.RRect,
      //                   strokeWidth: 5.0,
      //                   dashPattern: [8, 5],
      //                   child: Container(
      //                     padding: const EdgeInsets.all(8),
      //                     child: InkWell(
      //                       onTap: () {
      //                         print("Trying to upload your data..");
      //                       },
      //                       child: SizedBox(
      //                         width: 116,
      //                         height: 61,
      //                         child: Center(
      //                           child: Column(
      //                             children: [
      //                               Icon(
      //                                 Icons.file_upload_outlined,
      //                                 size: 30,
      //                                 color: Colors.lightBlue,
      //                               ),
      //                               Text(
      //                                 "Upload",
      //                                 style: TextStyle(
      //                                   color: Colors.black,
      //                                   fontWeight: FontWeight.bold,
      //                                 ),
      //                               ),
      //                             ],
      //                           ),
      //                         ),
      //                       ),
      //                     ),
      //                   ),
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //       ),
      //     ];
      //   },
      // ),

      ValueListenableBuilder(
          valueListenable: _drawer,
          builder: ((context, value, child) {
            return Container(
              margin: const EdgeInsets.only(right: 10),
              child: InkWell(
                onTap: () {
                  if (_drawer.value) {
                    scaffoldKey.currentState?.openEndDrawer();
                  } else {
                    scaffoldKey.currentState?.openDrawer();
                  }
                  _drawer.value = !_drawer.value; // Toggle the drawer value
                },
                child: SvgPicture.asset('assets/branding/home/drawer.svg'),
              ),
              // child: CircleAvatar(
              //   backgroundColor: CustomTheme.primaryColor,
              //   child: IconButton(
              //       icon: const Icon(
              //         Icons.dehaze,
              //         color: Colors.white,
              //       ),
              //       onPressed: () {
              //   if (_drawer.value) {
              //     scaffoldKey.currentState?.openEndDrawer();
              //   } else {
              //     scaffoldKey.currentState?.openDrawer();
              //   }
              //   _drawer.value = !_drawer.value; // Toggle the drawer value
              // }),
              // ),
            );
          })),
    ],
    title: Image.asset(
      'assets/branding/images/logo.png',
    ),
    elevation: 0,
  );
}
