// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:fotos_mobile/data/response/status.dart';

import 'package:fotos_mobile/res/typo_theme_data.dart';
import 'package:fotos_mobile/view_model/favourite_view_model.dart';
import 'package:provider/provider.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

import '../../models/user_models.dart';

import '../../res/app_urls.dart';
import '../../utils/routes/routes_name.dart';
import '../../view_model/appbar_item_view_model.dart';
import '../../view_model/image_open_view_model.dart';
import '../../view_model/user_view_model.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  bool showPersonalInfo = true;
  // MediaViewModel _mediaViewModel = MediaViewModel();
  bool isImagePicked = false;
  TextEditingController collectionNameController = TextEditingController();
  TextEditingController collectionDescriptionController =
      TextEditingController();
  Future<UserModel> getUserData() => UserViewModel().getUser();
  ValueNotifier<String> selectedValueNotifier = ValueNotifier<String>('photo');
  List<String> imageList = [
    'assets/photos/seagull.png',
    'assets/photos/tree.jpg',
    'assets/photos/seagull.png',
    'assets/photos/tree.jpg',
  ];
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      Provider.of<FavouriteViewModel>(context, listen: false)
          .fetchFavouriteMedia();
    });
  }

  @override
  Widget build(BuildContext context) {
    var imageOpenViewModel = Provider.of<ImageOpenViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xFFA7A7A7),
            size: 16,
          ),
        ),
        title: const Center(
          child: Text(
            'Favourite Media',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 24, right: 26),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 14, bottom: 14, left: 24),
                child: Text(
                  "Images",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 19,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              Consumer<FavouriteViewModel>(builder: (context, value, child) {
                // print(value.favouriteMedia.status.toString());
                // print(value.favouriteMedia.data);

                switch (value.favouriteMedia.status) {
                  case Status.LOADING:
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  case Status.ERROR:
                    return Text(value.favouriteMedia.message.toString());
                  case Status.COMPLETED:
                    return value.favouriteMedia.data!.isNotEmpty
                        ? SizedBox(
                            height: MediaQuery.of(context).size.height,
                            child: StaggeredGridView.countBuilder(
                              crossAxisCount: 2,
                              itemCount: value.favouriteMedia.data!.length,
                              itemBuilder: (context, index) {
                                // print(
                                //   value.favouriteMedia.data![index].imagePath
                                //       .toString(),
                                // );

                                String imagePath = value
                                    .favouriteMedia.data![index].imagePath
                                    .toString();
                                String imageUrl;

                                if (imagePath.startsWith('http')) {
                                  imageUrl = imagePath;
                                } else {
                                  imageUrl =
                                      '${AppUrl.baseImageStorageUrl}$imagePath';
                                }

                                return Card(
                                  child: Stack(
                                    alignment: Alignment.topRight,
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          final String slug = value
                                              .favouriteMedia.data![index].slug
                                              .toString();
                                          final String mediaId = value
                                              .favouriteMedia.data![index].id
                                              .toString();
                                          Provider.of<AppbarViewModel>(context,
                                                  listen: false)
                                              .showBody = true;
                                          await imageOpenViewModel
                                              .fetchImageOpenMedia(
                                                  slug, context, mediaId);

                                          if (!imageOpenViewModel.loading) {
                                            if (context.mounted) {
                                              Navigator.pushNamed(context,
                                                  RoutesName.image_open);
                                            }
                                          }
                                        },
                                        child: Image.network(
                                          imageUrl,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Positioned(
                                        top: 3,
                                        right: 2,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            IconButton(
                                              onPressed: () async {
                                                final provider = Provider.of<
                                                        FavouriteViewModel>(
                                                    context,
                                                    listen: false);
                                                provider
                                                    .deleteFavouriteMedia(
                                                        value.favouriteMedia
                                                            .data![index].id
                                                            .toString(),
                                                        context,
                                                        provider)
                                                    .catchError((error) {
                                                  // Handle the error case
                                                  print(error);
                                                });
                                              },
                                              icon: const Icon(
                                                Icons.favorite,
                                                color: Colors.red,
                                              ),
                                            ),
                                            const Icon(
                                              Icons.bookmark_add_outlined,
                                              color: Colors.white,
                                            ),
                                            const Icon(
                                              Icons.share,
                                              color: Colors.white,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              staggeredTileBuilder: (index) =>
                                  const StaggeredTile.fit(1),
                              mainAxisSpacing: 8.0,
                              crossAxisSpacing: 8.0,
                            ),
                          )
                        : Center(
                            child: Container(
                                child:
                                    const Text('No item added to favourite')),
                          );
                  default:
                    return Container();
                }
              }),

              // const ShowMore(
              //   text: 'Show More',
              // )
            ],
          ),
        ),
      ),
    );
  }
}

class ShowMore extends StatelessWidget {
  final String text;
  const ShowMore({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: InkWell(
      onTap: () {}, // Added onTap callback
      child: Container(
        width: 111,
        height: 32,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26),
          color: CustomTheme.primaryColor,
        ),
        padding: const EdgeInsets.only(
          top: 5,
          bottom: 6,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text,
              style: const TextStyle(
                color: CustomTheme.whiteTextColor,
                fontSize: 15,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class CardWithImageAndText extends StatelessWidget {
  final String imagePath;
  final String text;

  const CardWithImageAndText({
    Key? key,
    required this.imagePath,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Container(
        height: 81,
        width: 159,
        decoration: BoxDecoration(
          // color: CustomTheme.faintTextColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.network(
              imagePath,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset('assets/photos/saturn.png');
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Center(
                child: Text(
                  text,
                  style: CustomTheme.base.copyWith(
                    color: CustomTheme.whiteTextColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
