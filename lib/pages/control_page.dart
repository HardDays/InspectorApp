import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:inspector/pages/address_report_page.dart';
import 'package:inspector/pages/total_report_page.dart';
import 'package:inspector/style/button.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/icons.dart';
import 'package:inspector/style/text_style.dart';
import 'package:inspector/widgets/assignment/assignment.dart';
import 'package:inspector/widgets/assignment/paragraph.dart';
import 'package:inspector/widgets/assignment/status.dart';
import 'package:inspector/widgets/control/status.dart';
import 'package:inspector/widgets/control/task.dart';
import 'package:inspector/widgets/section.dart';
import 'package:intl/intl.dart';

class ControlPage extends StatelessWidget {

  // todo: сделать нормально (enum и тд, как в api)

  ControlPage();

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
              SectionWidget('Объект', child: ControlStatusWidget('КП', '1995126')),
              _buildDivider(),
              SectionWidget('Адрес', description: 'СВАО / Останкинский / Проспект Мира, 81'),
              _buildDivider(),
              SectionWidget('Вид объекта', description: 'Контейнер'),
              _buildDivider(),
              SectionWidget('Балансодержатель', description: 'ГБУ “Жилищник Останкинского района”'),
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
                    ControlTaskWidget(),
                    ControlTaskWidget(),
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
