import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Dialogs/language_dialog.dart';
import 'about_support.dart';
import 'profile_setting_page.dart';
import 'notification_settings_page.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDarkMode = false;
  String selectedLanguage = 'English';

  @override
  void initState() {
    super.initState();
    _loadThemePreference();
  }

  // Method to load theme preference from SharedPreferences
  Future<void> _loadThemePreference() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isDarkMode = prefs.getBool('isDarkMode') ?? false;
    });
  }

  // Method to toggle between light and dark modes
  Future<void> _toggleTheme(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isDarkMode = value;
      prefs.setBool('isDarkMode', isDarkMode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Settings',
            style: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.lightBlue),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: ListView(
          padding: EdgeInsets.all(16),
          children: [
            SizedBox(height: 24),
            Text(
              'Application',
              style: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 8),
            ListTile(
              leading: Icon(Icons.notifications, color: Colors.lightBlue),
              title: Text('Notifications', style: GoogleFonts.roboto(fontSize: 14)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationSettingsPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.language, color: Colors.lightBlue),
              title: Text('Language', style: GoogleFonts.roboto(fontSize: 14)),
              subtitle: Text(selectedLanguage,
                  style: GoogleFonts.roboto(fontSize: 12, color: Colors.grey[600])),
              onTap: () async {
                String? language = await showDialog<String>(
                  context: context,
                  builder: (BuildContext context) {
                    return LanguageDialog(selectedLanguage: selectedLanguage);
                  },
                );
                if (language != null) {
                  setState(() {
                    selectedLanguage = language;
                  });
                }
              },
            ),
            SizedBox(height: 24),
            Text(
              'Account',
              style: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 8),
            ListTile(
              leading: Icon(Icons.person, color: Colors.lightBlue),
              title: Text('Profile', style: GoogleFonts.roboto(fontSize: 14)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileSettingsPage()),
                );
              },
            ),
            SizedBox(height: 24),
            Text(
              'Security',
              style: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 8),
            ListTile(
              leading: Icon(Icons.info, color: Colors.lightBlue),
              title: Text('About and Support', style: GoogleFonts.roboto(fontSize: 14)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutAndSupportPage()),
                );
              },
            ),
            SizedBox(height: 24),
            ListTile(
              leading: Icon(Icons.brightness_6, color: Colors.lightBlue),
              title: Text('Dark Mode', style: GoogleFonts.roboto(fontSize: 14)),
              subtitle: Text(isDarkMode ? 'On' : 'Off', style: GoogleFonts.roboto(fontSize: 12)),
              trailing: Switch(
                value: isDarkMode,
                onChanged: (value) {
                  _toggleTheme(value); // Toggle theme mode
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
