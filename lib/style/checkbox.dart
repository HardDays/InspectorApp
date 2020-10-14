import 'package:flutter/material.dart';
import 'package:inspector/style/colors.dart';

class ProjectCheckbox extends StatelessWidget {
  
  final bool value;
  final Function(bool) onChanged;

  ProjectCheckbox({
    this.value,
    this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> onChanged(!this.value),
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: value ? ProjectColors.darkBlue : Colors.white,
          border: Border.all(color: value ? ProjectColors.darkBlue : ProjectColors.mediumBlue, width: 2),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Icon(Icons.check,
          color: Colors.white,
          size: 16,
        ),
      ),
    );
  }
}