import 'package:flutter/material.dart';

import 'package:task_manager/src/Screens/splashscreen.dart';

import 'src/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MaterialTheme(TextTheme()).light(),
      darkTheme: MaterialTheme(TextTheme()).dark(),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
