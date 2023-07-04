import 'package:flutter/material.dart';
import 'package:fotos_mobile/res/components/message_component/new_message_component.dart';
import 'package:fotos_mobile/utils/routes/routes_name.dart';
import 'package:fotos_mobile/view/profile/message/user_mesage.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
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
              'My Messages',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Padding(
              padding: EdgeInsets.only(top: 28, bottom: 16, left: 29),
              child: Text(
                'Messages',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 19,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
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
                    NewMessage(
                      onTap: () {
                        Navigator.pushNamed(context, RoutesName.user_msg);
                      },
                      image: 'assets/branding/images/avatar.png',
                      username: 'John Doe',
                      message: 'Hi, How are you?',
                      messageNumber: 1,
                      online: true,
                      time: '5 min ago',
                    ),
                    NewMessage(
                      image: 'assets/branding/images/avatar.jpg',
                      username: 'Ram Adhikari',
                      message: 'Done Mate!',
                      messageNumber: 0,
                      online: false,
                      time: '5 hrs ago',
                    ),
                    NewMessage(
                      image: 'assets/branding/images/avatar.jpg',
                      username: 'Zakhir Khan',
                      message: 'Wah!',
                      messageNumber: 0,
                      online: false,
                      time: '24 hrs ago',
                    ),
                    NewMessage(
                      image: 'assets/branding/images/avatar.jpg',
                      username: 'Susan Magar',
                      message: 'See you there.',
                      messageNumber: 0,
                      online: true,
                      time: '1 days ago',
                    ),
                    NewMessage(
                      image: 'assets/branding/images/avatar.jpg',
                      username: 'Jasmine',
                      message: 'Nice Arts.',
                      messageNumber: 0,
                      online: true,
                      time: '2 days ago',
                    ),
                    NewMessage(
                      image: 'assets/branding/images/avatar.jpg',
                      username: 'Jaya Adhikari',
                      message: 'Done!',
                      messageNumber: 0,
                      online: false,
                      time: '3 days ago',
                    ),
                    NewMessage(
                      image: 'assets/branding/images/avatar.jpg',
                      username: 'Shyam D.',
                      message: 'Wah!',
                      messageNumber: 0,
                      online: true,
                      time: '4 days ago',
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
