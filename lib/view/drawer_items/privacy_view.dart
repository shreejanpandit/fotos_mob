import 'package:flutter/material.dart';
import 'package:fotos_mobile/res/typo_theme_data.dart';

class PrivacyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Privacy Policy',
              style: CustomTheme.base.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'We are Pixabay GmbH ("Pixabay"). This privacy policy applies to Pixabay\'s website at pixabay.com (the "Website") and all related websites, software, mobile apps, plug-ins and other services that we provide (together, the "Service").',
            ),
            const SizedBox(height: 16.0),
            const Text(
              'This privacy policy explains how we collect, use, disclose and safeguard the information you provide while accessing and using the Service. It also explains how you can exercise your privacy rights. If you have any questions, suggestions or complaints about our use of your personal information or this privacy policy, please contact us using the details provided at the bottom of this page.',
            ),
            const SizedBox(height: 16.0),
            Text(
              'Personal information we collect',
              style: CustomTheme.base.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            Text(
              'Information you provide us directly',
              style: CustomTheme.base.copyWith(
                decoration: TextDecoration.underline,
              ),
            ),
            const SizedBox(height: 10.0),
            const Text(
                'Certain parts of the Service may ask you to provide personal information voluntarily, such as your first and last name, date of birth, gender, the city and country you live in, information about you, your PayPal address, online profiles, uploaded media and email address. This information will be displayed on your public profile page on Pixabay and can be edited and removed at any time.'),
            const SizedBox(height: 10.0),
            const Text(
                'We also collect any messages you send to us and other users. We use this information to operate, maintain, and provide the features and functionality of the Service, to correspond with you, and to address any issues you raise about our services.'),
            const SizedBox(height: 10.0),
            const Text(
                'If you don’t provide your information to us, you may not be able to access or use certain features of the Service or your experience of using the Service may not be as enjoyable.'),
            const SizedBox(height: 10.0),
            Text('Information we receive from third parties',
                style: CustomTheme.base.copyWith(
                  decoration: TextDecoration.underline,
                )),
            const SizedBox(height: 10.0),
            const Text(
                'We may receive information about you from third parties. For example, when you log into the Service using a third-party account (such as Facebook) we may also collect certain information from the third party necessary to authenticate your account, such as your email address and any other information you allow the third party to share with us. You should always review, and if necessary, adjust your privacy settings on third-party websites and services before linking or connecting them to our Service. You may also unlink your third party account from our websites by adjusting your settings on the third party service. If you unlink your third party account, we will no longer receive information collected about you in connection with that service.'),
            const SizedBox(height: 10.0),
            Text('Information we collect through your use of the Service',
                style: CustomTheme.base.copyWith(
                  decoration: TextDecoration.underline,
                )),
            const SizedBox(height: 10.0),
            const Text(
                'Whenever you visit a page, our servers automatically record certain information that your web browser sends. This may include information such as your IP address, browser type and language, browsing and uploading behaviour, other user interactions with your media uploaded, pages viewed, the date and time. This data is used for ensuring the stability of the Service and is deleted automatically after seven days.'),
            const Text(
              'Legal basis for processing personal information',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'We need a legal basis to collect, use and disclose your personal information. Our legal basis for collecting, using and disclosing your data will depend on the information concerned and the context in which it is processed. However, we will normally process your information only where we need it to perform a contract with you, it is in our legitimate interests to do so, or we have your consent to do so. In some cases, we may also have a legal obligation to process your information.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Processing in the context of contacting us:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'If you contact us (e.g. by email), your information is processed to carry out pre-contractual measures, fulfill our contract with you, or because it is in our legitimate interests to do so.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'General processing in the context of our business relationship:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'If your information is processed to deal with business transactions and to process the sale of the Service, your information is processed to carry out pre-contractual measures, fulfill our contract with you, or because it is in our legitimate interests to do so.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Processing for direct marketing purposes:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'If we contact you to inform you about news from our company, offers and events and to promote our own range of services, your information is processed either on the basis of your consent or because it is in our legitimate interests to do.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Processing to manage security and improve our services:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'We process your information to ensure system security, manage the Service technically, optimize service quality, and improve the Service where it is in our legitimate interests to do. We do not rely on this lawful basis where our legitimate interests are overridden by your interests.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Processing to comply with our legal obligations:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'We may process your information because it is necessary to comply with our legal obligations, such as for tax, accounting, and audit purposes.',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              'Sharing your information',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'We respect and are committed to protecting your privacy. We do not sell or otherwise provide personal information to other companies for the marketing of their own products or services.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'However, we may disclose your personal information to our group companies, service providers, and partners who provide data processing services to us (for example, to support the delivery of, provide functionality on, or help to enhance the security of our websites) or who otherwise process data for purposes that are described in this privacy policy or notified to you when we collect your data.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'In the event of a proposed purchase, merger, or acquisition of any part of our business, we may disclose your personal information to an actual or potential buyer (and its agents and advisers) provided that we inform the buyer it must use your personal information only for the purposes disclosed in this privacy policy.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'We reserve the right to disclose your personal information as required by law (e.g., to comply with a subpoena, warrant, or court order) and when we believe that disclosure is necessary to protect our rights, avoid litigation, protect your safety or the safety of others, investigate fraud, and/or respond to a government request. We may also disclose information about you if we determine that such disclosure should be made for reasons of national security, law enforcement, or other issues of public importance.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'If you have consented to the disclosure of your personal information to any other third party, we may also share the data with them.',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              'How we transfer, store, and protect your information',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Your information will be stored and processed in the United States and any other country in which Pixabay, its group companies, service providers, and partners maintain facilities.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'This means that your data may be transferred to and processed in countries other than the country in which you are located. These countries may have data protection laws that are different from the laws of your country (and, in some cases, may not be as protective).',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'However, we\'ve taken appropriate safeguards to require that your data will remain protected in accordance with this privacy policy and applicable data protection laws. These measures include transferring your data to a country that the European Commission or UK authorities (as applicable) have determined provides an adequate level of protection for personal data, or by implementing standard contractual clauses with our group companies, service providers, and partners.',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              'Your Rights',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'You have the right to access the data we process about you, obtain rectification of inaccurate data, request deletion of your data, restrict our processing of your data, request portability of your data, and/or object to unreasonable processing. If we process your data on the basis of your consent, you have the option to withdraw your consent at any time. Doing so will not affect the lawfulness of the processing we carried out based on your consent up to the time of withdrawal.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'You can exercise any of these rights by contacting us using the contact details provided at the bottom of this page under the "How to contact us" heading. We respond to all requests we receive in accordance with applicable data protection laws.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'You also have the right to opt-out of marketing communications we send you at any time. You can exercise this right by clicking on the "unsubscribe" or "opt-out" link in the marketing e-mails we send you or in your user profile page. You can also contact us using the contact details provided at the bottom of this page under the "Contact us" heading.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Finally, you have the right to lodge a complaint with a supervisory authority.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Data Retention',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'We will retain your personal information for as long as your account is active or as needed to provide you with the Service or as necessary to comply with our legal obligations, resolve disputes, and enforce our agreements.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16.0),
            Text(
              'When we have no ongoing legitimate business need to process your information, we will either delete or anonymise it or, if this is not possible (for example, because your information has been stored in backup archives), then we will securely store your information and isolate it from any further processing until deletion is possible.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16.0),
            Text(
              'Persons under 16',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Pixabay is not marketed toward persons under the age of 16. If we discover that personal information was inadvertently collected about individuals under the age of 16, we will promptly delete such information.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16.0),
            Text(
              'Third-party service-based information',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Pixabay is a participant in the Amazon Services LLC Associates Program, an affiliate advertising program designed to provide a means for sites to earn advertising fees by advertising and linking to Amazon.com.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16.0),
            Text(
              'Google Analytics',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'This website uses Google Analytics, a web analytics service provided by Google, Inc. (Google). Google Analytics uses "cookies", which are text files placed on your computer, to help the website analyze how users use the site. The information generated by the cookie about your use of the website (including your IP address) will be transmitted to and stored by Google on servers in the United States. In case of activation of IP anonymization, Google will truncate/anonymize the last octet of the IP address for Member States of the European Union as well as for other parties to the Agreement on the European Economic Area. Only in exceptional cases, the full IP address is sent to and shortened by Google servers in the USA. On behalf of the website provider, Google will use this information for the purpose of evaluating your use of the website, compiling reports on website activity for website operators, and providing other services relating to website activity and internet usage to the website provider. Google will not associate your IP address with any other data held by Google. You may refuse the use of cookies by selecting the appropriate settings on your browser. However, please note that if you do this, you may not be able to use the full functionality of this website. Furthermore, you can prevent Google\'s collection and use of data (cookies and IP address) by downloading and installing the browser plug-in available under https://tools.google.com/dlpage/gaoptout.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16.0),
            Text(
              'Changes to this Policy',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'We may update this privacy policy from time to time to reflect our current practice and ensure compliance with applicable laws. When we post changes to this policy, we will revise the “Last Updated” date at the top of this policy. If we make any material changes to the way we collect, use, store and/or share your personal data, we will take appropriate measures to notify you. We recommend that you check this page from time to time to inform yourself of any changes.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16.0),
            Text(
              'Contact Us',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'The data controller responsible for your personal data is Pixabay GmbH.\n\nIf you have any questions, suggestions, or concerns about our use of your personal data or this privacy policy, please contact us at:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8.0),
            Text(
              'Email: info@pixabay.com\n\nWrite:\nPixabay GmbH\nc/o Lacore Rechtsanwälte LLP\nBerliner Freiheit 2\n10785 Berlin\nGermany',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
