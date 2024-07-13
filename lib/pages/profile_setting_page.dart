import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bookmark_page.dart';
import 'splash_screen_page.dart';

class ProfileSettingsPage extends StatefulWidget {
  @override
  _ProfileSettingsPageState createState() => _ProfileSettingsPageState();
}

class _ProfileSettingsPageState extends State<ProfileSettingsPage> {
  bool isDarkMode = false;

  @override
  void initState() {
    super.initState();
    _loadThemePreference();
  }

  Future<void> _loadThemePreference() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isDarkMode = prefs.getBool('isDarkMode') ?? false;
    });
  }
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
            'Profile',
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

        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [

              SizedBox(height: 24),
              Text('Personal Information',
                  style: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w600)),
              SizedBox(height: 8),
              ListTile(
                leading: Icon(Icons.person, color: Colors.lightBlue),
                title: Text('Name', style: GoogleFonts.roboto(fontSize: 14)),
                subtitle: Text('Daisy Micheal', style: GoogleFonts.roboto(fontSize: 14)),
                trailing: Icon(Icons.edit, color: Colors.grey),
                onTap: () {
                  // Implement name edit functionality
                },
              ),
              ListTile(
                leading: Icon(Icons.email, color: Colors.lightBlue),
                title: Text('Email', style: GoogleFonts.roboto(fontSize: 14)),
                subtitle: Text('john.doe@example.com', style: GoogleFonts.roboto(fontSize: 14)),
                trailing: Icon(Icons.edit, color: Colors.lightBlue),
                onTap: () {
                  // Implement email edit functionality
                },
              ),
              ListTile(
                leading: Icon(Icons.phone, color: Colors.lightBlue),
                title: Text('Phone', style: GoogleFonts.roboto(fontSize: 14)),
                subtitle: Text('+1 234 567 890', style: GoogleFonts.roboto(fontSize: 14)),
                trailing: Icon(Icons.edit, color: Colors.grey),
                onTap: () {

                },
              ),
              SizedBox(height: 24),
              Text('Account Settings',
                  style: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w600)),
              SizedBox(height: 8),
              ListTile(
                leading: Icon(Icons.lock, color: Colors.lightBlue),
                title: Text('Change Password', style: GoogleFonts.roboto(fontSize: 14)),
                onTap: () {

                },
              ),
              ListTile(
                leading: Icon(Icons.link, color: Colors.lightBlue),
                title: Text('Linked Accounts', style: GoogleFonts.roboto(fontSize: 14)),
                onTap: () {

                },
              ),
              SizedBox(height: 24),
              Text('Preferences',
                  style: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w600)),
              SizedBox(height: 8),
              ListTile(
                leading: Icon(Icons.language, color: Colors.lightBlue),
                title: Text('Language', style: GoogleFonts.roboto(fontSize: 14)),
                subtitle: Text('English', style: GoogleFonts.roboto(fontSize: 14)),
                trailing: Icon(Icons.edit, color: Colors.grey),
                onTap: () {
                  // Implement language change functionality
                },
              ),
              ListTile(
                leading: Icon(Icons.brightness_6, color: Colors.lightBlue),
                title: Text('Theme', style: GoogleFonts.roboto(fontSize: 14)),
                subtitle: Text(isDarkMode ? 'Dark Mode' : 'Light Mode', style: GoogleFonts.roboto(fontSize: 14)),
                trailing: Switch(
                  value: isDarkMode,
                  onChanged: (value) {
                    _toggleTheme(value);
                  },
                ),
              ),
              ListTile(
                leading: Icon(Icons.notifications, color: Colors.lightBlue),
                title: Text('Notification Settings', style: GoogleFonts.roboto(fontSize: 14)),
                onTap: () {

                },
              ),
              SizedBox(height: 24),
              Text('Activity Summary',
                  style: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w600)),
              SizedBox(height: 8),
              ListTile(
                leading: Icon(Icons.bookmark, color: Colors.lightBlue),
                title: Text('Saved Recipes', style: GoogleFonts.roboto(fontSize: 14)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BookmarkPage()),
                  );

                },
              ),
              ListTile(
                leading: Icon(Icons.history, color: Colors.lightBlue),
                title: Text('Recent Activity', style: GoogleFonts.roboto(fontSize: 14)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BookmarkPage()),
                  );
                },
              ),
              SizedBox(height: 24),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SplashScreen ()),
                    );


                  },
                  child: Text('Logout', style: GoogleFonts.roboto(fontSize: 14)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
