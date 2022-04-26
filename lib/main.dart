import 'package:flutter/material.dart';
import 'package:wishes_app/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wishes App',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
