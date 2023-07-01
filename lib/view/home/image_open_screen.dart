// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import 'package:fotos_mobile/res/typo_theme_data.dart';
import 'package:fotos_mobile/view/profile/profile_screen.dart';
import 'package:fotos_mobile/view_model/appbar_item_view_model.dart';
import 'package:fotos_mobile/view_model/image_open_view_model.dart';

import '../../res/app_urls.dart';
import '../../res/components/appbar_widget.dart';
import '../../res/components/drawer_widget.dart';

class ImageOpenScreen extends StatefulWidget {
  const ImageOpenScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ImageOpenScreen> createState() => _ImageOpenScreenState();
}

class _ImageOpenScreenState extends State<ImageOpenScreen> {
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
    return Scaffold(
      appBar: CustomAppBar(
        scaffoldKey: scaffoldKey,
        automaticallyImplyLeading: true,
      ),
      body: Scaffold(
        key: scaffoldKey,
        drawer: const AppDrawer(),
        body: appbarProvider.showBody
            ? Container(
                margin: const EdgeInsets.only(left: 15, right: 15),
                child:
                    SingleChildScrollView(child: Consumer<ImageOpenViewModel>(
                  builder: (context, value, child) {
                    String formatedDate = formatDate(value.data['created_at']);
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 28, 16, 16),
                          child: Container(
                            child: Container(
                              height: 40,
                              width: double.infinity,
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 40,
                                    height: 40,
                                    child: CircleAvatar(
                                      // backgroundImage: NetworkImage(value
                                      //     .mediasMedia.data!.imagePath
                                      //     .toString())
                                      backgroundImage: AssetImage(
                                          'assets/branding/images/avatar.png'),
                                    ),
                                  ),
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
                                          // mainAxisAlignment:
                                          //     MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              value.data['user']['name']
                                                  .toString(),
                                              style: const TextStyle(
                                                color: Color(0xFF000000),
                                                fontSize: 17,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            Text(
                                              value.data['user']
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
                                                onPressed: () {},
                                                icon: const Icon(
                                                  Icons.favorite_rounded,
                                                  color: Colors.black,
                                                )),
                                            IconButton(
                                                onPressed: () {},
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
                            value.data['image_path'],
                            fit: BoxFit.fitWidth,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.network(
                                  '${AppUrl.baseImageStorageUrl}${value.data['image_path'].toString()}');
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Icon(Icons.calendar_today,
                                  color: CustomTheme.faintTextColor),
                              Text(
                                formatedDate.toString(),
                                style: CustomTheme.xSmall.copyWith(
                                    color: CustomTheme.faintTextColor),
                              ),
                              const Icon(Icons.camera_alt,
                                  color: CustomTheme.faintTextColor),
                              Text(
                                'Canon, PowerShot SX530 HS',
                                style: CustomTheme.xSmall.copyWith(
                                    color: CustomTheme.faintTextColor),
                              ),
                              const Icon(Icons.remove_red_eye,
                                  color: CustomTheme.faintTextColor),
                              Text(
                                '12,716,540',
                                style: CustomTheme.xSmall.copyWith(
                                    color: CustomTheme.faintTextColor),
                              ),
                              const Icon(Icons.file_download_outlined,
                                  color: CustomTheme.faintTextColor),
                              Text(
                                '118,667',
                                style: CustomTheme.xSmall.copyWith(
                                    color: CustomTheme.faintTextColor),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 5, top: 8),
                          child: const Text(
                            overflow: TextOverflow.visible,
                            'In New Braunfels, Texas, the deer often flood the golf course and surrounding residential yards around sunset.',
                            style: TextStyle(
                              color: CustomTheme.faintTextColor,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 14, bottom: 16),
                          child: const Text(
                            'Photo may you like',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 13),
                              child: Wrap(
                                children: [
                                  SmallSearchItem(
                                    text: 'Lion',
                                  ),
                                  SmallSearchItem(
                                    text: 'Cat',
                                  ),
                                  SmallSearchItem(
                                    text: 'Dog',
                                  ),
                                  SmallSearchItem(
                                    text: 'Wolf',
                                  ),
                                  SmallSearchItem(
                                    text: 'Fish',
                                  ),
                                  SmallSearchItem(
                                    text: 'Duck',
                                  ),
                                  SmallSearchItem(
                                    text: 'Monkey',
                                  ),
                                ],
                              ),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 3,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    print(
                                        '${imageList[index]} at index $index');
                                  },
                                  child: const SearchImagesList(
                                    imagePath:
                                        "https://www.recordnet.com/gcdn/presto/2021/03/22/NRCD/9d9dd9e4-e84a-402e-ba8f-daa659e6e6c5-PhotoWord_003.JPG?width=660&height=425&fit=crop&format=pjpg&auto=webp",
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                )))
            : ProfileScreen(),
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
