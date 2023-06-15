import 'package:flutter/material.dart';

class TermsAndConditionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms and Conditions'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Terms and Conditions for FOTOS Application',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'These Terms and Conditions ("Agreement") govern your access to and use of FOTOS, a photo library application ("Application"), provided by [Your Company Name] ("Company"). By downloading, installing, or using the Application, you agree to be bound by the terms and conditions outlined in this Agreement. If you do not agree with any part of these terms and conditions, you should not use the Application.',
            ),
            SizedBox(height: 16),
            Text(
              'User Eligibility:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '1.1. You must be at least 18 years old to use the Application.',
            ),
            Text(
              '1.2. If you are using the Application on behalf of an organization, you represent and warrant that you have the authority to bind the organization to this Agreement.',
            ),
            SizedBox(height: 16),
            Text(
              'Application Use:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '2.1. The Application provides access to a collection of images, some of which are available for purchase and others available for free.',
            ),
            Text(
              '2.2. You may use the Application to browse, search, and view images for personal or commercial purposes, subject to the terms and conditions set forth in this Agreement.',
            ),
            SizedBox(height: 16),
            Text(
              'Image Usage:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '3.1. Free Images: Some images in the Application may be available for free. When using free images, you agree to comply with any applicable licensing terms, attributions, or restrictions specified by the image\'s copyright owner.',
            ),
            Text(
              '3.2. Purchased Images: If you choose to purchase images from the Application, you agree to pay the specified fees and comply with any licensing terms associated with the purchased images.',
            ),
            SizedBox(height: 16),
            Text(
              'Intellectual Property:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '4.1. All images, trademarks, logos, and other content available through the Application are the property of their respective owners and protected by applicable intellectual property laws.',
            ),
            Text(
              '4.2. You may not modify, reproduce, distribute, or create derivative works based on the Application or its content without explicit permission from the respective copyright owner.',
            ),
            SizedBox(height: 16),
            Text(
              'Privacy Policy:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '5.1. The Application may collect and use personal information as described in the Company\'s Privacy Policy. By using the Application, you consent to the collection and use of your personal information in accordance with the Privacy Policy.',
            ),
            SizedBox(height: 16),
            Text(
              'Disclaimer of Warranties:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '6.1. The Application and its content are provided on an "as is" and "as available" basis, without any warranties, express or implied.',
            ),
            Text(
              '6.2. The Company does not warrant that the Application will be error-free, uninterrupted, or free from viruses or other harmful components.',
            ),
            SizedBox(height: 16),
            Text(
              'Limitation of Liability:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '7.1. In no event shall the Company be liable for any indirect, incidental, special, consequential, or punitive damages arising out of or in connection with the use of the Application or its content.',
            ),
            Text(
              '7.2. The total liability of the Company, whether in contract, warranty, tort (including negligence), or otherwise, shall not exceed the amount paid by you, if any, for using the Application.',
            ),
            SizedBox(height: 16),
            Text(
              'Governing Law:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '8.1. This Agreement shall be governed by and construed in accordance with the laws of [Your Country/State], without regard to its conflict of laws principles.',
            ),
            SizedBox(height: 16),
            Text(
              'Modifications:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '9.1. The Company reserves the right to modify or update this Agreement at any time, without prior notice. The most current version of the Agreement will be available within the Application.',
            ),
            Text(
              '9.2. Your continued use of the Application after any modifications to this Agreement constitutes your acceptance of the modified terms.',
            ),
            SizedBox(height: 16),
            Text(
              'Termination:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '10.1. The Company reserves the right to terminate or suspend your access to the Application, in whole or in part, at any time and for any reason without prior notice.',
            ),
            SizedBox(height: 16),
            Text(
              'By using the FOTOS Application, you acknowledge that you have read, understood, and agree to be bound by these Terms and Conditions.',
            ),
          ],
        ),
      ),
    );
  }
}
