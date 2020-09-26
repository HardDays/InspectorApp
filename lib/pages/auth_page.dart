import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:inspector/navigation.gr.dart';
import 'package:inspector/style/text_style.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Text(
                'Здесь скоро появится страница авторизации/аутентификации',
                style: ProjectTextStyles.title,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                maxLines: 5,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            RaisedButton(
              child: Text('Перейти дальше', style: ProjectTextStyles.title),
              onPressed: () {
                ExtendedNavigator.root.push(Routes.mainPage);
              },
            ),
          ],
        ),
      ),
    );
  }
}
