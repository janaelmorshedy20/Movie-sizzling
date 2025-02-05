import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/HomeScreen.dart';
import 'package:flutter_application_1/LoginScreen.dart';
import 'package:flutter_application_1/ScenesPage.dart';
import 'package:flutter_application_1/UploadScreen.dart';

void main() {
  runApp(MovieSizzlingApp());
}

class MovieSizzlingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie Sizzling',
      theme: ThemeData.dark(),
      home: HomeScreen(),
    );
  }
}