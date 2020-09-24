import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inspector/style/button.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/icons.dart';
import 'package:inspector/style/text_style.dart';

class TestPage extends StatelessWidget {
  const TestPage({Key key}) : super(key: key);

  static const _colorsMap = {
    '1. Blue': ProjectColors.blue,
    '2. Dark_blue': ProjectColors.darkBlue,
    '3. Medium_blue': ProjectColors.mediumBlue,
    '4. Light_blue': ProjectColors.lightBlue,
    '5. White': ProjectColors.white,
    '6. Black': ProjectColors.black,
    '7. Grey': ProjectColors.grey,
    '8. Red': ProjectColors.red,
    '9. Green': ProjectColors.green,
    '10. Yellow': ProjectColors.yellow,
    '11. Cyan': ProjectColors.cyan,
  };

  Widget _buildColorItem(Color color, String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          ClipOval(
            child: Container(
              color: color,
              width: 50.0,
              height: 50.0,
            ),
          ),
          SizedBox(width: 10.0),
          Text(
            title,
            style: ProjectTextStyles.title,
          ),
        ],
      ),
    );
  }

  Widget _buildDelimiter() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: 3.0,
        color: ProjectColors.mediumBlue,
      ),
    );
  }

  List<Widget> _buildFonts() {
    return [
      _buildFontInfo(
        ProjectTextStyles.title,
        'Title',
        'Montserrat Semibold',
        '18/24',
      ),
      _buildFontInfo(
        ProjectTextStyles.subTitle,
        'Subtitle',
        'Montserrat Semibold',
        '16/22',
      ),
      _buildFontInfo(
        ProjectTextStyles.base,
        'Base',
        'Montserrat Regular',
        '14/18',
      ),
      _buildFontInfo(
        ProjectTextStyles.baseBold,
        'Base bold',
        'Montserrat Semibold',
        '14/18',
      ),
      _buildFontInfo(
        ProjectTextStyles.medium,
        'Medium',
        'Montserrat Regular',
        '13/18',
      ),
      _buildFontInfo(
        ProjectTextStyles.mediumBold,
        'Medium bold',
        'Montserrat Semibold',
        '12/16',
      ),
      _buildFontInfo(
        ProjectTextStyles.small,
        'Small',
        'Montserrat Regular',
        '12/16',
      ),
      _buildFontInfo(
        ProjectTextStyles.smallBold,
        'Small bold',
        'Montserrat Semibold',
        '12/16',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: ProjectColors.darkBlue,
        title: Text(
          'Тестовая страница',
          style: ProjectTextStyles.title.apply(
            color: ProjectColors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Цвета',
              style: ProjectTextStyles.title,
            ),
            ..._colorsMap.entries.map((e) => _buildColorItem(e.value, e.key)),
            _buildDelimiter(),
            Text(
              'Шрифты',
              style: ProjectTextStyles.title,
            ),
            ..._buildFonts(),
            _buildDelimiter(),
            Text(
              'Иконки',
              style: ProjectTextStyles.title,
            ),
            _buildAppBarWithIcons(),
            GridView.count(
              crossAxisCount: 10,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              children: [
                ProjectIcons.calendarIcon(),
                ProjectIcons.themeIcon(),
                ProjectIcons.mapIcon(),
                ProjectIcons.viewIcon(),
                ProjectIcons.deleteIcon(),
                ProjectIcons.inspectorIcon(),
                ProjectIcons.inspector2Icon(),
                ProjectIcons.pointIcon(),
                ProjectIcons.exitIcon(),
                ProjectIcons.raportIcon(),
                ProjectIcons.addIcon(),
                ProjectIcons.refreshIcon(),
                ProjectIcons.mailIcon(),
                ProjectIcons.copyIcon(),
                ProjectIcons.microphoneIcon(),
                ProjectIcons.editIcon(),
                ProjectIcons.cameraIcon(),
                ProjectIcons.alertIcon(),
                ProjectIcons.mapCloseIcon(),
              ]
                  .map(
                    (e) => Center(
                      child: e,
                    ),
                  )
                  .toList(),
            ),
            BottomNavigationBar(
              selectedItemColor: ProjectColors.blue,
              selectedLabelStyle:
                  ProjectTextStyles.baseBold.apply(color: ProjectColors.blue),
              unselectedItemColor: ProjectColors.mediumBlue,
              unselectedLabelStyle:
                  ProjectTextStyles.base.apply(color: ProjectColors.mediumBlue),
              currentIndex: 0,
              showUnselectedLabels: true,
              items: [
                BottomNavigationBarItem(
                  icon: ProjectIcons.listIcon(),
                  title: Text('Поручения'),
                ),
                BottomNavigationBarItem(
                  icon: ProjectIcons.vkIcon(),
                  title: Text('Ведомственный контроль'),
                ),
                BottomNavigationBarItem(
                  icon: ProjectIcons.map2Icon(),
                  title: Text('Карта'),
                ),
                BottomNavigationBarItem(
                  icon: ProjectIcons.profileIcon(),
                  title: Text('Профиль'),
                ),
              ],
            ),
            _buildDelimiter(),
            Text(
              'Кнопки',
              style: ProjectTextStyles.title,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ProjectButton.buildOutlineButton(
                    'Data',
                    onPressed: () {},
                  ),
                  SizedBox(width: 10.0),
                  ProjectButton.builtFlatButton(
                    'Data',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ProjectButton.buildOutlineButton(
                    'Data',
                  ),
                  SizedBox(width: 10.0),
                  ProjectButton.builtFlatButton(
                    'Data',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBarWithIcons() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: ProjectColors.darkBlue,
      title: Row(
        children: [
          _buildAppBarIcon('Sort'),
          _buildAppBarIcon('Filter'),
          _buildAppBarIcon('Back'),
        ],
      ),
    );
  }

  IconButton _buildAppBarIcon(String name) {
    return IconButton(
      onPressed: () {},
      icon: SvgPicture.asset(
        'icons/Top_menu_icon/$name.svg',
        color: ProjectColors.white,
      ),
    );
  }

  Padding _buildFontInfo(
      TextStyle style, String name, String fontName, String size) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: style.apply(color: ProjectColors.blue),
            ),
            Text(
              fontName,
              style: style.apply(color: ProjectColors.black),
            ),
            Text(
              size,
              style: style.apply(color: ProjectColors.black),
            ),
          ],
        ),
      ),
    );
  }
}
