import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:myapp/utils/utils.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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

  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FOTOS',
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
            children: [
              SizedBox(
                height: 50.0,
                child: Image.asset(
                  'assets/branding/images/logo.png',
                ),
              ),
              const SizedBox(width: 10),
              const Text(
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
                                'assets/photos/space.png',
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
                                    Image.asset(
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
                  )),
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
