import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class TermsOfServicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms of Service'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              'Terms of Service',
              style: GoogleFonts.roboto(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Introduction',
              style: GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Welcome to our app. These terms and conditions outline the rules and regulations for the use of our application.',
              style: GoogleFonts.roboto(fontSize: 14),
            ),
            SizedBox(height: 16),
            Text(
              'Intellectual Property Rights',
              style: GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Other than the content you own, under these Terms, the app and/or its licensors own all the intellectual property rights and materials contained in this app. You are granted a limited license only for purposes of viewing the material contained on this app.',
              style: GoogleFonts.roboto(fontSize: 14),
            ),
            SizedBox(height: 16),
            Text(
              'Restrictions',
              style: GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'You are specifically restricted from all of the following:',
              style: GoogleFonts.roboto(fontSize: 14),
            ),
            SizedBox(height: 8),
            Text(
              '1. Publishing any app material in any other media;',
              style: GoogleFonts.roboto(fontSize: 14),
            ),
            Text(
              '2. Selling, sublicensing, and/or otherwise commercializing any app material;',
              style: GoogleFonts.roboto(fontSize: 14),
            ),
            Text(
              '3. Publicly performing and/or showing any app material;',
              style: GoogleFonts.roboto(fontSize: 14),
            ),
            Text(
              '4. Using this app in any way that is or may be damaging to this app;',
              style: GoogleFonts.roboto(fontSize: 14),
            ),
            Text(
              '5. Using this app in any way that impacts user access to this app;',
              style: GoogleFonts.roboto(fontSize: 14),
            ),
            Text(
              '6. Using this app contrary to applicable laws and regulations, or in any way may cause harm to the app, or to any person or business entity;',
              style: GoogleFonts.roboto(fontSize: 14),
            ),
            Text(
              '7. Engaging in any data mining, data harvesting, data extracting, or any other similar activity in relation to this app;',
              style: GoogleFonts.roboto(fontSize: 14),
            ),
            Text(
              '8. Using this app to engage in any advertising or marketing.',
              style: GoogleFonts.roboto(fontSize: 14),
            ),
            SizedBox(height: 16),
            Text(
              'Limitation of Liability',
              style: GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'In no event shall the app, nor any of its officers, directors, and employees, be held liable for anything arising out of or in any way connected with your use of this app whether such liability is under contract.  The app, including its officers, directors, and employees shall not be held liable for any indirect, consequential, or special liability arising out of or in any way related to your use of this app.',
              style: GoogleFonts.roboto(fontSize: 14),
            ),
            SizedBox(height: 16),
            Text(
              'Indemnification',
              style: GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'You hereby indemnify to the fullest extent the app from and against any and/or all liabilities, costs, demands, causes of action, damages, and expenses arising in any way related to your breach of any of the provisions of these Terms.',
              style: GoogleFonts.roboto(fontSize: 14),
            ),
            SizedBox(height: 16),
            Text(
              'Severability',
              style: GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'If any provision of these Terms is found to be invalid under any applicable law, such provisions shall be deleted without affecting the remaining provisions herein.',
              style: GoogleFonts.roboto(fontSize: 14),
            ),
            SizedBox(height: 16),
            Text(
              'Variation of Terms',
              style: GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'The app is permitted to revise these Terms at any time as it sees fit, and by using this app you are expected to review these Terms on a regular basis.',
              style: GoogleFonts.roboto(fontSize: 14),
            ),
            SizedBox(height: 16),
            Text(
              'Assignment',
              style: GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'The app is allowed to assign, transfer, and subcontract its rights and/or obligations under these Terms without any notification. However, you are not allowed to assign, transfer, or subcontract any of your rights and/or obligations under these Terms.',
              style: GoogleFonts.roboto(fontSize: 14),
            ),
            SizedBox(height: 16),
            Text(
              'Entire Agreement',
              style: GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'These Terms constitute the entire agreement between the app and you in relation to your use of this app and supersede all prior agreements and understandings.',
              style: GoogleFonts.roboto(fontSize: 14),
            ),
            SizedBox(height: 16),
            Text(
              'Governing Law & Jurisdiction',
              style: GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'These Terms will be governed by and interpreted in accordance with the laws of the State, and you submit to the non-exclusive jurisdiction of the state and federal courts located in the State for the resolution of any disputes.',
              style: GoogleFonts.roboto(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
