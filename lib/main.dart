import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squid_games_app/pages/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'S q u i d  G a m e s',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black87,
        primarySwatch: Colors.pink,
      ),
      themeMode: ThemeMode.dark,
      home: SplashScreen(),
    );
  }
}
