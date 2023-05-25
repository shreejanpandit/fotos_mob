import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fotos_mobile/res/components/drawer_custom_tile.dart';
import 'package:fotos_mobile/utils/routes/routes_name.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Drawer(
          backgroundColor: const Color(0xff0d3e5c),
          child: Column(
            children: [
              CustomListTile(
                title: "Login",
                opacity: 1.0,
                onTap: (() {
                  Navigator.pushNamed(context, RoutesName.login);
                }),
                fontWeight: FontWeight.bold,
              ),
              const Divider(height: 1, thickness: 1, color: Color(0xff645E5E)),
              CustomListTile(
                opacity: 1.0,
                title: "Media",
                onTap: (() {}),
                fontWeight: FontWeight.bold,
              ),
              CustomListTile(
                title: "Photos",
                opacity: 0.8,
                onTap: () {},
              ),
              CustomListTile(title: "Vectors", onTap: () {}, opacity: 0.8),
              CustomListTile(title: "GIFs", onTap: () {}, opacity: 0.8),
              const Divider(height: 1, thickness: 1, color: Color(0xff645E5E)),
              CustomListTile(
                  title: "Editor's Choice", onTap: () {}, opacity: 0.8),
              CustomListTile(
                  title: "Popular Images", onTap: () {}, opacity: 0.8),
              CustomListTile(
                  title: "Popular Searches", onTap: () {}, opacity: 0.8),
              CustomListTile(
                  title: "About",
                  onTap: (() {}),
                  fontWeight: FontWeight.bold,
                  opacity: 1.0),
              CustomListTile(title: "FAQ", onTap: () {}, opacity: 0.8),
              CustomListTile(title: "Terms", onTap: () {}, opacity: 0.8),
              CustomListTile(title: "Privacy", onTap: () {}, opacity: 0.8),
              CustomListTile(title: "About Us", onTap: () {}, opacity: 0.8),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Divider(
                        height: 1, thickness: 1, color: Color(0xff645E5E)),
                    Expanded(
                      child: SizedBox(
                        height: 50.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Icon(FontAwesomeIcons.facebookF,
                                color: Colors.white, size: 25.0),
                            Icon(FontAwesomeIcons.instagram,
                                color: Colors.white, size: 25.0),
                            Icon(FontAwesomeIcons.twitter,
                                color: Colors.white, size: 25.0)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
    // Drawer(
    // backgroundColor: const Color(0xff0d3e5c),
    //   child: ListView(
    //     padding: EdgeInsets.zero,
    //     children: <Widget>[
    //       CustomListTile(
    //         title: "Login",
    //         onTap: (() {}),
    //         fontWeight: FontWeight.bold,
    //       ),
    //       const Divider(height: 1, thickness: 1, color: Color(0xff645E5E)),
    //       CustomListTile(
    //         title: "Media",
    //         onTap: (() {}),
    //         fontWeight: FontWeight.bold,
    //       ),
    //       CustomListTile(
    //         title: "Photos",
    //         onTap: () {},
    //       ),
    //       CustomListTile(
    //         title: "Vectors",
    //         onTap: () {},
    //       ),
    //       CustomListTile(
    //         title: "GIFs",
    //         onTap: () {},
    //       ),
    //       const Divider(height: 1, thickness: 1, color: Color(0xff645E5E)),
    //       CustomListTile(
    //         title: "Editor's Choice",
    //         onTap: () {},
    //       ),
    //       CustomListTile(
    //         title: "Popular Images",
    //         onTap: () {},
    //       ),
    //       CustomListTile(
    //         title: "Popular Searches",
    //         onTap: () {},
    //       ),
    //       CustomListTile(
    //         title: "About",
    //         onTap: (() {}),
    //         fontWeight: FontWeight.bold,
    //       ),
    //       CustomListTile(
    //         title: "FAQ",
    //         onTap: () {},
    //       ),
    //       CustomListTile(
    //         title: "Terms",
    //         onTap: () {},
    //       ),
    //       CustomListTile(
    //         title: "Privacy",
    //         onTap: () {},
    //       ),
    //       CustomListTile(
    //         title: "About Us",
    //         onTap: () {},
    //       ),

    //       const Divider(height: 1, thickness: 1, color: Color(0xff645E5E)),

    // Row(
    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //   children: const [
    //     Icon(
    //       Icons.audiotrack,
    //       color: Colors.green,
    //       size: 30.0,
    //     ),
    //     Icon(
    //       Icons.audiotrack,
    //       color: Colors.green,
    //       size: 30.0,
    //     ),
    //     Icon(
    //       Icons.audiotrack,
    //       color: Colors.green,
    //       size: 30.0,
    //     ),
    //   ],
    // ) // add more items as needed...
    //     ],
    //   ),
    // ),
  }
}
