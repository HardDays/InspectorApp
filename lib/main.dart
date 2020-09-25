import 'package:flutter/material.dart';
import 'package:inspector/pages/profile_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: 800.0,
          height: 1280.0,
          child: ProfilePage(),
        ),
      ),
    );
  }
}
