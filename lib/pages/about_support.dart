import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'privacy_page.dart';
import 'term_service.dart';


class AboutAndSupportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About and Support',
          style: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            sectionTitle('About the App'),
            sectionText(
                'This app is designed to help you find and save your favorite recipes and desserts. Explore a wide range of recipes, save your favorites, and share them with your friends and family.'),
            sectionDivider(),
            sectionTitle('Contact Us'),
            sectionText('For support or inquiries, you can reach us at:'),
            contactInfo(Icons.email, 'support@recipeapp.com'),
            contactInfo(Icons.phone, '+1 234 567 890'),
            sectionText('Follow us on social media:'),
            socialMediaRow(),
            sectionDivider(),
            sectionTitle('FAQ'),
            faqItem('How do I save a recipe?',
                'To save a recipe, simply tap the bookmark icon on the recipe page.'),
            faqItem('How do I share a recipe?',
                'To share a recipe, tap the share icon and choose the platform you want to share it on.'),
            sectionDivider(),
            sectionTitle('App Version'),
            sectionText('Version 1.0.0'),
            sectionDivider(),
            sectionTitle('Legal'),
            legalLink(context, 'Terms of Service', TermsOfServicePage()),
            legalLink(context, 'Privacy Policy', PrivacyPage()),
          ],
        ),
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget sectionText(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(
        text,
        style: GoogleFonts.roboto(fontSize: 14),
      ),
    );
  }

  Widget contactInfo(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue),
          SizedBox(width: 8),
          Text(
            text,
            style: GoogleFonts.roboto(fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget socialMediaRow() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          socialMediaIcon(Icons.facebook, 'Facebook'),
          socialMediaIcon(Icons.facebook, 'Twitter'),
        ],
      ),
    );
  }

  Widget socialMediaIcon(IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue),
          SizedBox(width: 4),
          Text(
            label,
            style: GoogleFonts.roboto(fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget faqItem(String question, String answer) {
    return ExpansionTile(
      title: Text(
        question,
        style: GoogleFonts.roboto(fontSize: 14),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            answer,
            style: GoogleFonts.roboto(fontSize: 14),
          ),
        ),
      ],
    );
  }

  Widget legalLink(BuildContext context, String title, Widget page) {
    return ListTile(
      title: Text(title, style: GoogleFonts.roboto(fontSize: 14)),
      trailing: Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }

  Widget sectionDivider() {
    return Divider(
      color: Colors.grey[300],
      thickness: 1,
      height: 32,
    );
  }
}
