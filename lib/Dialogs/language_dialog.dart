import 'package:flutter/material.dart';

class LanguageDialog extends StatelessWidget {
  final String selectedLanguage;

  LanguageDialog({required this.selectedLanguage});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text('Select Language'),
      children: [
        SimpleDialogOption(
          onPressed: () {
            Navigator.pop(context, 'English');
          },
          child: Text('English'),
        ),
        SimpleDialogOption(
          onPressed: () {
            Navigator.pop(context, 'Spanish');
          },
          child: Text('Spanish'),
        ),
        SimpleDialogOption(
          onPressed: () {
            Navigator.pop(context, 'Spanish');
          },
          child: Text('Korean'),
        ),
      ],
    );
  }
}
