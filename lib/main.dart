import 'package:flutter/material.dart';
import 'package:ngdemo9/pages/fade_page.dart';
import 'package:ngdemo9/pages/home_page.dart';
import 'package:ngdemo9/pages/lottie_page.dart';
import 'package:ngdemo9/pages/slide_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LottiePage(),
    );
  }
}

