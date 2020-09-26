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
      selectedLabelStyle:
          ProjectTextStyles.baseBold.apply(color: ProjectColors.blue),
      unselectedItemColor: ProjectColors.mediumBlue,
      unselectedLabelStyle:
          ProjectTextStyles.base.apply(color: ProjectColors.mediumBlue),
      currentIndex: currentIndex,
      showUnselectedLabels: true,
      items: [
        BottomNavigationBarItem(
          icon: ProjectIcons.listIcon(),
          title: const Text(
            'Поручения',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        BottomNavigationBarItem(
          icon: ProjectIcons.vkIcon(),
          title: const Text(
            'Ведомственный контроль',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ),
        BottomNavigationBarItem(
          icon: ProjectIcons.map2Icon(),
          title: const Text(
            'Карта',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ),
        BottomNavigationBarItem(
          icon: ProjectIcons.profileIcon(),
          title: const Text(
            'Профиль',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ),
      ],
    );
  }
}
