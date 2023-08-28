import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// class ChatMessage {
//   final String sender;
//   final String message;
//   final String profileImage;

//   ChatMessage({
//     required this.sender,
//     required this.message,
//     required this.profileImage,
//   });
// }

class UserMessagesScreen extends StatefulWidget {
  const UserMessagesScreen({Key? key}) : super(key: key);

  @override
  _UserMessagesScreenState createState() => _UserMessagesScreenState();
}

class _UserMessagesScreenState extends State<UserMessagesScreen> {
  // final List<ChatMessage> messages = [
  //   ChatMessage(
  //     sender: 'John',
  //     message: 'Hello!',
  //     profileImage: 'assets/branding/images/avatar1.png',
  //   ),
  //   ChatMessage(
  //     sender: 'Alice',
  //     message: 'Hi, how are you?',
  //     profileImage: 'assets/branding/images/avatar2.png',
  //   ),
  //   ChatMessage(
  //     sender: 'John',
  //     message: 'I\'m doing great. Thanks for asking!',
  //     profileImage: 'assets/branding/images/avatar1.png',
  //   ),
  //   ChatMessage(
  //     sender: 'Alice',
  //     message: 'That\'s good to hear!',
  //     profileImage: 'assets/branding/images/avatar2.png',
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
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
            'John Doe',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 15, right: 15, bottom: 18),
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
                        hintText: 'Search...',
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
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                      child: Column(
                        children: [
                          Container(
                            width: 117,
                            height: 118,
                            decoration: const ShapeDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/branding/images/avatar.png'),
                                fit: BoxFit.fill,
                              ),
                              shape: CircleBorder(),
                            ),
                          ),
                          const Text(
                            'John Deo',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 5, bottom: 4),
                            child: Text(
                              'Photographer',
                              style: TextStyle(
                                color: Color(0xFF239DE9),
                                fontSize: 14,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          const Text(
                            'XYZ Company',
                            style: TextStyle(
                              color: Color(0xFF5C5C5C),
                              fontSize: 14,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w300,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 228,
                    ),
                    Column(
                      // children: messages.map((message) {
                      //   final isSentByMe = message.sender == 'John';

                      //   return Container(
                      //     margin: EdgeInsets.symmetric(
                      //         vertical: 10, horizontal: 16),
                      //     child: Row(
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: [
                      //         CircleAvatar(
                      //           backgroundImage:
                      //               AssetImage(message.profileImage),
                      //         ),
                      //         SizedBox(width: 10),
                      //         Expanded(
                      //           child: Column(
                      //             crossAxisAlignment: isSentByMe
                      //                 ? CrossAxisAlignment.end
                      //                 : CrossAxisAlignment.start,
                      //             children: [
                      //               Text(
                      //                 message.sender,
                      //                 style: TextStyle(
                      //                   fontWeight: FontWeight.bold,
                      //                 ),
                      //               ),
                      //               SizedBox(height: 4),
                      //               Container(
                      //                 padding: EdgeInsets.all(8),
                      //                 decoration: BoxDecoration(
                      //                   color: isSentByMe
                      //                       ? Colors.blue
                      //                       : Colors.grey.shade300,
                      //                   borderRadius: BorderRadius.circular(8),
                      //                 ),
                      //                 child: Text(
                      //                   message.message,
                      //                   style: TextStyle(
                      //                     color: isSentByMe
                      //                         ? Colors.white
                      //                         : Colors.black,
                      //                   ),
                      //                 ),
                      //               ),
                      //             ],
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   );
                      // }).toList(),
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 19),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              FittedBox(
                                child: Container(
                                  constraints: const BoxConstraints(
                                      minWidth: 102, maxWidth: 300),
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFFF2F2F2),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    shadows: const [
                                      BoxShadow(
                                        color: Color(0x19000000),
                                        blurRadius: 0,
                                        offset: Offset(0, 0),
                                        spreadRadius: 0,
                                      )
                                    ],
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      'Hello, Mate!',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Container(
                                width: 50,
                                height: 50,
                                decoration: const ShapeDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "assets/branding/images/avatar.png"),
                                    fit: BoxFit.fill,
                                  ),
                                  shape: OvalBorder(),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 13),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: const ShapeDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "assets/branding/images/avatar.jpg"),
                                    fit: BoxFit.fill,
                                  ),
                                  shape: OvalBorder(),
                                ),
                              ),
                              const SizedBox(width: 10),
                              FittedBox(
                                child: Container(
                                  constraints: const BoxConstraints(
                                      minWidth: 156, maxWidth: 300),
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFF10B981),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      'Hi, How are you?',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 19),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              FittedBox(
                                child: Container(
                                  constraints: const BoxConstraints(
                                      minWidth: 102, maxWidth: 300),
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFFF2F2F2),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    shadows: const [
                                      BoxShadow(
                                        color: Color(0x19000000),
                                        blurRadius: 0,
                                        offset: Offset(0, 0),
                                        spreadRadius: 0,
                                      )
                                    ],
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      'I am fine Thank you',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Container(
                                width: 50,
                                height: 50,
                                decoration: const ShapeDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "assets/branding/images/avatar.png"),
                                    fit: BoxFit.fill,
                                  ),
                                  shape: OvalBorder(),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 5),
              height: 45,
              width: double.infinity,
              child: Row(
                children: [
                  Container(
                      margin: const EdgeInsets.only(left: 10, right: 13),
                      width: 40,
                      height: 40,
                      child: SvgPicture.asset(
                        'assets/branding/home/folder-plus.svg',
                      )),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: 45,
                      decoration: ShapeDecoration(
                        color: const Color(0x7AE4E4E4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Type Here....',
                            hintStyle: TextStyle(
                              color: Color(0xFF9E9E9E),
                              fontSize: 15,
                              fontFamily: 'Poppins',
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
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.only(left: 8, right: 4),
                      width: 40,
                      height: 40,
                      child: SvgPicture.asset(
                        'assets/branding/home/arrow-right-circle.svg',
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
