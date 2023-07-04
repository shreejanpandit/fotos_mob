import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fotos_mobile/data/response/status.dart';
import 'package:fotos_mobile/res/components/appbar_widget.dart';
import 'package:fotos_mobile/res/components/drawer_widget.dart';
import 'package:fotos_mobile/res/components/home_component/gerne_row.dart';
import 'package:fotos_mobile/res/typo_theme_data.dart';
import 'package:fotos_mobile/utils/routes/routes_name.dart';
import 'package:fotos_mobile/view/home/image_open_screen.dart';
import 'package:fotos_mobile/view/home/search_result_screen.dart';
// import 'package:fotos_mobile/view/profile/media_screen.dart';
import 'package:fotos_mobile/view/profile/profile_screen.dart';
import 'package:fotos_mobile/view_model/appbar_item_view_model.dart';
import 'package:fotos_mobile/view_model/home_view_model.dart';
import 'package:fotos_mobile/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

import '../../res/app_urls.dart';
import '../../view_model/favourite_view_model.dart';
import '../../view_model/gerne_view_model.dart';
import '../../view_model/image_open_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  HomeViewModel homeViewModel = HomeViewModel();
  GenersViewModel genersViewModel = GenersViewModel();
  UserViewModel userViewModel = UserViewModel();
  static int currentPage = 1;
  int nextPage = 1;
  @override
  void initState() {
    super.initState();
    // homeViewModel.fetchMoviesListApi();
    homeViewModel.fetchMedia();
    Future.delayed(Duration.zero, () {
      Provider.of<GenersViewModel>(context, listen: false).fetchGernes();
      Provider.of<FavouriteViewModel>(context, listen: false)
          .fetchFavouriteMedia();
    });
    // genersViewModel.fetchGernes();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    homeViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

    // final userPreference = Provider.of<UserViewModel>(context);
    final appbarProvider = Provider.of<AppbarViewModel>(context);
    var imageOpenViewModel = Provider.of<ImageOpenViewModel>(context);
    // print(imageOpenViewModel.data);
    return Scaffold(
      appBar: CustomAppBar(
        scaffoldKey: scaffoldKey,
        automaticallyImplyLeading: false,
      ),
      body: Scaffold(
          key: scaffoldKey,
          drawer: const AppDrawer(),
          body: ChangeNotifierProvider.value(
            value: homeViewModel,
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
                      controller: homeViewModel.scrollCtrl,
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
                                      onTap: () {},
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
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: TextField(
                                                        controller:
                                                            searchController,
                                                        decoration:
                                                            const InputDecoration(
                                                          hintText:
                                                              'Find your imagination',
                                                          border:
                                                              InputBorder.none,
                                                          contentPadding:
                                                              EdgeInsets.only(
                                                                  left: 15),
                                                        ),
                                                        style: CustomTheme.base
                                                            .copyWith(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        if (kDebugMode) {
                                                          print('clicked');
                                                        }
                                                        if (searchController
                                                                    .text !=
                                                                'null' &&
                                                            searchController
                                                                .text
                                                                .isNotEmpty) {
                                                          Navigator.pushNamed(
                                                              context,
                                                              RoutesName
                                                                  .search_result);
                                                        }
                                                      },
                                                      child: Container(
                                                        color: CustomTheme
                                                            .primaryColor,
                                                        width: 50,
                                                        height: 50,
                                                        child: const Icon(
                                                          Icons.search,
                                                          color: Colors.white,
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
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Gerne',
                                    style: CustomTheme.h6
                                        .copyWith(fontWeight: FontWeight.w600),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.add_card_sharp))
                                ],
                              )),
                        ),
                        SliverPadding(
                          padding: EdgeInsets.all(5),
                          sliver: Consumer<GenersViewModel>(
                              builder: (context, value, child) {
                            // value.fetchGernes();
                            // print(value.geners);
                            switch (value.gerne.status) {
                              case Status.LOADING:
                                return const SliverToBoxAdapter(
                                  child: Center(
                                    child: CircularProgressIndicator.adaptive(),
                                  ),
                                );
                              case Status.ERROR:
                                return SliverToBoxAdapter(
                                  child: Text(value.gerne.message.toString()),
                                );
                              case Status.COMPLETED:
                                return
                                    // print(
                                    //     "called this ml ${genersViewModel.geners}");
                                    SliverToBoxAdapter(
                                  child: Container(
                                    margin: const EdgeInsets.only(bottom: 10),
                                    height: 81,
                                    child: ListView.builder(
                                      itemCount: value.geners.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return Gerne(
                                            imagePath: 'assets/photos/tree.jpg',
                                            text: value.geners[index]);
                                      },
                                    ),
                                  ),
                                );
                              default:
                                return SliverToBoxAdapter(child: Container());
                            }
                          }),
                        ),
                        SliverPadding(
                          padding: const EdgeInsets.all(5),
                          sliver: Consumer<HomeViewModel>(
                            builder: (context, value, child) {
                              ValueNotifier<List<Map<String, dynamic>>>
                                  imageListNotifier;

// Initialize the ValueNotifier with the initial value of the imageList
                              imageListNotifier =
                                  ValueNotifier<List<Map<String, dynamic>>>(
                                      value.imageList);

// ...

                              // print(value.media);
                              switch (value.media.status) {
                                case Status.LOADING:
                                  return const SliverToBoxAdapter(
                                    child: Center(
                                      child:
                                          CircularProgressIndicator.adaptive(),
                                    ),
                                  );
                                case Status.ERROR:
                                  return SliverToBoxAdapter(
                                    child: Text(value.media.message.toString()),
                                  );
                                case Status.COMPLETED:
                                  return SliverPadding(
                                    padding: const EdgeInsets.all(5),
                                    sliver: SliverMasonryGrid(
                                      delegate: SliverChildBuilderDelegate(
                                        addSemanticIndexes: true,
                                        addRepaintBoundaries: true,
                                        (context, index) {
                                          if (index < value.imageList.length) {
                                            // Render existing images

                                            String imagePath = value
                                                .imageList[index]['imagePath']
                                                .toString();
                                            String imageUrl;

                                            if (imagePath.startsWith('http')) {
                                              imageUrl = imagePath;
                                            } else {
                                              imageUrl =
                                                  '${AppUrl.baseImageStorageUrl}$imagePath';
                                            }

                                            return InkWell(
                                              onTap: () async {
                                                final String slug = value
                                                    .imageList[index]['slug']
                                                    .toString();

                                                await imageOpenViewModel
                                                    .fetchImageOpenMedia(
                                                        slug, context);

                                                if (!imageOpenViewModel
                                                    .loading) {
                                                  if (context.mounted) {
                                                    Navigator.pushNamed(context,
                                                        RoutesName.image_open);
                                                  }
                                                }
                                              },
                                              child: Card(
                                                child: Stack(
                                                  alignment: Alignment.topRight,
                                                  children: [
                                                    Image.network(
                                                      imageUrl,
                                                      fit: BoxFit.scaleDown,
                                                      errorBuilder: (context,
                                                          error, stackTrace) {
                                                        return SizedBox
                                                            .shrink();
                                                      },
                                                    ),
                                                    // Create a ValueNotifier to wrap the imageList

                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        ValueListenableBuilder<
                                                            List<
                                                                Map<String,
                                                                    dynamic>>>(
                                                          valueListenable:
                                                              imageListNotifier,
                                                          builder: (context,
                                                              imageList,
                                                              child) {
                                                            bool isFavorite = imageList
                                                                    .isNotEmpty &&
                                                                imageList[index]
                                                                    [
                                                                    'isFavorite'];

                                                            return IconButton(
                                                              onPressed:
                                                                  () async {
                                                                if (isFavorite) {
                                                                  final provider = Provider.of<
                                                                          FavouriteViewModel>(
                                                                      context,
                                                                      listen:
                                                                          false);
                                                                  provider
                                                                      .deleteFavouriteMedia(
                                                                          imageList[index]
                                                                              [
                                                                              'id'],
                                                                          context,
                                                                          provider)
                                                                      .catchError(
                                                                          (error) {
                                                                    // Handle the error case
                                                                    print(
                                                                        error);
                                                                  });
                                                                }
                                                              },
                                                              icon: Icon(
                                                                isFavorite
                                                                    ? Icons
                                                                        .favorite
                                                                    : Icons
                                                                        .favorite_outline,
                                                                color: isFavorite
                                                                    ? Colors.red
                                                                    : Colors
                                                                        .white,
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                        const Icon(
                                                          Icons
                                                              .bookmark_add_outlined,
                                                          color: Colors.white,
                                                        ),
                                                        const Icon(
                                                          Icons.share,
                                                          color: Colors.white,
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          } else {
                                            final newIndex =
                                                index - value.imageList.length;
                                            if (newIndex <
                                                value.newlyAddedImages.length) {
                                              String imagePath = value
                                                  .newlyAddedImages[newIndex]
                                                      ['imagePath']
                                                  .toString();
                                              String imageUrl;

                                              if (imagePath
                                                  .startsWith('http')) {
                                                imageUrl = imagePath;
                                              } else {
                                                imageUrl =
                                                    '${AppUrl.baseImageStorageUrl}$imagePath';
                                              }

                                              return InkWell(
                                                onTap: () async {
                                                  final String slug = value
                                                      .newlyAddedImages[
                                                          newIndex]['slug']
                                                      .toString();

                                                  await imageOpenViewModel
                                                      .fetchImageOpenMedia(
                                                          slug, context);
                                                  // print(
                                                  //     "Printing from homescreen: ${imageOpenViewModel.data}");
                                                  if (!imageOpenViewModel
                                                      .loading) {
                                                    if (context.mounted) {
                                                      Navigator.pushNamed(
                                                          context,
                                                          RoutesName
                                                              .image_open);
                                                    }
                                                  }
                                                },
                                                child: Card(
                                                  child: Stack(
                                                    alignment:
                                                        Alignment.topRight,
                                                    children: [
                                                      Image.network(
                                                        imageUrl,
                                                        fit: BoxFit.none,
                                                        errorBuilder: (context,
                                                            error, stackTrace) {
                                                          return SizedBox();
                                                        },
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          value.newlyAddedImages[
                                                                      newIndex]
                                                                  ['isFavorite']
                                                              ? const Icon(
                                                                  Icons
                                                                      .favorite,
                                                                  color: Colors
                                                                      .red,
                                                                )
                                                              : const Icon(
                                                                  Icons
                                                                      .favorite_outline,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                          const Icon(
                                                            Icons
                                                                .bookmark_add_outlined,
                                                            color: Colors.white,
                                                          ),
                                                          const Icon(
                                                            Icons.share,
                                                            color: Colors.white,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            } else {
                                              // This case should not be reached, but added for completeness
                                              return const SizedBox();
                                            }
                                          }
                                        },
                                        addAutomaticKeepAlives: true,
                                        childCount: value.imageList.length +
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
                        child: AnimatedBuilder(
                          animation: homeViewModel,
                          builder: (context, child) {
                            final isLastItemShown =
                                homeViewModel.showDiscoverMore;
                            return Visibility(
                              visible: isLastItemShown,
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: InkWell(
                                  onTap: () {
                                    // nextPage = currentPage + 1;
                                    // currentPage = nextPage;
                                    // homeViewModel.loadMoreData(nextPage);
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
                            );
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}
