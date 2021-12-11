import 'package:flutter/material.dart';
import 'package:where2buy/Screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Where2Buy',
      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily:'Georgia'
      ),
      home: const SplashScreen(),
    );
  }
}
