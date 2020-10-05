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

  Color _getColor(int index) =>
      index == currentIndex ? ProjectColors.blue : ProjectColors.mediumBlue;

  TextStyle _getTextStyle(int index) => index == currentIndex
      ? ProjectTextStyles.baseBold.apply(color: ProjectColors.blue)
      : ProjectTextStyles.base.apply(color: ProjectColors.mediumBlue);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (x) => onTap(screenslist[x]),
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: true,
      backgroundColor: Colors.white,
      items: [
        BottomNavigationBarItem(
          icon: ProjectIcons.listIcon(
            color: _getColor(0),
            padding: const EdgeInsets.only(bottom: 10, top: 15),
          ),
          title: Text(
            'Поручения\n',
            maxLines: 2,
            style: _getTextStyle(0),
          ),
        ),
        BottomNavigationBarItem(
          icon: ProjectIcons.vkIcon(
            color: _getColor(1),
            padding: const EdgeInsets.only(bottom: 10, top: 15),
          ),
          title: Text(
            'Ведомственный\nконтроль',
            maxLines: 2,
            textAlign: TextAlign.center,
            style: _getTextStyle(1),
          ),
        ),
        BottomNavigationBarItem(
          icon: ProjectIcons.map2Icon(
            color: _getColor(2),
            padding: const EdgeInsets.only(bottom: 10, top: 15),
          ),
          title: Text(
            'Карта\n',
            maxLines: 2,
            style: _getTextStyle(2),
          ),
        ),
        BottomNavigationBarItem(
          icon: ProjectIcons.profileIcon(
            color: _getColor(3),
            padding: const EdgeInsets.only(bottom: 10, top: 15),
          ),
          title: Text(
            'Профиль\n',
            maxLines: 2,
            style: _getTextStyle(3),
          ),
        ),
      ],
    );
  }
}
