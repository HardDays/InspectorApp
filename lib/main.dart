import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:inspector/navigation.gr.dart';
import 'package:inspector/pages/profile_page.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/icons.dart';
import 'package:inspector/style/text_style.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: ExtendedNavigator<InspectorRouter>(
        router: InspectorRouter(),
      ),
      home: Scaffold(
        body: Container(
          width: 800.0,
          height: 1280.0,
          child: ProfilePage(),
        ),
        bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: ProjectColors.blue,
            selectedLabelStyle: ProjectTextStyles.baseBold.apply(color: ProjectColors.blue),
            unselectedItemColor: ProjectColors.mediumBlue,
            unselectedLabelStyle: ProjectTextStyles.base.apply(color: ProjectColors.mediumBlue),
            currentIndex: 3,
            showUnselectedLabels: true,
            items: [
              BottomNavigationBarItem(
                icon: ProjectIcons.listIcon(),
                title: const Text('Поручения\n', 
                  maxLines: 2,
                ),
              ),
              BottomNavigationBarItem(
                icon: ProjectIcons.vkIcon(),
                title: const Text('Ведомственный\nконтроль', 
                  maxLines: 2, 
                  textAlign: TextAlign.center,
                ),
              ),
              BottomNavigationBarItem(
                icon: ProjectIcons.map2Icon(),
                title: const Text('Карта\n', 
                  maxLines: 2,
                ),
              ),
              BottomNavigationBarItem(
                icon: ProjectIcons.profileIcon(),
                title: const Text('Профиль\n', 
                  maxLines: 2,
                ),
              ),
            ],
        ),
      ),
    );
  }
}
