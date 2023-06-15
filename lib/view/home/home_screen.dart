import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fotos_mobile/data/response/status.dart';
import 'package:fotos_mobile/res/components/appbar_widget.dart';
import 'package:fotos_mobile/res/components/drawer_widget.dart';
import 'package:fotos_mobile/res/components/home_component/gerne_row.dart';
import 'package:fotos_mobile/res/typo_theme_data.dart';
import 'package:fotos_mobile/utils/routes/routes_name.dart';
import 'package:fotos_mobile/utils/utils.dart';
import 'package:fotos_mobile/view_model/home_view_model.dart';
import 'package:fotos_mobile/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewModel homeViewModel = HomeViewModel();

  @override
  void initState() {
    super.initState();
    // homeViewModel.fetchMoviesListApi();
  }

  List<String> imageList = [
    'assets/photos/seagull.png',
    'assets/photos/phone-wallpaper.png',
    'assets/photos/saturn.png',
    'assets/photos/space.png',
    'assets/photos/tree.jpg',
    'assets/photos/seagull.png',
    'assets/photos/phone-wallpaper.png',
    'assets/photos/saturn.png',
    'assets/photos/space.png',
    'assets/photos/tree.jpg',
    'assets/photos/seagull.png',
    'assets/photos/phone-wallpaper.png',
    'assets/photos/saturn.png',
    'assets/photos/space.png',
    'assets/photos/tree.jpg',
    'assets/photos/seagull.png',
    'assets/photos/phone-wallpaper.png',
    'assets/photos/saturn.png',
    'assets/photos/space.png',
    'assets/photos/tree.jpg',
    'assets/photos/seagull.png',
    'assets/photos/phone-wallpaper.png',
    'assets/photos/saturn.png',
    'assets/photos/space.png',
    'assets/photos/tree.jpg',
    'assets/photos/seagull.png',
    'assets/photos/phone-wallpaper.png',
    'assets/photos/saturn.png',
    'assets/photos/space.png',
    'assets/photos/tree.jpg',
    'assets/photos/seagull.png',
    'assets/photos/phone-wallpaper.png',
    'assets/photos/saturn.png',
    'assets/photos/space.png',
    'assets/photos/tree.jpg',
    'assets/photos/seagull.png',
    'assets/photos/phone-wallpaper.png',
    'assets/photos/saturn.png',
    'assets/photos/space.png',
    'assets/photos/tree.jpg',
    'assets/photos/seagull.png',
    'assets/photos/phone-wallpaper.png',
    'assets/photos/saturn.png',
    'assets/photos/space.png',
    'assets/photos/tree.jpg',
    'assets/photos/seagull.png',
    'assets/photos/phone-wallpaper.png',
    'assets/photos/saturn.png',
    'assets/photos/space.png',
    'assets/photos/tree.jpg',
    'assets/photos/seagull.png',
    'assets/photos/phone-wallpaper.png',
    'assets/photos/saturn.png',
    'assets/photos/space.png',
    'assets/photos/tree.jpg',
    'assets/photos/seagull.png',
    'assets/photos/phone-wallpaper.png',
    'assets/photos/saturn.png',
    'assets/photos/space.png',
    'assets/photos/tree.jpg',
    'assets/photos/seagull.png',
    'assets/photos/phone-wallpaper.png',
    'assets/photos/saturn.png',
    'assets/photos/space.png',
    'assets/photos/tree.jpg',
    'assets/photos/seagull.png',
    'assets/photos/phone-wallpaper.png',
    'assets/photos/saturn.png',
    'assets/photos/space.png',
    'assets/photos/tree.jpg',
    'assets/photos/seagull.png',
    'assets/photos/phone-wallpaper.png',
    'assets/photos/saturn.png',
    'assets/photos/space.png',
    'assets/photos/tree.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

    final userPreference = Provider.of<UserViewModel>(context);

    return Scaffold(
        appBar: appBar(context, _scaffoldKey),
        body: Scaffold(
          key: _scaffoldKey,
          drawer: const AppDrawer(),
          body: ChangeNotifierProvider<HomeViewModel>(
            create: (BuildContext context) => homeViewModel,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff239de9),
                    Color(0xffddeffb),
                    Colors.white,
                    Color(0x00ffffff)
                  ],
                ),
              ),
              child: Stack(
                children: [
                  SizedBox(
                    child: CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
                          child: Container(
                            color: Colors.white,
                            child: Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                Image.asset(
                                  'assets/photos/space.png',
                                  height: 320,
                                  fit: BoxFit.fill,
                                ),
                                Positioned(
                                  top: 30,
                                  child: Text(
                                    "Stunning free images &\nroyalty free stock",
                                    textAlign: TextAlign.center,
                                    style: CustomTheme.h6.copyWith(
                                      color: CustomTheme.whiteTextColor,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 100,
                                  child: Text(
                                    "Over 2.7 million+ high quality stock images,\nvideos and music shared by our talented\ncommunity",
                                    textAlign: TextAlign.center,
                                    style: CustomTheme.base.copyWith(
                                      fontSize: 15.0,
                                      color: CustomTheme.whiteTextColor,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 170,
                                  child: SizedBox(
                                    width: 361,
                                    height: 50,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 361,
                                          height: 50,
                                          child: Material(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                left: 92,
                                                right: 19,
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Find your imagination",
                                                    style: CustomTheme.base
                                                        .copyWith(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  SizedBox(width: 43),
                                                  SizedBox(
                                                    width: 30,
                                                    height: 30,
                                                    child: Icon(Icons.search),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 250,
                                  child: Text(
                                    "Popular Images: new year, wallpaper, nature, background,\nsky, money, love, cat car, dog, food, flowers, ipone\nwallpaper",
                                    textAlign: TextAlign.center,
                                    style: CustomTheme.xSmall
                                        .copyWith(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: Container(
                            margin: EdgeInsets.all(10),
                            child: Text(
                              'Gerne',
                              style: CustomTheme.h6,
                            ),
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: Container(
                            width: 159,
                            height: 81,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                Gerne(
                                    text: 'Illustration',
                                    imagePath: 'assets/photos/space.png'),
                                Gerne(
                                    text: 'Illustration',
                                    imagePath: 'assets/photos/space.png'),
                                Gerne(
                                    text: 'Illustration',
                                    imagePath: 'assets/photos/space.png'),
                                Gerne(
                                    text: 'Illustration',
                                    imagePath: 'assets/photos/space.png'),
                                Gerne(
                                    text: 'Illustration',
                                    imagePath: 'assets/photos/space.png'),
                              ],
                            ),
                          ),
                        ),
                        SliverPadding(
                          padding: const EdgeInsets.all(5),
                          sliver: SliverMasonryGrid(
                              delegate: SliverChildBuilderDelegate(
                                (context, index) => Card(
                                  child: Stack(
                                    alignment: Alignment.topRight,
                                    children: [
                                      Image.asset(
                                        imageList[index],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: const [
                                          Icon(
                                            Icons.favorite,
                                            color: Colors.white,
                                          ),
                                          Icon(
                                            Icons.bookmark_add,
                                            color: Colors.white,
                                          ),
                                          Icon(
                                            Icons.share,
                                            color: Colors.white,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                childCount: imageList.length,
                              ),
                              gridDelegate:
                                  const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2)),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      width: double.infinity,
                      height: 60,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0x00efd7d7),
                            Color(0xf0dad8d8),
                          ],
                        ),
                      ),
                      padding: const EdgeInsets.only(
                        left: 128,
                        right: 121,
                        top: 61,
                        bottom: 23,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
