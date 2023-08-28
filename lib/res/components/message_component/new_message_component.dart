// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class NewMessage extends StatelessWidget {
  final String image;
  final String username;
  final String message;
  final String time;
  final int messageNumber;
  final bool? online;
  final VoidCallback? onTap;

  const NewMessage({
    Key? key,
    required this.image,
    required this.username,
    required this.message,
    required this.time,
    required this.messageNumber,
    this.online = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Container(
          margin: const EdgeInsets.only(left: 26, right: 30, bottom: 25),
          height: 60,
          width: double.infinity,
          child: Row(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(image),
                    ),
                  ),
                  if (online == true)
                    Positioned(
                      right: 10,
                      bottom: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        height: 9,
                        width: 9,
                      ),
                    ),
                ],
              ),
              const SizedBox(
                width: 22,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          username,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          message,
                          style: const TextStyle(
                            color: Color(0xFF239DE9),
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        if (messageNumber > 0)
                          Container(
                            width: 20,
                            height: 20,
                            decoration: ShapeDecoration(
                              color: const Color(0xFF239DE9),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                messageNumber.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                        Text(
                          time,
                          style: const TextStyle(
                            color: Color(0xFF8E8E8E),
                            fontSize: 11,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
