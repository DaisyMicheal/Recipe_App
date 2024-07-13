import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Theme/theme.dart';
import 'pages/splash_screen_page.dart';
import 'providers/bookmark_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BookmarkProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App',
      theme: AppTheme.lightThemeData,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
