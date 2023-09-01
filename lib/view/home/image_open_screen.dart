// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fotos_mobile/test.dart';
import 'package:fotos_mobile/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import 'package:fotos_mobile/res/typo_theme_data.dart';
import 'package:fotos_mobile/view_model/appbar_item_view_model.dart';
import 'package:fotos_mobile/view_model/image_open_view_model.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

import '../../data/response/status.dart';
import '../../repository/image_open_repository.dart';
import '../../res/app_urls.dart';
import '../../res/components/appbar_widget.dart';
import '../../res/components/drawer_widget.dart';
import '../../utils/routes/routes_name.dart';
import '../../view_model/favourite_view_model.dart';

// import 'package:flutter/material.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart ';

import '../../view_model/media_view_model.dart';
import '../../view_model/recommended_view_model.dart';

final imgOpenRepo = ImageOpenRepository(); // Initialize imgOpenRepo

class ImageOpenScreen extends StatefulWidget {
  const ImageOpenScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ImageOpenScreen> createState() => _ImageOpenScreenState();
}

class _ImageOpenScreenState extends State<ImageOpenScreen> {
  double _selectedRating = 0.0;
  bool _isRatingUpdating = false;
  bool _showRatingStars = false;
  String? mediaId;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () {
      var userProvider =
          Provider.of<RecommendedViewModel>(context, listen: false);
      var imgopen = Provider.of<ImageOpenViewModel>(context, listen: false);
      if (imgopen.mediaId != null) {
        userProvider.fetchRecommendedMedia(imgopen.mediaId.toString());
      }
    });
  }

  // void _onIconLongPress() {

  // }
  void _onIconLongPress(String userId, String mediaId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        double selectedRating = 0.0;
        return AlertDialog(
          title: const Text('Rate This Image'),
          content: RatingBar.builder(
            initialRating: selectedRating,
            minRating: 0,
            direction: Axis.horizontal,
            allowHalfRating: false,
            itemCount: 5,
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              size: 24.0,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              selectedRating = rating;
            },
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Submit'),
              onPressed: () async {
                // Here you can use the selected rating value, user ID, and media ID as needed
                int rating = selectedRating.toInt();
                Map data = {
                  "media_id": mediaId.toString(),
                  "creator_id": userId.toString(),
                  "rating": rating.toString(),
                };
                print('review : $data');
                try {
                  await imgOpenRepo.postReview(data);
                  Navigator.of(context).pop(); // Close the dialog
                  Utils.flushBarSucessMessage(
                    'Thank you for rating ! You rated $rating',
                    context,
                  );
                } catch (error) {
                  print('Error posting review: $error');
                  // Handle the error or show a message to the user
                }
              },
            ),
          ],
        );
      },
    );
  }

  void _onRatingUpdate(double rating) async {
    setState(() {
      _isRatingUpdating = true;
    });

    // Simulate sending data to the backend and waiting for update
    await Future.delayed(const Duration(seconds: 2));

    // After receiving the updated data from the backend
    setState(() {
      _isRatingUpdating = false;
      _selectedRating = rating;
      _showRatingStars = false; // Hide the stars after rating update
    });
  }

  // @override
  // void initState() {
  //   print('I am open screen slug ${widget.data}');
  //   super.initState();
  // }

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final appbarProvider = Provider.of<AppbarViewModel>(context);
    String formatDate(String dateString) {
      // Parse the input string into a DateTime object
      final dateTime = DateTime.parse(dateString);

      // Format the DateTime object into the desired format
      final formattedDate = DateFormat('MMMM d, y').format(dateTime);

      return formattedDate;
    }

    List imageList = [
      "https://cdn.britannica.com/91/7991-050-7C23324E/roe-deer-velvet.jpg",
      "https://myrepublica.nagariknetwork.com/uploads/media/2018/September/sadpug.jpg",
      "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2018/04/24144817/American-Staffordshire-Terrier-lying-outdoors-next-to-a-kitten-that-is-playing-with-the-dogs-nose.jpg",
    ];

    Future<void> _saveImage(BuildContext context, slug, imageFileName) async {
      String? message;
      // final scaffoldMessenger = ScaffoldMessenger.of(context);

      try {
        // Download image
        String url = '${AppUrl.baseUrl}downloads/$slug';
        final http.Response response = await http.post(Uri.parse(url));

        // Get temporary directory
        final dir = await getTemporaryDirectory();

        final timestamp = DateTime.now().millisecondsSinceEpoch;
        final originalFileName = imageFileName;
        final originalExtension = originalFileName.split('.').last;
        final fileName = 'image_$timestamp.$originalExtension';
        // Create an image name

        var filename = '${dir.path}/$fileName';
        print(dir.path);
        // Save to filesystem
        final file = File(filename);
        await file.writeAsBytes(response.bodyBytes);

        // Ask the user to save it
        final params = SaveFileDialogParams(sourceFilePath: file.path);
        final finalPath = await FlutterFileDialog.saveFile(params: params);

        if (finalPath != null) {
          message = 'Image saved to disk';
        }
      } catch (e) {
        message = 'An error occurred while saving the image';
      }

      if (message != null) {
        Utils.flushBarErrorMessage(message, context);
      }
    }

    var imageOpenViewModel = Provider.of<ImageOpenViewModel>(context);

    return Scaffold(
      appBar: CustomAppBar(
        scaffoldKey: scaffoldKey,
        automaticallyImplyLeading: true,
      ),
      body: Scaffold(
          key: scaffoldKey,
          drawer: const AppDrawer(),
          body: Container(
              margin: const EdgeInsets.only(left: 15, right: 15),
              child: SingleChildScrollView(child: Consumer<ImageOpenViewModel>(
                builder: (context, value, child) {
                  // mediaId = value.data['id'];
                  // print('media id is $mediaId');
                  print(value.data);
                  String formatedDate = value.data['created_at'] != null
                      ? formatDate(value.data['created_at'])
                      : '2023:06:23';
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 28, 16, 16),
                        child: Container(
                          child: SizedBox(
                            height: 40,
                            width: double.infinity,
                            child: Row(
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: const ShapeDecoration(
                                    shape: CircleBorder(),
                                  ),
                                  child: ClipOval(
                                    child: Image.network(
                                      '${AppUrl.baseImageStorageUrl}${value.data['data']['user']['image_path']}',
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Image.asset(
                                          'assets/branding/images/avatar.png',
                                          fit: BoxFit.cover,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                // SizedBox(
                                //   width: 40,
                                //   height: 40,
                                //   child: CircleAvatar(
                                //     // backgroundImage: NetworkImage(value
                                //     //     .mediasMedia.data!.imagePath
                                //     //     .toString())
                                //     backgroundImage: value.data['data']['user']
                                //                 ['image_path'] ==
                                //             null
                                //         ? const AssetImage(
                                //             'assets/branding/images/avatar.png')
                                //         : NetworkImage(
                                //             '${AppUrl.baseImageStorageUrl}${value.data['data']['user']['image_path']}'),
                                //   ),
                                // ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            value.data['data']['user']['name']
                                                .toString(),
                                            style: const TextStyle(
                                              color: Color(0xFF000000),
                                              fontSize: 16,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          Text(
                                            value.data['data']['user']
                                                    ['profession'] ??
                                                'Photographer',
                                            style: const TextStyle(
                                              color: Color(0xFF239DE9),
                                              fontSize: 12,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              print(value.data);
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        Test(value.data),
                                                  ));
                                            },
                                            icon: const Icon(
                                              Icons.comment_sharp,
                                              color: CustomTheme.secondaryColor,
                                            ),
                                          ),
                                          IconButton(
                                              onPressed: () async {
                                                if (value.data['data']
                                                    ['is_favourite']) {
                                                  print(value.data);
                                                  final provider = Provider.of<
                                                          FavouriteViewModel>(
                                                      context,
                                                      listen: false);
                                                  provider
                                                      .deleteFavouriteMedia(
                                                          value.data['data']
                                                                  ['id']
                                                              .toString(),
                                                          context,
                                                          provider)
                                                      .catchError((error) {
                                                    // Handle the error case
                                                    print(error);
                                                  });
                                                  setState(() {
                                                    value.data['data']
                                                            ['is_favourite'] =
                                                        false;
                                                  });
                                                } else if (!value.data['data']
                                                    ['is_favourite']) {
                                                  print(value.data);
                                                  final provider = Provider.of<
                                                          FavouriteViewModel>(
                                                      context,
                                                      listen: false);
                                                  provider
                                                      .addFavouriteMedia(
                                                          value.data['data']
                                                                  ['id']
                                                              .toString(),
                                                          context,
                                                          provider)
                                                      .catchError((error) {
                                                    // Handle the error case
                                                    print(error);
                                                  });
                                                  setState(() {
                                                    value.data['data']
                                                        ['is_favourite'] = true;
                                                  });
                                                }
                                              },
                                              icon: Icon(
                                                Icons.favorite_rounded,
                                                color: value.data['data']
                                                        ['is_favourite']
                                                    ? Colors.red
                                                    : Colors.black,
                                              )),
                                          IconButton(
                                              onPressed: () async {
                                                final provider = Provider.of<
                                                        ImageOpenViewModel>(
                                                    context,
                                                    listen: false);
                                                var data = provider.data;
                                                print(data);
                                                _saveImage(
                                                    context,
                                                    data['data']['slug'],
                                                    data['data']['image_path']);
                                                provider.fetchImageOpenMedia(
                                                    data['data']['slug'],
                                                    context,
                                                    data['data']['id']
                                                        .toString());
                                              },
                                              icon: const Icon(
                                                Icons.file_download_outlined,
                                                color: Colors.black,
                                              ))
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(bottom: 8),
                        width: double.infinity,
                        height: 281,
                        child: Image.network(
                          value.data['data']['image_path'],
                          fit: BoxFit.fitWidth,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.network(
                                '${AppUrl.baseImageStorageUrl}${value.data['data']['image_path'].toString()}');
                          },
                        ),
                        // decoration: BoxDecoration(
                        //   image: DecorationImage(
                        //     image: NetworkImage(value.data['image_path']),
                        //     fit: BoxFit.fill,
                        //   ),
                        // ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 5, top: 8),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Icon(Icons.calendar_today,
                                color: CustomTheme.faintTextColor),
                            Text(
                              formatedDate.toString(),
                              style: CustomTheme.xSmall
                                  .copyWith(color: CustomTheme.faintTextColor),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            // const Icon(Icons.camera_alt,
                            //     color: CustomTheme.faintTextColor),
                            // Text(
                            //   'Canon, PowerShot SX530 HS',
                            //   style: CustomTheme.xSmall.copyWith(
                            //       color: CustomTheme.faintTextColor),
                            // ),
                            // const Icon(Icons.remove_red_eye,
                            //     color: CustomTheme.faintTextColor),
                            // Text(
                            //   '12',
                            //   style: CustomTheme.xSmall
                            //       .copyWith(color: CustomTheme.faintTextColor),
                            // ),
                            const Icon(Icons.file_download_outlined,
                                color: CustomTheme.faintTextColor),
                            Text(
                              '${value.data['data']['download'].toString()}',
                              style: CustomTheme.xSmall
                                  .copyWith(color: CustomTheme.faintTextColor),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            GestureDetector(
                              onLongPress: () => _onIconLongPress(
                                  value.data['data']['user']['id'].toString(),
                                  value.data['data']['id'].toString()),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.star_half_outlined,
                                      color: Colors.amber),
                                  if (_showRatingStars)
                                    _isRatingUpdating
                                        ? const CircularProgressIndicator()
                                        : Container(
                                            width:
                                                240.0, // Set a fixed width for the star rating area
                                            child: RatingBar.builder(
                                              initialRating: _selectedRating,
                                              minRating: 0,
                                              direction: Axis.horizontal,
                                              allowHalfRating: false,
                                              itemCount: 5,
                                              itemPadding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 4.0),
                                              itemBuilder: (context, _) => Icon(
                                                Icons.star,
                                                size: 16.0,
                                                color: _selectedRating == 0.0 ||
                                                        _selectedRating < _ + 1
                                                    ? Colors.grey
                                                    : Colors.amber,
                                              ),
                                              onRatingUpdate: (rating) {
                                                _onRatingUpdate(rating);
                                              },
                                            ),
                                          ),
                                ],
                              ),
                            ),

                            // const Icon(Icons.star_half_sharp,
                            //     color: Colors.amber),
                            value.data['data']['rating'] == null
                                ? const Text('0')
                                : Text(
                                    '${value.data['data']['rating'].toString()}',
                                    style: CustomTheme.xSmall.copyWith(
                                        color: CustomTheme.faintTextColor),
                                  ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 5, top: 8),
                        child: Text(
                          overflow: TextOverflow.visible,
                          "${value.data['data']['description'].toString()}",
                          style: const TextStyle(
                            color: CustomTheme.faintTextColor,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 14, bottom: 16),
                        child: const Text(
                          'Photo you may like as well',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          // const Padding(
                          //   padding: EdgeInsets.only(top: 13),
                          //   child: Wrap(
                          //     children: [
                          //       SmallSearchItem(
                          //         text: 'Lion',
                          //       ),
                          //       SmallSearchItem(
                          //         text: 'Cat',
                          //       ),
                          //       SmallSearchItem(
                          //         text: 'Dog',
                          //       ),
                          //       SmallSearchItem(
                          //         text: 'Wolf',
                          //       ),
                          //       SmallSearchItem(
                          //         text: 'Fish',
                          //       ),
                          //       SmallSearchItem(
                          //         text: 'Duck',
                          //       ),
                          //       SmallSearchItem(
                          //         text: 'Monkey',
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          // ListView.builder(
                          //   shrinkWrap: true,
                          //   physics: const NeverScrollableScrollPhysics(),
                          //   itemCount: 3,
                          //   itemBuilder: (context, index) {
                          //     return GestureDetector(
                          //       onTap: () {
                          //         print('${imageList[index]} at index $index');
                          //       },
                          //       child: const SearchImagesList(
                          //         imagePath:
                          //             "https://www.recordnet.com/gcdn/presto/2021/03/22/NRCD/9d9dd9e4-e84a-402e-ba8f-daa659e6e6c5-PhotoWord_003.JPG?width=660&height=425&fit=crop&format=pjpg&auto=webp",
                          //       ),
                          //     );
                          //   },
                          // ),
                          Consumer<RecommendedViewModel>(
                            builder: (context, value, child) {
                              // print(value.fetchRecommendedMedia(mediaId));
                              switch (value.recommendedMedia.status) {
                                case Status.LOADING:
                                  return const Center(
                                    child: CircularProgressIndicator.adaptive(),
                                  );
                                case Status.ERROR:
                                  return Text(value.recommendedMedia.message
                                      .toString());
                                case Status.COMPLETED:
                                  return value.recommendedMedia.data!.isNotEmpty
                                      ? SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              1.5,
                                          child: StaggeredGridView.countBuilder(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            crossAxisCount: 2,
                                            itemCount: value
                                                .recommendedMedia.data!.length,
                                            itemBuilder: (context, index) {
                                              String imagePath = value
                                                  .recommendedMedia
                                                  .data![index]
                                                  .imagePath
                                                  .toString();
                                              String imageUrl;

                                              if (imagePath
                                                  .startsWith('http')) {
                                                imageUrl = imagePath;
                                              } else {
                                                imageUrl =
                                                    '${AppUrl.baseImageStorageUrl}$imagePath';
                                              }

                                              bool isFavorite = value
                                                      .recommendedMedia
                                                      .data![index]
                                                      .isFavourite ??
                                                  false;

                                              return Card(
                                                child: Stack(
                                                  alignment: Alignment.topRight,
                                                  children: [
                                                    InkWell(
                                                      onTap: () async {
                                                        final String slug = value
                                                            .recommendedMedia
                                                            .data![index]
                                                            .slug
                                                            .toString();
                                                        final String mediaId =
                                                            value
                                                                .recommendedMedia
                                                                .data![index]
                                                                .id
                                                                .toString();
                                                        await imageOpenViewModel
                                                            .fetchImageOpenMedia(
                                                                slug,
                                                                context,
                                                                mediaId);

                                                        print(
                                                            'media screen image open ${slug}');
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
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          IconButton(
                                                            onPressed:
                                                                () async {
                                                              if (isFavorite) {
                                                                final provider =
                                                                    Provider.of<
                                                                            FavouriteViewModel>(
                                                                        context,
                                                                        listen:
                                                                            false);
                                                                provider
                                                                    .deleteFavouriteMedia(
                                                                        value
                                                                            .recommendedMedia
                                                                            .data![
                                                                                index]
                                                                            .id
                                                                            .toString(),
                                                                        context,
                                                                        provider)
                                                                    .catchError(
                                                                        (error) {
                                                                  // Handle the error case
                                                                  print(error);
                                                                });
                                                              } else {
                                                                final provider =
                                                                    Provider.of<
                                                                            FavouriteViewModel>(
                                                                        context,
                                                                        listen:
                                                                            false);
                                                                provider
                                                                    .addFavouriteMedia(
                                                                        value
                                                                            .recommendedMedia
                                                                            .data![
                                                                                index]
                                                                            .id
                                                                            .toString(),
                                                                        context,
                                                                        provider)
                                                                    .catchError(
                                                                        (error) {
                                                                  // Handle the error case
                                                                  print(error);
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
                                            child: const Text(
                                                'No item for recommendation'),
                                          ),
                                        );
                                default:
                                  return Container();
                              }
                            },
                          )
                        ],
                      ),
                    ],
                  );
                },
              )))),
    );
  }
}

class SearchImagesList extends StatelessWidget {
  final String imagePath;
  const SearchImagesList({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 14, bottom: 14),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 173.98,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imagePath),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
              child: Row(
            children: [
              Padding(
                  padding: const EdgeInsets.only(left: 6, top: 9),
                  child: Container(
                    width: 33,
                    height: 31.35,
                    decoration: const ShapeDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/branding/images/avatar.png'),
                        fit: BoxFit.fill,
                      ),
                      shape: OvalBorder(),
                    ),
                  )),
              const SizedBox(width: 7),
              const Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'John Deo',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'Photographer',
                          style: TextStyle(
                            color: Color(0xFF239DE9),
                            fontSize: 8,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w300,
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 14),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Genre',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            'Animal',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}

class SmallSearchItem extends StatelessWidget {
  final String text;
  const SmallSearchItem({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 74,
      height: 24,
      margin: const EdgeInsets.only(right: 5, bottom: 5),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 0.25, color: Color(0x938F8F9D)),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w300),
        ),
      ),
    );
  }
}
