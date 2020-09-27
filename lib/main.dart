import 'package:flutter/material.dart';
import 'package:inspector/pages/assignments_page.dart';
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
      home: Scaffold(
        body: Container(
          width: 800.0,
          height: 1280.0,
          child: AssignmentsPage(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: ProjectColors.blue,
          selectedLabelStyle: ProjectTextStyles.baseBold.apply(color: ProjectColors.blue),
          unselectedItemColor: ProjectColors.mediumBlue,
          unselectedLabelStyle: ProjectTextStyles.base.apply(color: ProjectColors.mediumBlue),
          currentIndex: 0,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          backgroundColor: Colors.white,
          items: [
            BottomNavigationBarItem(
              icon: ProjectIcons.listIcon(
                padding: const EdgeInsets.only(bottom: 10, top: 15)
              ),
              title: const Text('Поручения\n', 
                maxLines: 2,
              ),
            ),
            BottomNavigationBarItem(
              icon: ProjectIcons.vkIcon(
                padding: const EdgeInsets.only(bottom: 10, top: 15)
              ),
              title: const Text('Ведомственный\nконтроль', 
                maxLines: 2, 
                textAlign: TextAlign.center,
              ),
            ),
            BottomNavigationBarItem(
              icon: ProjectIcons.map2Icon(
                padding: const EdgeInsets.only(bottom: 10, top: 15)
              ),
              title: const Text('Карта\n', 
                maxLines: 2,
              ),
            ),
            BottomNavigationBarItem(
              icon: ProjectIcons.profileIcon(
                padding: const EdgeInsets.only(bottom: 10, top: 15)
              ),
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
