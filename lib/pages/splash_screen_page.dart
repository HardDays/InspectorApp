import 'package:flutter/material.dart';
import 'package:inspector/style/colors.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColors.white,
      body: Center(
        child: Image.asset(
          'images/logo.png',
          width: 200.0,
          height: 200.0,
        ),
      ),
    );
  }
}
