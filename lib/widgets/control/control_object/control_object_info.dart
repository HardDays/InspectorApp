import 'package:flutter/material.dart';
import 'package:inspector/model/department_control/control_object.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/section.dart';
import 'package:inspector/widgets/control/control_object/status.dart';

class ControlObjectInfo extends StatelessWidget {
  const ControlObjectInfo({
    Key key,
    this.controlObject,
  }) : super(key: key);

  final ControlObject controlObject;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ProjectSection('Объект',
            child: ControlStatusWidget(controlObject.type.name,
                controlObject.externalId.toString())),
        _buildDivider(),
        ProjectSection('Адрес', description: controlObject.address),
        _buildDivider(),
        ProjectSection('Вид объекта',
            description: controlObject.kind),
        _buildDivider(),
        ProjectSection('Балансодержатель',
            description: controlObject.balanceOwner),
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
