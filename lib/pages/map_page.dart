import 'package:flutter/material.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/text_style.dart';

class MapPage extends StatelessWidget {
  const MapPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: ProjectColors.darkBlue,
        title: Text(
          'Карта',
          style: ProjectTextStyles.title.apply(
            color: ProjectColors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: Center(
        child: Text(
          'Здесь скоро появится страница с картой',
          style: ProjectTextStyles.title,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          maxLines: 5,
        ),
      ),
    );
  }
}
