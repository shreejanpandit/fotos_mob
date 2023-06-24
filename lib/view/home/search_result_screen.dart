// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fotos_mobile/res/typo_theme_data.dart';
import 'package:fotos_mobile/view/profile/profile_screen.dart';
import 'package:fotos_mobile/view_model/appbar_item_view_model.dart';

import '../../res/components/appbar_widget.dart';
import '../../res/components/drawer_widget.dart';

class SearchResultPage extends StatefulWidget {
  const SearchResultPage({Key? key}) : super(key: key);

  @override
  State<SearchResultPage> createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResultPage> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final appbarProvider = Provider.of<AppbarViewModel>(context);
    List imageList = [
      "https://cdn.britannica.com/91/7991-050-7C23324E/roe-deer-velvet.jpg",
      "https://myrepublica.nagariknetwork.com/uploads/media/2018/September/sadpug.jpg",
      "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2018/04/24144817/American-Staffordshire-Terrier-lying-outdoors-next-to-a-kitten-that-is-playing-with-the-dogs-nose.jpg",
    ];
    return Scaffold(
      appBar: appBar(context, scaffoldKey),
      body: Scaffold(
        key: scaffoldKey,
        drawer: const AppDrawer(),
        body: appbarProvider.showBody
            ? Container(
                margin: const EdgeInsets.only(left: 25.5, right: 25.5),
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
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search',
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                ),
                                border: InputBorder.none,
                              ),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.search,
                            size: 16,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 85,
                      child: Text(
                        'Animals',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 13),
                              child: Wrap(
                                children: [
                                  SmallSearchItem(
                                    text: 'Wildlife',
                                  ),
                                  SmallSearchItem(
                                    text: 'Nature',
                                  ),
                                  SmallSearchItem(
                                    text: 'Cat',
                                  ),
                                  SmallSearchItem(
                                    text: 'Dog',
                                  ),
                                ],
                              ),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: imageList.length,
                              itemBuilder: (context, index) {
                                return SearchImagesList(
                                  imagePath: imageList[index],
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
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
