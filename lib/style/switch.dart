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
        backgroundColor: ProjectColors.darkBlue,
        animationDuration: Duration(milliseconds: 400),
        checkedColor: ProjectColors.white,
        unCheckedColor: ProjectColors.white,
        indicatorWidth: 17.25,
        buttonWidth: 45.0,
        buttonHeight: 22.5,
      ),
    );
  }
}
