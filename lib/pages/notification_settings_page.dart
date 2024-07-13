import 'package:flutter/material.dart';

class NotificationSettingsPage extends StatefulWidget {
  @override
  _NotificationSettingsPageState createState() => _NotificationSettingsPageState();
}

class _NotificationSettingsPageState extends State<NotificationSettingsPage> {
  bool recipeNotifications = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Recipe Notifications'),
            trailing: Switch(
              value: recipeNotifications,
              onChanged: (value) {
                setState(() {
                  recipeNotifications = value;
                });
              },
            ),
          ),

        ],
      ),
    );
  }
}
