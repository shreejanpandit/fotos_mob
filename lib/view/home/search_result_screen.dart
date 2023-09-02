// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fotos_mobile/models/media_model.dart';
import 'package:fotos_mobile/res/typo_theme_data.dart';
import 'package:provider/provider.dart';

import 'package:fotos_mobile/view_model/appbar_item_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

import '../../res/app_urls.dart';
import '../../res/components/appbar_widget.dart';
import '../../res/components/drawer_widget.dart';
import 'package:http/http.dart' as http;

import '../../utils/routes/routes_name.dart';
import '../../view_model/image_open_view_model.dart';

class SearchResultPage extends StatefulWidget {
  const SearchResultPage({Key? key}) : super(key: key);

  @override
  State<SearchResultPage> createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResultPage> {
  TextEditingController searchController = TextEditingController();

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  String? searchText;
  // Future<void> searchData(String? searchText) async {
  //   try {} catch (e) {
  //     print(e);
  //   }
  // }

  List<MediaData?>? mediaData;
  Future<List<MediaData?>?> searchResultData(String? searchText) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    final token = sp.getString('token');
    try {
      print('${AppUrl.baseUrl}search?search=$searchText');
      final response = await http.get(
          Uri.parse('${AppUrl.baseUrl}search?search=$searchText'),
          headers: {
            'X-Requested-With': 'XMLHttpRequest',
            'Authorization': "Bearer $token",
          });
      if (response.statusCode == 200) {
        final decodedResp = jsonDecode(response.body);
        mediaData = MediaModel.fromJson(decodedResp).data!;
        print('.......search...............$mediaData');
        print('........search response body............${response.body}');
        return mediaData;
      } else {
        print('unsucessful ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    }
    return [];
  }

  bool loading = true;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      final arguments =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
      if (arguments != null && arguments.containsKey('searchText')) {
        setState(() {
          searchText = arguments['searchText'];
        });
        searchResultData(searchText).then((value) {
          setState(() {
            loading = false;
          });
        });

        print(
            'Received searchText: $searchText'); // Add this line for debugging
      } else {
        print('Arguments are null or do not contain "searchText" key.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final appbarProvider = Provider.of<AppbarViewModel>(context);
    List imageList = [
      "https://cdn.britannica.com/91/7991-050-7C23324E/roe-deer-velvet.jpg",
      "https://myrepublica.nagariknetwork.com/uploads/media/2018/September/sadpug.jpg",
      "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2018/04/24144817/American-Staffordshire-Terrier-lying-outdoors-next-to-a-kitten-that-is-playing-with-the-dogs-nose.jpg",
    ];
    var imageOpenViewModel = Provider.of<ImageOpenViewModel>(context);
    return Scaffold(
      appBar: CustomAppBar(
        scaffoldKey: scaffoldKey,
        automaticallyImplyLeading: false,
      ),
      body: Scaffold(
        key: scaffoldKey,
        drawer: const AppDrawer(),
        body: Container(
          margin: const EdgeInsets.only(left: 25.5, right: 25.5),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  padding: const EdgeInsets.only(left: 18, right: 18),
                  width: double.infinity,
                  height: 45,
                  decoration: ShapeDecoration(
                    color: const Color(0x7AE4E4E4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextField(
                          controller: searchController,
                          decoration: const InputDecoration(
                            hintText: 'Search',
                            hintStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                            ),
                            border: InputBorder.none,
                          ),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          loading = true;

                          // await searchResultData(
                          //         searchController.text.toString())
                          //     .then((value) => loading = false);
                          if (searchController.text != 'null' &&
                              searchController.text.isNotEmpty) {
                            Navigator.pushNamed(
                                context, RoutesName.search_result, arguments: {
                              'searchText': searchController.text
                            });
                          }
                        },
                        icon: Icon(
                          Icons.search,
                          size: 16,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Search Result',
                    style: CustomTheme.h6,
                  ),
                ),
                if (loading)
                  const Center(child: CircularProgressIndicator.adaptive()),
                // if (!loading) Text(searchText.toString()),

                if (!loading)
                  mediaData!.length == 0
                      ? Text(
                          'No search item related found.',
                          style: TextStyle(fontSize: 16, color: Colors.red),
                        )
                      : SizedBox(
                          // height: MediaQuery.of(context).size.height * 2,
                          child: StaggeredGridView.countBuilder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            crossAxisCount: 2,
                            itemCount: mediaData!.length,
                            itemBuilder: (context, index) {
                              String imagePath =
                                  mediaData![index]!.imagePath.toString();
                              String imageUrl;

                              if (imagePath.startsWith('http')) {
                                imageUrl = imagePath;
                              } else {
                                imageUrl =
                                    '${AppUrl.baseImageStorageUrl}$imagePath';
                              }

                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Container(
                                    height:
                                        200, // Set the height of the image container
                                    child: InkWell(
                                      onTap: () async {
                                        final String slug =
                                            mediaData![index]!.slug.toString();
                                        final String mediaId =
                                            mediaData![index]!.id.toString();
                                        await imageOpenViewModel
                                            .fetchImageOpenMedia(
                                                slug, context, mediaId);

                                        print(
                                            'search screen image open ${slug}');
                                        if (!imageOpenViewModel.loading) {
                                          if (context.mounted) {
                                            Navigator.pushNamed(
                                                context, RoutesName.image_open);
                                          }
                                        }
                                      },
                                      child: Image.network(
                                        imageUrl,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    color: Colors.black.withOpacity(
                                        0.7), // Background color for the text
                                    padding: EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Text(
                                        '${mediaData![index]!.title.toString()}', // Replace with your desired text
                                        style: TextStyle(
                                          color: Colors.white, // Text color
                                          fontSize: 16.0, // Text size
                                          fontWeight:
                                              FontWeight.bold, // Text style
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                            staggeredTileBuilder: (index) =>
                                const StaggeredTile.fit(1),
                            mainAxisSpacing: 8.0,
                            crossAxisSpacing: 8.0,
                          ),
                        )
              ],
            ),
          ),
        ),
      ),
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
