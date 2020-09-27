import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:inspector/navigation.gr.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/text_style.dart';

class VKPage extends StatelessWidget {
  const VKPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: ProjectColors.darkBlue,
        title: Text(
          'Ведомственный контроль',
          style: ProjectTextStyles.title.apply(
            color: ProjectColors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Здесь скоро появится страница ведомственного контроля',
              style: ProjectTextStyles.title,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              maxLines: 5,
            ),
            RaisedButton(
              onPressed: () => ExtendedNavigator.named('vknavigator')
                  .push(VKSreenRoutes.testPage),
              child: Text(
                'Перейти на следующую страницу',
                style:
                    ProjectTextStyles.title.apply(color: ProjectColors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class VKSreen extends StatelessWidget {
  const VKSreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExtendedNavigator(name: 'vknavigator',);
  }
}