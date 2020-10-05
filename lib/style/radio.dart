import 'package:flutter/material.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/text_style.dart';

class ProjectRadio extends StatelessWidget { 
  
  final size = 24.0;

  final dynamic value;
  final dynamic groupValue;
  final String title;
  final Function(dynamic) onChanged;

  ProjectRadio(this.title, {this.value, this.groupValue, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        children: [
          Container(
            height: size,
            width: size,
            margin: const EdgeInsets.only(right: 10),
            child: Radio(
              value: value,
              groupValue: groupValue,
              onChanged: onChanged,
            ),
          ),
          Text(title,
            style: value == groupValue ? ProjectTextStyles.baseBold.apply(color: ProjectColors.black,) : ProjectTextStyles.base.apply(color: ProjectColors.black,),
          ),
        ],
      ),
    );
  }
}