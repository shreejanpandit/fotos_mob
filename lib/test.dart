import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 390,
        height: 844,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        padding: const EdgeInsets.only(
          right: 1,
          top: 11,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 362,
              height: 25,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 78.24,
                    child: Text(
                      "10:00 AM",
                      style: TextStyle(
                        color: Color(0xff1e1e1e),
                        fontSize: 14,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(width: 296.79),
                  Container(
                    width: 24.52,
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: FlutterLogo(size: 20),
                  ),
                  SizedBox(width: 296.79),
                  Container(
                    width: 29.19,
                    height: 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: FlutterLogo(size: 25),
                  ),
                  SizedBox(width: 296.79),
                  Transform.rotate(
                    angle: 1.57,
                    child: Container(
                      width: 16,
                      height: 18.68,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: FlutterLogo(size: 16),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 1),
            Container(
              width: 362,
              height: 50,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 390,
                    height: double.infinity,
                    color: Colors.white,
                    padding: const EdgeInsets.only(
                      left: 18,
                      right: 15,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 104.11,
                          height: 50,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 15.69,
                                height: 15.69,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Color(0xff239de9),
                                    width: 1,
                                  ),
                                  color: Colors.white,
                                ),
                              ),
                              Container(
                                width: 4.39,
                                height: 4.39,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xff239de9),
                                ),
                              ),
                              Container(
                                width: 10.67,
                                height: 10.67,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xff239de9),
                                ),
                              ),
                              Container(
                                width: 3.77,
                                height: 3.77,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xff239de9),
                                ),
                              ),
                              Text(
                                "Fotos",
                                style: TextStyle(
                                  color: Color(0xff239de9),
                                  fontSize: 40,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 217.89),
                        Container(
                          width: 35,
                          height: 35,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 35,
                                height: 35,
                                child: Stack(
                                  children: [
                                    Container(
                                      width: 35,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color(0x19000000),
                                            blurRadius: 0,
                                            offset: Offset(0, 0),
                                          ),
                                          BoxShadow(
                                            color: Color(0x19000000),
                                            blurRadius: 2,
                                            offset: Offset(0, 1),
                                          ),
                                          BoxShadow(
                                            color: Color(0x16000000),
                                            blurRadius: 3,
                                            offset: Offset(0, 3),
                                          ),
                                          BoxShadow(
                                            color: Color(0x14000000),
                                            blurRadius: 5,
                                            offset: Offset(1, 8),
                                          ),
                                          BoxShadow(
                                            color: Color(0x02000000),
                                            blurRadius: 5,
                                            offset: Offset(1, 14),
                                          ),
                                          BoxShadow(
                                            color: Color(0x00000000),
                                            blurRadius: 6,
                                            offset: Offset(2, 21),
                                          ),
                                        ],
                                        color: Color(0xff239de9),
                                      ),
                                    ),
                                    Positioned(
                                      left: 6,
                                      top: 10,
                                      child: Container(
                                        width: 22,
                                        height: 15,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 1),
            Container(
              width: 181,
              height: 49,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 49,
                    height: 49,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: FlutterLogo(size: 49),
                  ),
                  SizedBox(width: 13),
                  SizedBox(
                    width: 119,
                    height: 35,
                    child: Text(
                      "John Doe",
                      style: TextStyle(
                        color: Color(0xff239de9),
                        fontSize: 24,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 1),
            Container(
              width: 390,
              height: 228,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                ),
                color: Color(0xff239de9),
              ),
              padding: const EdgeInsets.only(
                left: 33,
                right: 32,
                top: 37,
                bottom: 92,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 146,
                    height: 99,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 146,
                          height: 99,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x19000000),
                                blurRadius: 0,
                                offset: Offset(0, 0),
                              ),
                              BoxShadow(
                                color: Color(0x19000000),
                                blurRadius: 13,
                                offset: Offset(0, 6),
                              ),
                              BoxShadow(
                                color: Color(0x16000000),
                                blurRadius: 24,
                                offset: Offset(-1, 24),
                              ),
                              BoxShadow(
                                color: Color(0x0c000000),
                                blurRadius: 32,
                                offset: Offset(-2, 54),
                              ),
                              BoxShadow(
                                color: Color(0x02000000),
                                blurRadius: 38,
                                offset: Offset(-3, 96),
                              ),
                              BoxShadow(
                                color: Color(0x00000000),
                                blurRadius: 42,
                                offset: Offset(-5, 150),
                              ),
                            ],
                            color: Colors.white,
                          ),
                          padding: const EdgeInsets.only(
                            left: 34,
                            right: 33,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Followers",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                ),
                              ),
                              Text(
                                "45+",
                                style: TextStyle(
                                  color: Color(0xff239de9),
                                  fontSize: 40,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 33),
                  Container(
                    width: 146,
                    height: 99,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 146,
                          height: 99,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x19000000),
                                blurRadius: 0,
                                offset: Offset(0, 0),
                              ),
                              BoxShadow(
                                color: Color(0x19000000),
                                blurRadius: 13,
                                offset: Offset(0, 6),
                              ),
                              BoxShadow(
                                color: Color(0x16000000),
                                blurRadius: 24,
                                offset: Offset(-1, 24),
                              ),
                              BoxShadow(
                                color: Color(0x0c000000),
                                blurRadius: 32,
                                offset: Offset(-2, 54),
                              ),
                              BoxShadow(
                                color: Color(0x02000000),
                                blurRadius: 38,
                                offset: Offset(-3, 96),
                              ),
                              BoxShadow(
                                color: Color(0x00000000),
                                blurRadius: 42,
                                offset: Offset(-5, 150),
                              ),
                            ],
                            color: Colors.white,
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 13,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Collection",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                ),
                              ),
                              Text(
                                "10+",
                                style: TextStyle(
                                  color: Color(0xff239de9),
                                  fontSize: 40,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 1),
            Container(
              width: 390,
              height: 477,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                ),
                color: Colors.white,
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 129,
                    top: 462,
                    child: Container(
                      width: 134,
                      height: 5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 21,
                    top: 25,
                    child: Container(
                      width: 80,
                      height: 105,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            child: FlutterLogo(size: 80),
                          ),
                          SizedBox(height: 8),
                          SizedBox(
                            width: 62,
                            height: 17,
                            child: Text(
                              "Profile",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xff239de9),
                                fontSize: 16,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 145,
                    top: 25,
                    child: Container(
                      width: 103,
                      height: 112,
                      padding: const EdgeInsets.only(
                        top: 6,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            child: FlutterLogo(size: 80),
                          ),
                          SizedBox(height: 2),
                          Text(
                            "Subscription",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xff239de9),
                              fontSize: 16,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 292,
                    top: 36,
                    child: Container(
                      width: 75.38,
                      height: 101,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 75.38,
                            height: 70,
                            child: FlutterLogo(size: 70),
                          ),
                          SizedBox(height: 7),
                          Text(
                            "Media",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xff239de9),
                              fontSize: 16,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 23,
                    top: 178,
                    child: Container(
                      width: 75,
                      height: 106,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 75,
                            height: 75,
                            child: FlutterLogo(size: 75),
                          ),
                          SizedBox(height: 7),
                          Text(
                            "Settings",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xff239de9),
                              fontSize: 16,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 158,
                    top: 178,
                    child: Container(
                      width: 77,
                      height: 106,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 75,
                            height: 75,
                            child: FlutterLogo(size: 75),
                          ),
                          SizedBox(height: 7),
                          Text(
                            "Statistics",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xff239de9),
                              fontSize: 16,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 289,
                    top: 178,
                    child: Container(
                      width: 82,
                      height: 106,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 75,
                            height: 75,
                            child: FlutterLogo(size: 75),
                          ),
                          SizedBox(height: 7),
                          Text(
                            "Messages",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xff239de9),
                              fontSize: 16,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 23,
                    top: 332,
                    child: Container(
                      width: 83,
                      height: 105,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 75,
                            height: 75,
                            child: FlutterLogo(size: 75),
                          ),
                          SizedBox(height: 6),
                          Text(
                            "Collection",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xff239de9),
                              fontSize: 16,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 150,
                    top: 332,
                    child: Container(
                      width: 218,
                      height: 99,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 218,
                            height: 99,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              border: Border.all(
                                color: Color(0xff239de9),
                                width: 4,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x19000000),
                                  blurRadius: 0,
                                  offset: Offset(0, 0),
                                ),
                                BoxShadow(
                                  color: Color(0x19000000),
                                  blurRadius: 16,
                                  offset: Offset(0, 7),
                                ),
                                BoxShadow(
                                  color: Color(0x16000000),
                                  blurRadius: 29,
                                  offset: Offset(0, 29),
                                ),
                                BoxShadow(
                                  color: Color(0x0c000000),
                                  blurRadius: 39,
                                  offset: Offset(0, 64),
                                ),
                                BoxShadow(
                                  color: Color(0x02000000),
                                  blurRadius: 46,
                                  offset: Offset(0, 114),
                                ),
                                BoxShadow(
                                  color: Color(0x00000000),
                                  blurRadius: 50,
                                  offset: Offset(0, 178),
                                ),
                              ],
                              color: Colors.white,
                            ),
                            padding: const EdgeInsets.only(
                              left: 26,
                              right: 13,
                              top: 20,
                              bottom: 19,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "UPLOAD",
                                  style: TextStyle(
                                    color: Color(0xff239de9),
                                    fontSize: 26,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(width: 13),
                                Container(
                                  width: 62,
                                  height: 60,
                                  child: FlutterLogo(size: 60),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
