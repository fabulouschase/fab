import 'package:flutter/material.dart';

import 'home/MyHomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light, // Set to light for brighter UI
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white, // Bright background
      ),
      debugShowCheckedModeBanner: false,
      title: 'blond cars',
      home: const MainPage(),
    );
  }
}
