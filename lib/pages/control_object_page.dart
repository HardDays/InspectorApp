import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inspector/model/control_object.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/icons.dart';
import 'package:inspector/style/text_style.dart';
import 'package:inspector/widgets/control/status.dart';
import 'package:inspector/widgets/control/violation.dart';
import 'package:inspector/style/section.dart';

class ControlObjectPage extends StatelessWidget {
  ControlObjectPage(this._controlObject);

  final ControlObject _controlObject;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: ProjectColors.darkBlue,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Text(
            'Объект ведомственного контроля',
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
              _buildObjectInfoSection(),
              if(_controlObject.violations.isNotEmpty) 
                _buildViolationsSection(),
            ],
          ),
        ),
      ),
    );
  }

  Column _buildObjectInfoSection() {
    return Column(
      children: [
        ProjectSection('Объект',
            child: ControlStatusWidget(_controlObject.type.name,
                _controlObject.externalId.toString())),
        _buildDivider(),
        ProjectSection('Адрес', description: _controlObject.address),
        _buildDivider(),
        ProjectSection('Вид объекта',
            description: _controlObject.kind),
        _buildDivider(),
        ProjectSection('Балансодержатель',
            description: _controlObject.balanceOwner),
      ],
    );
  }

  Widget _buildIcon(Widget icon, String title) {
    return Row(
      children: [
        icon,
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            title,
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

  Widget _buildFiltersSection() {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _buildIcon(
              ProjectIcons.sortIcon(color: ProjectColors.blue), 'По статусу'),
          Padding(padding: const EdgeInsets.only(left: 15)),
          _buildIcon(
              ProjectIcons.filterIcon(color: ProjectColors.blue), 'Фильтр'),
        ],
      ),
    );
  }

  Widget _buildViolationsSection() {
    return Column(
      children: [
        _buildFiltersSection(),
        _buildViolationsList(),
      ],
    );
  }

  Widget _buildViolationsList() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: ProjectColors.lightBlue),
      ),
      child: Expanded(
        child: ListView(
          children: _controlObject.violations
              .map((violation) => ControlViolationWidget(violation: violation))
              .toList(),
        ),
      ),
    );
  }
}
