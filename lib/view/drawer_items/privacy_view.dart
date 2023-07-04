import 'package:flutter/material.dart';

import '../../res/typo_theme_data.dart';

class PrivacyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomTheme.primaryColor,
        title: Text('Privacy Policy'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Privacy Policy',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'We are committed to protecting your privacy. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use our mobile application or website (the "Services"). Please read this Privacy Policy carefully. If you do not agree with the terms of this Privacy Policy, please do not access the application or website.',
            ),
            SizedBox(height: 16.0),
            Text(
              'Information We Collect',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'We collect information from you when you register on our application or website, subscribe to our newsletter, respond to a survey, fill out a form, or enter information on our site. The information we collect may include your name, email address, mailing address, phone number, or other details.',
            ),
            SizedBox(height: 16.0),
            Text(
              'How We Use Your Information',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'We may use the information we collect from you when you register, make a purchase, sign up for our newsletter, respond to a survey or marketing communication, surf the website, or use certain other site features in the following ways:\n\n- To personalize your experience and to allow us to deliver the type of content and product offerings in which you are most interested.\n- To improve our application or website in order to better serve you.\n- To administer a contest, promotion, survey, or other site feature.\n- To send periodic emails regarding your order or other products and services.',
            ),
            SizedBox(height: 16.0),
            Text(
              'How We Protect Your Information',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'We implement a variety of security measures to maintain the safety of your personal information when you enter, submit, or access your information.',
            ),
            SizedBox(height: 16.0),
            Text(
              'Changes to This Privacy Policy',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'We may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes. We will notify you of any changes by posting the new Privacy Policy on this page. These changes are effective immediately after they are posted on this page.',
            ),
            SizedBox(height: 16.0),
            Text(
              'Contact Us',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'If you have any questions or suggestions about our Privacy Policy, do not hesitate to contact us.',
            ),
            SizedBox(height: 8.0),
            Text(
              'Email: fotos.support@gmail.com',
            ),
            Text(
              'Phone: +977-9860993510  or  +977-9814125214',
            ),
          ],
        ),
      ),
    );
  }
}
