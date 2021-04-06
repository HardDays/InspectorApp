import 'package:flutter/material.dart';
import 'package:inspector/model/department_control/control_object.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/section.dart';
import 'package:inspector/style/text_style.dart';
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
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 16, right: 16),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(width: 16),
                ControlStatusWidget(
                  controlObject.type.name,
                  controlObject.id.toString(),
                ),
                SizedBox(width: 16),
                Text(
                  controlObject.address,
                  style: ProjectTextStyles.base.apply(color: ProjectColors.black),
                ),
              ],
            ),
          ),
        ),
        if (controlObject.kind != null && controlObject.kind.isNotEmpty)
          _buildDivider(),
        if (controlObject.kind != null && controlObject.kind.isNotEmpty)
          ProjectSection('Вид объекта', description: controlObject.kind),
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
