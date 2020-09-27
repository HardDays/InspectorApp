import 'package:flutter/material.dart';
import 'package:inspector/blocs/navigation_bloc/screens.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/icons.dart';
import 'package:inspector/style/text_style.dart';

class ProjectBottomNavigationBar extends StatelessWidget {
  const ProjectBottomNavigationBar({
    Key key,
    this.onTap,
    this.screen,
  }) : super(key: key);

  final ValueChanged<Screens> onTap;
  final Screens screen;
  static const screenslist = [
    Screens.AssignmentsScreen,
    Screens.VKScreen,
    Screens.MapScreen,
    Screens.ProfileScreen,
  ];
  int get currentIndex => screenslist.indexOf(screen);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (x) => onTap(screenslist[x]),
      selectedItemColor: ProjectColors.blue,
      selectedLabelStyle: ProjectTextStyles.baseBold.apply(color: ProjectColors.blue),
      unselectedItemColor: ProjectColors.mediumBlue,
      unselectedLabelStyle: ProjectTextStyles.base.apply(color: ProjectColors.mediumBlue),
      currentIndex: currentIndex,
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
    );
  }
}
