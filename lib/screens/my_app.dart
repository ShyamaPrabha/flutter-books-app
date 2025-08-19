
import 'package:flutter/material.dart';

import '../themes/strings.dart';
import '../utils/screen_utils.dart';
import 'novel_listing_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: Screen.navigatorKey,
      title: AppStrings.myBooks,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: NovelListingScreen(),
    );
  }
}
