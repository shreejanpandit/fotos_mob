import 'package:flutter/material.dart';
import 'package:fotos_mobile/res/typo_theme_data.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> _teamMembers = [
      {
        'name': 'Asmit Nepali',
        'position': 'Backend / API',
        'image': 'assets/us/asmit.jpg',
      },
      {
        'name': 'Shreejan Pandit',
        'position': 'Mobile Application',
        'image': 'assets/us/shreejan.jpg',
      },
      {
        'name': 'Sahil Mandal',
        'position': 'Frontend-web',
        'image': 'assets/us/sahil.jpg',
      },
    ];
    return Scaffold(
        appBar: AppBar(
          title: const Text('About Us'),
        ),
        // body: ListView.builder(
        //   shrinkWrap: true,
        //   itemCount: _teamMembers.length,
        //   itemBuilder: (context, index) {
        //     return ListTile(
        //       leading: SizedBox(
        //           height: 100,
        //           width: 100,
        //           child: Image.asset(_teamMembers[index]['image'],
        //               fit: BoxFit.contain)),
        //       // CircleAvatar(
        //       //   radius: 50,
        //       //   backgroundImage: AssetImage(_teamMembers[index]['image']),
        //       // ),
        //       title: Text(_teamMembers[index]['name']),
        //       subtitle: Text(_teamMembers[index]['position']),
        //     );
        //   },
        // ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: CustomTheme
                            .primaryColor, // Set the outer border color to red
                        width: 3, // Adjust the width of the border
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        _teamMembers[0]['image'],
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Asmit Nepali',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Laravel Backend / API',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: CustomTheme
                            .primaryColor, // Set the outer border color to red
                        width: 3, // Adjust the width of the border
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        _teamMembers[1]['image'],
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Shreejan Pandit',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Flutter Mobile Application',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: CustomTheme
                            .primaryColor, // Set the outer border color to red
                        width: 3, // Adjust the width of the border
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        _teamMembers[2]['image'],
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sahil Mandal',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Frontend web',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
