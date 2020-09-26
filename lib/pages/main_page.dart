import 'package:flutter/material.dart';
import 'package:inspector/style/text_style.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Здесь скоро появится главная страница',
          style: ProjectTextStyles.title,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          maxLines: 5,
        ),
      ),
    );
  }
}
