import 'package:flutter/material.dart';
import 'package:fotos_mobile/res/typo_theme_data.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> teamMembers = [
      {
        'name': 'Asmit Nepali',
        'position': 'Backend / API',
        'image': 'assets/us/asmit.jpg',
        'email': 'asmit@example.com',
        'phone': '+1 1234567890',
        'bio':
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut dapibus enim at augue consectetur tempor.',
      },
      {
        'name': 'Shreejan Pandit',
        'position': 'Mobile Application',
        'image': 'assets/us/shreejan.jpg',
        'email': 'shreejan@example.com',
        'phone': '+1 2345678901',
        'bio':
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut dapibus enim at augue consectetur tempor.',
      },
      {
        'name': 'Sahil Mandal',
        'position': 'Frontend-web',
        'image': 'assets/us/sahil.jpg',
        'email': 'sahil@example.com',
        'phone': '+1 3456789012',
        'bio':
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut dapibus enim at augue consectetur tempor.',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomTheme.primaryColor,
        title: const Text('About Us'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView.builder(
          itemCount: teamMembers.length,
          itemBuilder: (context, index) {
            final teamMember = teamMembers[index];
            return InkWell(
              onTap: () {
                _showMemberModal(context, teamMember);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                      colors: [
                        CustomTheme.primaryColor,
                        CustomTheme.lightBlackTextColor,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.red.withOpacity(0.3),
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.red.withOpacity(0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            teamMember['image'],
                            fit: BoxFit.cover,
                            color: Colors.black.withOpacity(0.5),
                            colorBlendMode: BlendMode.saturation,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              teamMember['name'],
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: CustomTheme.whiteTextColor,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              teamMember['position'],
                              style: const TextStyle(
                                fontSize: 14,
                                color: CustomTheme.whiteTextColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

void _showMemberModal(BuildContext context, Map<String, dynamic> teamMember) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return DraggableScrollableSheet(
        initialChildSize: 0.6,
        minChildSize: 0.6,
        maxChildSize: 0.9,
        builder: (context, scrollController) {
          return Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black54,
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: ListView(
              controller: scrollController,
              padding: const EdgeInsets.all(20.0),
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: const Icon(Icons.close),
                    color: CustomTheme.primaryColor,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                Center(
                  child: Hero(
                    tag: teamMember['image'],
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(120),
                      child: Image.asset(
                        teamMember['image'],
                        width: 240,
                        height: 240,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  teamMember['name'],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  teamMember['position'],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Bio',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  teamMember['bio'],
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Contact Information',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Email: ${teamMember['email']}',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Phone: ${teamMember['phone']}',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Handle button press
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: CustomTheme.primaryColor,
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 24,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    elevation: 2,
                  ),
                  child: const Text(
                    'Contact',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
