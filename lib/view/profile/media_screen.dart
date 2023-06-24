import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fotos_mobile/res/components/profile_component/green_and_cancle_button.dart';

import 'package:fotos_mobile/res/typo_theme_data.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class MediaScreen extends StatefulWidget {
  const MediaScreen({super.key});

  @override
  State<MediaScreen> createState() => _MediaScreenState();
}

class _MediaScreenState extends State<MediaScreen> {
  bool showPersonalInfo = true;

  List<String> imageList = [
    'assets/photos/seagull.png',
    'assets/photos/tree.jpg',
    'assets/photos/seagull.png',
    'assets/photos/tree.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
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
              'My Medias',
              style: TextStyle(color: Colors.black),
            ),
          ),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 5),
              child: CircleAvatar(
                radius: 19,
                backgroundColor: Colors.black,
                child: IconButton(
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      _showBottomSheet(context);
                    }),
              ),
            ),
          ],
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
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
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Container(
                        height: 296,
                        child: CustomScrollView(
                          slivers: [
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
                                            fit: BoxFit.cover,
                                          ),
                                          const Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Icon(
                                                Icons.favorite_border_outlined,
                                                color: Colors.white,
                                              ),
                                              Icon(
                                                Icons.bookmark_add_outlined,
                                                color: Colors.white,
                                              ),
                                              Icon(
                                                Icons.share_outlined,
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
                    ),
                    const ShowMore(
                      text: 'Show More',
                    )
                  ],
                ),
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 14, bottom: 14, left: 24),
                        child: Text(
                          "Videos",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 19,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Container(
                          height: 226,
                          child: CustomScrollView(
                            slivers: [
                              SliverPadding(
                                padding: const EdgeInsets.all(5),
                                sliver: SliverMasonryGrid(
                                  delegate: SliverChildBuilderDelegate(
                                    (context, index) => Card(
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Image.asset(
                                            imageList[index],
                                          ),
                                          const Positioned(
                                            top: 0,
                                            right: 0,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Icon(
                                                  Icons.favorite_outline,
                                                  color: Colors.white,
                                                ),
                                                Icon(
                                                  Icons.bookmark_add_outlined,
                                                  color: Colors.white,
                                                ),
                                                Icon(
                                                  Icons.share_outlined,
                                                  color: Colors.white,
                                                ),
                                              ],
                                            ),
                                          ),
                                          const Icon(
                                            Icons.play_circle_fill_outlined,
                                            size: 40,
                                            color: Colors.white,
                                          ),
                                        ],
                                      ),
                                    ),
                                    childCount: 1,
                                  ),
                                  gridDelegate:
                                      const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: ShowMore(
                          text: 'Show More',
                        ),
                      )
                    ],
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
    return Container(
      height: 81,
      width: 159,
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(18),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              imagePath,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Text(
              text,
              style: CustomTheme.base.copyWith(
                color: CustomTheme.whiteTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _showBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled:
        true, // Make the bottom sheet take 3/4th of the screen height
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(35),
        topRight: Radius.circular(35),
      ),
    ),
    builder: (BuildContext context) {
      return Container(
        height: MediaQuery.of(context).size.height *
            0.75, // Adjust the height to take 3/4th of the screen
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 77, top: 31, right: 65),
                child: Center(
                    child: Text(
                  'Upload Your Creativity',
                  style: CustomTheme.base
                      .copyWith(fontSize: 22, fontWeight: FontWeight.w500),
                )),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(28, 31, 27, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        'Choose Media',
                        style: CustomTheme.base.copyWith(
                            fontSize: 17, fontWeight: FontWeight.w200),
                      ),
                    ),
                    Container(
                      width: 336,
                      height: 45.25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFFF9F9F9),
                        border: Border.all(
                          color: const Color(0xFFCDECFF),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Text(
                              'Select File',
                              style: CustomTheme.base.copyWith(
                                  color: CustomTheme.lightTextColor
                                      .withOpacity(0.4),
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 3),
                            child: Container(
                              width: 86,
                              height: 23,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: CustomTheme.primaryColor,
                              ),
                              child: const Center(
                                child: Text(
                                  'Upload',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(28, 0, 27, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text('Choose Collection'),
                    ),
                    Container(
                      width: 336,
                      height: 45.25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFFF9F9F9),
                        border: Border.all(
                          color: const Color(0xFFCDECFF),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Text(
                              'Select Collection',
                              style: CustomTheme.base.copyWith(
                                  color: CustomTheme.lightTextColor
                                      .withOpacity(0.4),
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: SvgPicture.asset(
                              'assets/branding/home/down_arrow.svg',
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(28, 0, 27, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        'Media Name',
                        style: CustomTheme.base.copyWith(
                            fontSize: 17, fontWeight: FontWeight.w200),
                      ),
                    ),
                    Container(
                      width: 336,
                      height: 45.25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFFF9F9F9),
                        border: Border.all(
                          color: const Color(0xFFCDECFF),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Text(
                              'Enter Media Name',
                              style: CustomTheme.base.copyWith(
                                  color: CustomTheme.lightTextColor
                                      .withOpacity(0.4),
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(28, 0, 27, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        'Media Description',
                        style: CustomTheme.base.copyWith(
                            fontSize: 17, fontWeight: FontWeight.w200),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      width: 336,
                      height: 124,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFFF9F9F9),
                        border: Border.all(
                          color: const Color(0xFFCDECFF),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 16, top: 3),
                            child: Text(
                              'Enter Media Description',
                              style: CustomTheme.base.copyWith(
                                  color: CustomTheme.lightTextColor
                                      .withOpacity(0.4),
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              GreenAndCancleButton(
                greenButtonText: 'Submit',
                onGreenButton: () {
                  Navigator.pop(context);
                  Alert(
                      style: AlertStyle(
                          titleStyle: TextStyle(color: Colors.white),
                          backgroundColor: CustomTheme.lightGreenColor),
                      context: context,
                      closeFunction: () {
                        Navigator.pop(context);
                      },
                      buttons: [],
                      image: SvgPicture.asset(
                        'assets/branding/home/tick.svg',
                        height: 41,
                        width: 41,
                      ),
                      title: 'Upload Sucessful !',
                      closeIcon: InkWell(
                        child: SvgPicture.asset(
                          'assets/branding/home/close.svg',
                          height: 20,
                          width: 20,
                        ),
                      )).show();
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}
