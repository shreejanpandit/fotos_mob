import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  List<String> imageList = [
    'https://cdn.pixabay.com/photo/2019/03/15/09/49/girl-4056684_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
    'https://cdn.pixabay.com/photo/2020/09/18/19/31/laptop-5582775_960_720.jpg',
    'https://media.istockphoto.com/photos/woman-kayaking-in-fjord-in-norway-picture-id1059380230?b=1&k=6&m=1059380230&s=170667a&w=0&h=kA_A_XrhZJjw2bo5jIJ7089-VktFK0h0I4OWDqaac0c=',
    'https://cdn.pixabay.com/photo/2019/11/05/00/53/cellular-4602489_960_720.jpg',
    'https://cdn.pixabay.com/photo/2017/02/12/10/29/christmas-2059698_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/01/29/17/09/snowboard-4803050_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/02/06/20/01/university-library-4825366_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/11/22/17/28/cat-5767334_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/12/13/16/22/snow-5828736_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/12/09/09/27/women-5816861_960_720.jpg',
    'https://cdn.pixabay.com/photo/2019/03/15/09/49/girl-4056684_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
    'https://cdn.pixabay.com/photo/2020/09/18/19/31/laptop-5582775_960_720.jpg',
    'https://media.istockphoto.com/photos/woman-kayaking-in-fjord-in-norway-picture-id1059380230?b=1&k=6&m=1059380230&s=170667a&w=0&h=kA_A_XrhZJjw2bo5jIJ7089-VktFK0h0I4OWDqaac0c=',
    'https://cdn.pixabay.com/photo/2019/11/05/00/53/cellular-4602489_960_720.jpg',
    'https://cdn.pixabay.com/photo/2017/02/12/10/29/christmas-2059698_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/01/29/17/09/snowboard-4803050_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/02/06/20/01/university-library-4825366_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/11/22/17/28/cat-5767334_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/12/13/16/22/snow-5828736_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/12/09/09/27/women-5816861_960_720.jpg',
    'https://cdn.pixabay.com/photo/2019/03/15/09/49/girl-4056684_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
    'https://cdn.pixabay.com/photo/2020/09/18/19/31/laptop-5582775_960_720.jpg',
    'https://media.istockphoto.com/photos/woman-kayaking-in-fjord-in-norway-picture-id1059380230?b=1&k=6&m=1059380230&s=170667a&w=0&h=kA_A_XrhZJjw2bo5jIJ7089-VktFK0h0I4OWDqaac0c=',
    'https://cdn.pixabay.com/photo/2019/11/05/00/53/cellular-4602489_960_720.jpg',
    'https://cdn.pixabay.com/photo/2017/02/12/10/29/christmas-2059698_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/01/29/17/09/snowboard-4803050_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/02/06/20/01/university-library-4825366_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/11/22/17/28/cat-5767334_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/12/13/16/22/snow-5828736_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/12/09/09/27/women-5816861_960_720.jpg',
    'https://cdn.pixabay.com/photo/2019/03/15/09/49/girl-4056684_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
    'https://cdn.pixabay.com/photo/2020/09/18/19/31/laptop-5582775_960_720.jpg',
    'https://media.istockphoto.com/photos/woman-kayaking-in-fjord-in-norway-picture-id1059380230?b=1&k=6&m=1059380230&s=170667a&w=0&h=kA_A_XrhZJjw2bo5jIJ7089-VktFK0h0I4OWDqaac0c=',
    'https://cdn.pixabay.com/photo/2019/11/05/00/53/cellular-4602489_960_720.jpg',
    'https://cdn.pixabay.com/photo/2017/02/12/10/29/christmas-2059698_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/01/29/17/09/snowboard-4803050_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/02/06/20/01/university-library-4825366_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/11/22/17/28/cat-5767334_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/12/13/16/22/snow-5828736_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/12/09/09/27/women-5816861_960_720.jpg',
    'https://cdn.pixabay.com/photo/2019/03/15/09/49/girl-4056684_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
    'https://cdn.pixabay.com/photo/2020/09/18/19/31/laptop-5582775_960_720.jpg',
    'https://media.istockphoto.com/photos/woman-kayaking-in-fjord-in-norway-picture-id1059380230?b=1&k=6&m=1059380230&s=170667a&w=0&h=kA_A_XrhZJjw2bo5jIJ7089-VktFK0h0I4OWDqaac0c=',
    'https://cdn.pixabay.com/photo/2019/11/05/00/53/cellular-4602489_960_720.jpg',
    'https://cdn.pixabay.com/photo/2017/02/12/10/29/christmas-2059698_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/01/29/17/09/snowboard-4803050_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/02/06/20/01/university-library-4825366_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/11/22/17/28/cat-5767334_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/12/13/16/22/snow-5828736_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/12/09/09/27/women-5816861_960_720.jpg',
    'https://cdn.pixabay.com/photo/2019/03/15/09/49/girl-4056684_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
    'https://cdn.pixabay.com/photo/2020/09/18/19/31/laptop-5582775_960_720.jpg',
    'https://media.istockphoto.com/photos/woman-kayaking-in-fjord-in-norway-picture-id1059380230?b=1&k=6&m=1059380230&s=170667a&w=0&h=kA_A_XrhZJjw2bo5jIJ7089-VktFK0h0I4OWDqaac0c=',
    'https://cdn.pixabay.com/photo/2019/11/05/00/53/cellular-4602489_960_720.jpg',
    'https://cdn.pixabay.com/photo/2017/02/12/10/29/christmas-2059698_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/01/29/17/09/snowboard-4803050_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/02/06/20/01/university-library-4825366_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/11/22/17/28/cat-5767334_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/12/13/16/22/snow-5828736_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/12/09/09/27/women-5816861_960_720.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    // double baseWidth = 390;
    // double fem = 1;
    // double ffem = fem * 0.97;
    return MaterialApp(
      title: 'Flutter',
      debugShowCheckedModeBanner: false,
      scrollBehavior: MyCustomScrollBehavior(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        extendBody: true,
        backgroundColor: const Color(0xff239de9),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: <Widget>[
            Builder(builder: (context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            }),
          ],
          title: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Icon(
                Icons.favorite,
                color: Colors.pink,
                size: 24.0,
                semanticLabel: 'Text to announce in accessibility modes',
              ),
              // Container(
              //   width: 25.11,
              //   height: 28.25,
              //   child: Stack(
              //     children: [
              //       Positioned(
              //         left: 12.56,
              //         top: 13.81,
              //         child: Container(
              //           width: 10.67,
              //           height: 10.67,
              //           decoration: const BoxDecoration(
              //             shape: BoxShape.circle,
              //             color: Colors.white,
              //           ),
              //         ),
              //       ),
              //       Positioned.fill(
              //         child: Align(
              //           alignment: Alignment.topLeft,
              //           child: Container(
              //             width: 15.69,
              //             height: 15.69,
              //             decoration: BoxDecoration(
              //               shape: BoxShape.circle,
              //               border: Border.all(
              //                 color: Colors.white,
              //                 width: 1,
              //               ),
              //               color: const Color(0xff239de9),
              //             ),
              //           ),
              //         ),
              //       ),
              //       Positioned(
              //         left: 3.14,
              //         top: 3.14,
              //         child: Container(
              //           width: 4.39,
              //           height: 4.39,
              //           decoration: const BoxDecoration(
              //             shape: BoxShape.circle,
              //             color: Colors.white,
              //           ),
              //         ),
              //       ),
              //       Positioned.fill(
              //         child: Align(
              //           alignment: Alignment.bottomRight,
              //           child: Container(
              //             width: 3.77,
              //             height: 3.77,
              //             decoration: const BoxDecoration(
              //               shape: BoxShape.circle,
              //               color: Colors.white,
              //             ),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              SizedBox(width: 10),
              Text(
                "Fotos",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                ),
              ),
            ],
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        drawer: SizedBox(
          width: double.infinity,
          child: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Color(0xff0d3e5c),
                  ),
                  child: Text(
                    'Drawer Header',
                    style: TextStyle(
                      color: Color.fromARGB(255, 238, 248, 255),
                      fontSize: 24,
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text('Home'),
                  onTap: () {
                    // navigate to the Home screen
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('Settings'),
                  onTap: () {
                    // navigate to the Settings screen
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Icon(
                      Icons.audiotrack,
                      color: Colors.green,
                      size: 30.0,
                    ),
                    Icon(
                      Icons.audiotrack,
                      color: Colors.green,
                      size: 30.0,
                    ),
                    Icon(
                      Icons.audiotrack,
                      color: Colors.green,
                      size: 30.0,
                    ),
                  ],
                ) // add more items as needed...
              ],
            ),
          ),
        ),
        body: Container(
          // width: MediaQuery.of(context).size.width,
          // constraints: const BoxConstraints.expand(),
          // height: 844,
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
                  height: 800,
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Container(
                          height: 320,
                          color: Colors.white,
                          child: Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              Image.asset(
                                'assets/images/tree.jpg',
                                height: 320,
                                fit: BoxFit.fill,
                              ),
                              const Positioned(
                                top: 30,
                                child: Text(
                                  "Stunning free images &\nroyalty free stock",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              const Positioned(
                                top: 100,
                                child: Text(
                                  "Over 2.7 million+ high quality stock images,\nvideos and music shared by our talented\ncommunity",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
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
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                              children: const [
                                                Text(
                                                  "Find your imagination",
                                                  style: TextStyle(
                                                    color: Color(0x7f050505),
                                                    fontSize: 16,
                                                    fontFamily: "Poppins",
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                SizedBox(width: 43),
                                                SizedBox(
                                                    width: 30,
                                                    height: 30,
                                                    child: Icon(Icons.search)),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const Positioned(
                                top: 250,
                                child: Text(
                                  "Popular Images: new year, wallpaper, nature, background,\nsky, money, love, cat car, dog, food, flowers, ipone\nwallpaper",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
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
                                    Image.network(
                                      imageList[index],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
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
                  )

                  // SingleChildScrollView(
                  //   child: Column(
                  //     children: [
                  //       Container(
                  //         height: 320,
                  //         color: Colors.white,
                  //         child: Stack(
                  //           alignment: Alignment.topCenter,
                  //           children: [
                  //             Image.asset(
                  //               'assets/images/tree.jpg',
                  //               height: 320,
                  //               fit: BoxFit.fill,
                  //             ),
                  //             const Positioned(
                  //               top: 30,
                  //               child: Text(
                  //                 "Stunning free images &\nroyalty free stock",
                  //                 textAlign: TextAlign.center,
                  //                 style: TextStyle(
                  //                   color: Colors.white,
                  //                   fontSize: 24,
                  //                   fontFamily: "Poppins",
                  //                   fontWeight: FontWeight.w700,
                  //                 ),
                  //               ),
                  //             ),
                  //             const Positioned(
                  //               top: 100,
                  //               child: Text(
                  //                 "Over 2.7 million+ high quality stock images,\nvideos and music shared by our talented\ncommunity",
                  //                 textAlign: TextAlign.center,
                  //                 style: TextStyle(
                  //                   color: Colors.white,
                  //                   fontSize: 15,
                  //                 ),
                  //               ),
                  //             ),
                  //             Positioned(
                  //               top: 170,
                  //               child: SizedBox(
                  //                 width: 361,
                  //                 height: 50,
                  //                 child: Row(
                  //                   mainAxisSize: MainAxisSize.min,
                  //                   mainAxisAlignment: MainAxisAlignment.center,
                  //                   crossAxisAlignment: CrossAxisAlignment.center,
                  //                   children: [
                  //                     SizedBox(
                  //                       width: 361,
                  //                       height: 50,
                  //                       child: Material(
                  //                         color: Colors.white,
                  //                         borderRadius: BorderRadius.circular(20),
                  //                         child: Padding(
                  //                           padding: const EdgeInsets.only(
                  //                             left: 92,
                  //                             right: 19,
                  //                           ),
                  //                           child: Row(
                  //                             mainAxisSize: MainAxisSize.min,
                  //                             mainAxisAlignment:
                  //                                 MainAxisAlignment.end,
                  //                             crossAxisAlignment:
                  //                                 CrossAxisAlignment.center,
                  //                             children: const [
                  //                               Text(
                  //                                 "Find your imagination",
                  //                                 style: TextStyle(
                  //                                   color: Color(0x7f050505),
                  //                                   fontSize: 16,
                  //                                   fontFamily: "Poppins",
                  //                                   fontWeight: FontWeight.w500,
                  //                                 ),
                  //                               ),
                  //                               SizedBox(width: 43),
                  //                               SizedBox(
                  //                                   width: 30,
                  //                                   height: 30,
                  //                                   child: Icon(Icons.search)),
                  //                             ],
                  //                           ),
                  //                         ),
                  //                       ),
                  //                     ),
                  //                   ],
                  //                 ),
                  //               ),
                  //             ),
                  //             const Positioned(
                  //               top: 250,
                  //               child: Text(
                  //                 "Popular Images: new year, wallpaper, nature, background,\nsky, money, love, cat car, dog, food, flowers, ipone\nwallpaper",
                  //                 textAlign: TextAlign.center,
                  //                 style: TextStyle(
                  //                   color: Colors.white,
                  //                   fontSize: 12,
                  //                 ),
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //       SizedBox(
                  //           height: 700,
                  //           child: MasonryGridView.builder(
                  //               itemCount: imageList.length,
                  //               shrinkWrap: true,
                  //               // physics: NeverScrollableScrollPhysics(),
                  // gridDelegate:
                  //     const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  //         crossAxisCount: 2),
                  //               itemBuilder: ((context, index) => Card(
                  //                     child: Stack(
                  //                       alignment: Alignment.topRight,
                  //                       children: [
                  //                         Image.network(
                  //                           imageList[index],
                  //                         ),
                  //                         Row(
                  //                           mainAxisAlignment:
                  //                               MainAxisAlignment.end,
                  //                           children: const [
                  //                             Icon(
                  //                               Icons.favorite,
                  //                               color: Colors.white,
                  //                             ),
                  //                             Icon(
                  //                               Icons.bookmark_add,
                  //                                color: Colors.white,
                  //                             ),
                  //                             Icon(
                  //                               Icons.share,
                  //                               color: Colors.white,
                  //                             ),
                  //                           ],
                  //                         ),
                  //                       ],
                  //                     ),
                  //                   ))))
                  //     ],
                  //   ),
                  // ),

                  ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  width: double.infinity,
                  height: 20,
                  decoration: const BoxDecoration(
                    // borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0x00efd7d7),
                        Color(0xf0dad8d8),
                        Color(0xffd9d9d9)
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
    );
  }
}
