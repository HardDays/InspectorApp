import 'package:custom_switch_button/custom_switch_button.dart';
import 'package:flutter/material.dart';
import 'package:inspector/style/colors.dart';

class ProjectSwitch extends StatelessWidget {
  final bool checked;
  final ValueChanged<bool> onChanged;

  const ProjectSwitch({Key key, this.checked, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!checked),
      child: CustomSwitchButton(
        checked: checked,
        backgroundColor: checked ? ProjectColors.darkBlue : ProjectColors.mediumBlue,
        animationDuration: Duration(milliseconds: 300),
        checkedColor: ProjectColors.white,
        unCheckedColor: ProjectColors.white,
        indicatorWidth: 17.25,
        buttonWidth: 45.0,
        buttonHeight: 22.5,
      ),
    );
  }
}
