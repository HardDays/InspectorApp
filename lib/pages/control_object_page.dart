import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/icons.dart';
import 'package:inspector/style/text_style.dart';
import 'package:inspector/widgets/control/status.dart';
import 'package:inspector/widgets/control/violation.dart';
import 'package:inspector/style/section.dart';

class ControlObjectPage extends StatelessWidget {

  // todo: сделать нормально (enum и тд, как в api)

  ControlObjectPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: ProjectColors.darkBlue,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Text('Объект ведомственного контроля',
            style: ProjectTextStyles.title.apply(
              color: ProjectColors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
          child: Column(
            children: [
              ProjectSection('Объект', child: ControlStatusWidget('КП', '1995126')),
              _buildDivider(),
              ProjectSection('Адрес', description: 'СВАО / Останкинский / Проспект Мира, 81'),
              _buildDivider(),
              ProjectSection('Вид объекта', description: 'Контейнер'),
              _buildDivider(),
              ProjectSection('Балансодержатель', description: 'ГБУ “Жилищник Останкинского района”'),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _buildIcon(ProjectIcons.sortIcon(color: ProjectColors.blue), 'По статусу'),
                    Padding(padding: const EdgeInsets.only(left: 15)),
                    _buildIcon(ProjectIcons.filterIcon(color: ProjectColors.blue), 'Фильтр'),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: ProjectColors.lightBlue)
                ),
                child: Column(
                  children: [
                    ControlViolationWidget(),
                    ControlViolationWidget(),
                  ],
                )
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIcon(Widget icon, String title) {
    return Row(
      children: [
        icon,
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(title,
            style: ProjectTextStyles.small.apply(color: ProjectColors.black),
          ),
        )
      ],
    );
  }

  Widget _buildDivider() {
    return Divider(
      height: 1,
      color: ProjectColors.lightBlue,
    );
  }
}
