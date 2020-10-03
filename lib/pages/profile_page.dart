import 'package:custom_switch_button/custom_switch_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inspector/style/button.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/icons.dart';
import 'package:inspector/style/text_style.dart';
import 'package:inspector/style/switch.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: ProjectColors.darkBlue,
        title: Text(
          'Профиль',
          style: ProjectTextStyles.title.apply(
            color: ProjectColors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(29.0, 17.0, 0, 0),
                  child: Text(
                    'К21 Комаров Иван Николаевич',
                    style: ProjectTextStyles.title,
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 20.0, 28.0, 0.0),
                  child: Row(
                    children: [
                      ProjectIcons.exitIcon(),
                      SizedBox(width: 8.46),
                      Text(
                        'Выйти',
                        style: ProjectTextStyles.base
                            .apply(color: ProjectColors.darkBlue),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            _buildSection(
              'О приложении',
              [
                _buildSectionItem(
                  'Версия',
                  Text(
                    '001-0124',
                    style: ProjectTextStyles.base
                        .apply(color: ProjectColors.black),
                  ),
                ),
                _buildSectionItem(
                  'Дата установки',
                  Text(
                    '12.07.2020',
                    style: ProjectTextStyles.base
                        .apply(color: ProjectColors.black),
                  ),
                ),
              ],
            ),
            _buildSection(
              'Передача данных',
              [
                _buildSectionItem(
                  'Дата и время последней передачи данных',
                  Text(
                    '15.07.2020 21:55',
                    style: ProjectTextStyles.base
                        .apply(color: ProjectColors.black),
                  ),
                ),
                _buildSectionItem(
                  'Статус передачи данных',
                  Text(
                    'Ошибка',
                    style: ProjectTextStyles.base
                        .apply(color: ProjectColors.black),
                  ),
                ),
                _buildSectionItem(
                  'Документы, требующие изменений',
                  Container(),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 20.0, 30.0, 0.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(),
                  ),
                  ProjectButton.builtFlatButton('Отправить данные'),
                ],
              ),
            ),
            _buildSection(
              'Настройки',
              [
                _buildSectionItem(
                  'Режим передачи данных',
                  Row(
                    children: [
                      Text(
                        'Ручной',
                        style: ProjectTextStyles.medium
                            .apply(color: ProjectColors.black),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8.1, 0.0, 10.0, 0.0),
                        child: ProjectSwitch(checked: false, onChanged: (value) {}),
                      ),
                      Text(
                        'Автоматический',
                        style: ProjectTextStyles.medium
                            .apply(color: ProjectColors.black),
                      ),
                    ],
                  ),
                ),
                _buildSectionItem(
                  'Быстрый доступ по Touch ID',
                  Row(
                    children: [
                      Text(
                        'Включен',
                        style: ProjectTextStyles.medium
                            .apply(color: ProjectColors.black),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8.1, 0.0, 10.0, 0.0),
                        child: ProjectSwitch(checked: true, onChanged: (value) {},),
                      ),
                      Text(
                        'Выключен',
                        style: ProjectTextStyles.medium
                            .apply(color: ProjectColors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            _buildSection(
              'Техподдержка',
              [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      ProjectIcons.mailIcon(),
                      SizedBox(
                        width: 6.5,
                      ),
                      Text(
                        'Отправить сообщение в техподдержку',
                        style: ProjectTextStyles.baseBold
                            .apply(color: ProjectColors.blue),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionItem(String name, Widget child) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              name,
              style:
                  ProjectTextStyles.baseBold.apply(color: ProjectColors.blue),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: child,
        ),
      ],
    );
  }

  Widget _buildSection(String sectionName, List<Widget> children) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30, 0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(14.0, 30.0, 0, 11),
            child: Container(
              width: double.infinity,
              child: Text(
                sectionName,
                style: ProjectTextStyles.subTitle
                    .apply(color: ProjectColors.black),
              ),
            ),
          ),
          ...children,
        ]
            .map(
              (e) => Container(
                child: e,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: ProjectColors.lightBlue),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
