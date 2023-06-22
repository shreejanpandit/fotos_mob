import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fotos_mobile/data/response/status.dart';
import 'package:fotos_mobile/res/components/appbar_widget.dart';
import 'package:fotos_mobile/res/components/drawer_widget.dart';
import 'package:fotos_mobile/res/components/home_component/gerne_row.dart';
import 'package:fotos_mobile/res/typo_theme_data.dart';
import 'package:fotos_mobile/view/profile/profile_screen.dart';
import 'package:fotos_mobile/view_model/appbar_item_view_model.dart';
import 'package:fotos_mobile/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewModel homeViewModel = HomeViewModel();
  bool _shouldLoadImages = true;
  static int currentPage = 1;
  int nextPage = 1;

  @override
  void initState() {
    super.initState();
    // homeViewModel.fetchMoviesListApi();
    homeViewModel.fetchMedia();
  }

  // List<String> imageList = [
  //   'assets/photos/seagull.png',
  //   'assets/photos/phone-wallpaper.png',
  //   'assets/photos/saturn.png',
  //   'assets/photos/space.png',
  //   'assets/photos/tree.jpg',
  //   'assets/photos/seagull.png',
  //   'assets/photos/phone-wallpaper.png',
  //   'assets/photos/saturn.png',
  //   'assets/photos/space.png',
  //   'assets/photos/tree.jpg',
  //   'assets/photos/seagull.png',
  //   'assets/photos/phone-wallpaper.png',
  //   'assets/photos/saturn.png',
  //   'assets/photos/space.png',
  //   'assets/photos/tree.jpg',
  //   'assets/photos/seagull.png',
  //   'assets/photos/phone-wallpaper.png',
  //   'assets/photos/saturn.png',
  //   'assets/photos/space.png',
  //   'assets/photos/tree.jpg',
  //   'assets/photos/seagull.png',
  //   'assets/photos/phone-wallpaper.png',
  //   'assets/photos/saturn.png',
  //   'assets/photos/space.png',
  //   'assets/photos/tree.jpg',
  //   'assets/photos/seagull.png',
  //   'assets/photos/phone-wallpaper.png',
  //   'assets/photos/saturn.png',
  //   'assets/photos/space.png',
  //   'assets/photos/tree.jpg',
  //   'assets/photos/seagull.png',
  //   'assets/photos/phone-wallpaper.png',
  //   'assets/photos/saturn.png',
  //   'assets/photos/space.png',
  //   'assets/photos/tree.jpg',
  //   'assets/photos/seagull.png',
  //   'assets/photos/phone-wallpaper.png',
  //   'assets/photos/saturn.png',
  //   'assets/photos/space.png',
  //   'assets/photos/tree.jpg',
  //   'assets/photos/seagull.png',
  //   'assets/photos/phone-wallpaper.png',
  //   'assets/photos/saturn.png',
  //   'assets/photos/space.png',
  //   'assets/photos/tree.jpg',
  //   'assets/photos/seagull.png',
  //   'assets/photos/phone-wallpaper.png',
  //   'assets/photos/saturn.png',
  //   'assets/photos/space.png',
  //   'assets/photos/tree.jpg',
  //   'assets/photos/seagull.png',
  //   'assets/photos/phone-wallpaper.png',
  //   'assets/photos/saturn.png',
  //   'assets/photos/space.png',
  //   'assets/photos/tree.jpg',
  //   'assets/photos/seagull.png',
  //   'assets/photos/phone-wallpaper.png',
  //   'assets/photos/saturn.png',
  //   'assets/photos/space.png',
  //   'assets/photos/tree.jpg',
  //   'assets/photos/seagull.png',
  //   'assets/photos/phone-wallpaper.png',
  //   'assets/photos/saturn.png',
  //   'assets/photos/space.png',
  //   'assets/photos/tree.jpg',
  //   'assets/photos/seagull.png',
  //   'assets/photos/phone-wallpaper.png',
  //   'assets/photos/saturn.png',
  //   'assets/photos/space.png',
  //   'assets/photos/tree.jpg',
  //   'assets/photos/seagull.png',
  //   'assets/photos/phone-wallpaper.png',
  //   'assets/photos/saturn.png',
  //   'assets/photos/space.png',
  //   'assets/photos/tree.jpg',
  // ];

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

    // final userPreference = Provider.of<UserViewModel>(context);
    final appbarProvider = Provider.of<AppbarViewModel>(context);

    return Scaffold(
      appBar: appBar(context, scaffoldKey),
      body: Scaffold(
          key: scaffoldKey,
          drawer: const AppDrawer(),
          body: appbarProvider.showBody
              ? ChangeNotifierProvider<HomeViewModel>(
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
                                          child: GestureDetector(
                                            onTap: () {
                                              // Handle the tap event here
                                              // Perform the search or show search options
                                            },
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
                                                        BorderRadius.circular(
                                                            20),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                            child: TextField(
                                                              decoration:
                                                                  const InputDecoration(
                                                                hintText:
                                                                    'Find your imagination',
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                contentPadding:
                                                                    EdgeInsets.only(
                                                                        left:
                                                                            15),
                                                              ),
                                                              style: CustomTheme
                                                                  .base
                                                                  .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                            ),
                                                          ),
                                                          GestureDetector(
                                                            onTap: () {
                                                              if (kDebugMode) {
                                                                print(
                                                                    'clicked');
                                                              }
                                                              // Handle search icon tap event here
                                                              // Perform the search or show search options
                                                            },
                                                            child: Container(
                                                              color: CustomTheme
                                                                  .primaryColor,
                                                              width: 50,
                                                              height: 50,
                                                              child: const Icon(
                                                                Icons.search,
                                                                color: Colors
                                                                    .white,
                                                                size: 32,
                                                              ),
                                                            ),
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
                                  margin: const EdgeInsets.all(10),
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    'Gerne',
                                    style: CustomTheme.h6
                                        .copyWith(fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                              SliverToBoxAdapter(
                                child: Container(
                                  margin: const EdgeInsets.only(bottom: 10),
                                  height: 81,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: const [
                                      Gerne(
                                          text: 'Illustration',
                                          imagePath:
                                              'assets/photos/saturn.png'),
                                      Gerne(
                                          text: 'Space',
                                          imagePath: 'assets/photos/space.png'),
                                      Gerne(
                                          text: 'Potrait',
                                          imagePath: 'assets/photos/tree.jpg'),
                                      Gerne(
                                          text: 'Documentry',
                                          imagePath:
                                              'assets/photos/seagull.png'),
                                      Gerne(
                                          text: 'Still Life',
                                          imagePath: 'assets/photos/space.png'),
                                    ],
                                  ),
                                ),
                              ),
                              // SliverPadding(
                              //   padding: const EdgeInsets.all(5),
                              //   sliver: Consumer<HomeViewModel>(
                              //     builder: (context, value, child) {
                              //       switch (value.media.status) {
                              //         case Status.LOADING:
                              //           return const SliverToBoxAdapter(
                              //             child: Center(
                              //               child: CircularProgressIndicator
                              //                   .adaptive(),
                              //             ),
                              //           );
                              //         case Status.ERROR:
                              //           return SliverToBoxAdapter(
                              //             child: Text(
                              //                 value.media.message.toString()),
                              //           );
                              //         case Status.COMPLETED:
                              //           return SliverPadding(
                              //             padding: const EdgeInsets.all(5),
                              //             sliver: SliverMasonryGrid(
                              //               delegate:
                              //                   SliverChildBuilderDelegate(
                              //                 (context, index) {
                              //                   if (index <
                              //                       value.imageList.length) {
                              //                     return Card(
                              //                       child: Stack(
                              //                         alignment:
                              //                             Alignment.topRight,
                              //                         children: [
                              //                           Image.network(
                              //                             value.imageList[index]
                              //                                 .toString(),
                              //                             errorBuilder:
                              //                                 (context, error,
                              //                                     stackTrace) {
                              //                               return const Icon(
                              //                                 Icons.error,
                              //                                 color: Colors.red,
                              //                               );
                              //                             },
                              //                           ),
                              //                           const Row(
                              //                             mainAxisAlignment:
                              //                                 MainAxisAlignment
                              //                                     .end,
                              //                             children: [
                              //                               Icon(
                              //                                 Icons.favorite,
                              //                                 color:
                              //                                     Colors.white,
                              //                               ),
                              //                               Icon(
                              //                                 Icons
                              //                                     .bookmark_add,
                              //                                 color:
                              //                                     Colors.white,
                              //                               ),
                              //                               Icon(
                              //                                 Icons.share,
                              //                                 color:
                              //                                     Colors.white,
                              //                               ),
                              //                             ],
                              //                           ),
                              //                         ],
                              //                       ),
                              //                     );
                              //                   }

                              //                   return SliverToBoxAdapter(); // Return null for empty sliver
                              //                 },
                              //                 // Set childCount to the initial number of images
                              //                 childCount:
                              //                     value.imageList.length,
                              //               ),
                              //               gridDelegate:
                              //                   const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                              //                 crossAxisCount: 2,
                              //               ),
                              //             ),
                              //           );

                              //         default:
                              //           return const SliverToBoxAdapter();
                              //       }
                              //     },
                              //   ),
                              // ),

                              SliverPadding(
                                padding: const EdgeInsets.all(5),
                                sliver: Consumer<HomeViewModel>(
                                  builder: (context, value, child) {
                                    switch (value.media.status) {
                                      case Status.LOADING:
                                        return const SliverToBoxAdapter(
                                          child: Center(
                                            child: CircularProgressIndicator
                                                .adaptive(),
                                          ),
                                        );
                                      case Status.ERROR:
                                        return SliverToBoxAdapter(
                                          child: Text(
                                              value.media.message.toString()),
                                        );
                                      case Status.COMPLETED:
                                        return SliverPadding(
                                          padding: const EdgeInsets.all(5),
                                          sliver: SliverMasonryGrid(
                                            delegate:
                                                SliverChildBuilderDelegate(
                                              addRepaintBoundaries: true,
                                              (context, index) {
                                                if (index <
                                                    value.imageList.length) {
                                                  // Render existing images
                                                  return Card(
                                                    child: Stack(
                                                      alignment:
                                                          Alignment.topRight,
                                                      children: [
                                                        Image.network(
                                                          value.imageList[index]
                                                              .toString(),
                                                          fit: BoxFit.none,
                                                          errorBuilder:
                                                              (context, error,
                                                                  stackTrace) {
                                                            return const Icon(
                                                              Icons.error,
                                                              color: Colors.red,
                                                            );
                                                          },
                                                        ),
                                                        const Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Icon(
                                                              Icons.favorite,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .bookmark_add,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            Icon(
                                                              Icons.share,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                } else {
                                                  final newIndex = index -
                                                      value.imageList.length;
                                                  if (newIndex <
                                                      value.newlyAddedImages
                                                          .length) {
                                                    // Render newly added images
                                                    // Card(
                                                    // child: Image.network(
                                                    //   value.newlyAddedImages[
                                                    //       newIndex],
                                                    //     errorBuilder: (context,
                                                    //         error, stackTrace) {
                                                    //       return const Icon(
                                                    //         Icons.error,
                                                    //         color: Colors.red,
                                                    //       );
                                                    //     },
                                                    //   ),
                                                    // );
                                                    return Card(
                                                      child: Stack(
                                                        alignment:
                                                            Alignment.topRight,
                                                        children: [
                                                          Image.network(
                                                            value.newlyAddedImages[
                                                                newIndex],
                                                            fit: BoxFit.none,
                                                            errorBuilder:
                                                                (context, error,
                                                                    stackTrace) {
                                                              return const Icon(
                                                                Icons.error,
                                                                color:
                                                                    Colors.red,
                                                              );
                                                            },
                                                          ),
                                                          const Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Icon(
                                                                Icons.favorite,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                              Icon(
                                                                Icons
                                                                    .bookmark_add,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                              Icon(
                                                                Icons.share,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  } else {
                                                    // This case should not be reached, but added for completeness
                                                    return const SizedBox();
                                                  }
                                                }
                                              },
                                              addAutomaticKeepAlives: true,
                                              childCount: value
                                                      .imageList.length +
                                                  value.newlyAddedImages.length,
                                            ),
                                            gridDelegate:
                                                const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                            ),
                                          ),
                                        );
                                      default:
                                        return const SliverToBoxAdapter();
                                    }
                                  },
                                ),
                              )
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
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [],
                            ),
                          ),
                        ),
                        Stack(
                          children: [
                            Positioned.fill(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: InkWell(
                                  onTap: () {
                                    nextPage = currentPage + 1;
                                    currentPage = nextPage;
                                    homeViewModel.loadMoreData(nextPage);
                                  },
                                  child: Container(
                                    width: 390,
                                    height: 122,
                                    padding: const EdgeInsets.only(
                                      left: 124,
                                      right: 125,
                                      top: 30,
                                      bottom: 15,
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 141,
                                          height: 38,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: CustomTheme.primaryColor,
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 29,
                                            vertical: 10,
                                          ),
                                          child: const Text(
                                            "Discover More",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontFamily: "Inter",
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              : ProfileScreen()),
    );
  }
}
