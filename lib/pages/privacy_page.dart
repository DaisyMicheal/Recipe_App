import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class PrivacyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Policy'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              'Privacy Policy',
              style: GoogleFonts.roboto(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Introduction',
              style: GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Our app is committed to protecting your privacy. This Privacy Policy explains how we collect, use, and safeguard your information when you use our application.',
              style: GoogleFonts.roboto(fontSize: 14),
            ),
            SizedBox(height: 16),
            Text(
              'Information We Collect',
              style: GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'We may collect information about you in a variety of ways. The information we may collect via the app includes:',
              style: GoogleFonts.roboto(fontSize: 14),
            ),
            SizedBox(height: 8),
            Text(
              '1. Personal Data: Personally identifiable information such as your name, shipping address, email address, and telephone number that you voluntarily give to us when choosing to participate in various activities related to the app.',
              style: GoogleFonts.roboto(fontSize: 14),
            ),
            SizedBox(height: 8),
            Text(
              '2. Derivative Data: Information our servers automatically collect when you access the app, such as your IP address, your browser type, your operating system, your access times, and the pages you have viewed directly before and after accessing the app.',
              style: GoogleFonts.roboto(fontSize: 14),
            ),
            SizedBox(height: 16),
            Text(
              'How We Use Your Information',
              style: GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Having accurate information about you permits us to provide you with a smooth, efficient, and customized experience. Specifically, we may use information collected about you via the app to:',
              style: GoogleFonts.roboto(fontSize: 14),
            ),
            SizedBox(height: 8),
            Text(
              '1. Create and manage your account.',
              style: GoogleFonts.roboto(fontSize: 14),
            ),
            Text(
              '2. Process your transactions.',
              style: GoogleFonts.roboto(fontSize: 14),
            ),
            Text(
              '3. Personalize your app experience.',
              style: GoogleFonts.roboto(fontSize: 14),
            ),
            Text(
              '4. Send you a newsletter.',
              style: GoogleFonts.roboto(fontSize: 14),
            ),
            Text(
              '5. Respond to product and customer service requests.',
              style: GoogleFonts.roboto(fontSize: 14),
            ),
            Text(
              '6. Improve the app.',
              style: GoogleFonts.roboto(fontSize: 14),
            ),
            SizedBox(height: 16),
            Text(
              'Sharing Your Information',
              style: GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'We may share information we have collected about you in certain situations. Your information may be disclosed as follows:',
              style: GoogleFonts.roboto(fontSize: 14),
            ),
            SizedBox(height: 8),
            Text(
              '1. By Law or to Protect Rights: If we believe the release of information about you is necessary to respond to legal process, to investigate or remedy potential violations of our policies, or to protect the rights, property, and safety of others, we may share your information as permitted or required by any applicable law, rule, or regulation.',
              style: GoogleFonts.roboto(fontSize: 14),
            ),
            Text(
              '2. Business Transfers: We may share or transfer your information in connection with, or during negotiations of, any merger, sale of company assets, financing, or acquisition of all or a portion of our business to another company.',
              style: GoogleFonts.roboto(fontSize: 14),
            ),
            SizedBox(height: 16),
            Text(
              'Contact Us',
              style: GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'If you have questions or comments about this Privacy Policy, please contact us at: support@recipeapp.com.',
              style: GoogleFonts.roboto(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
