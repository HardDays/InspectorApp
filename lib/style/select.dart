import 'package:flutter/material.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/divider.dart';
import 'package:inspector/style/input_title.dart';
import 'package:inspector/style/text_style.dart';

class ProjectSelect extends StatelessWidget { 

  final String title;
  final String hintText;
  final String value;
  final List<String> values;
  final List<String> titles;
  final Function onChanged;

  const ProjectSelect(
    this.value, 
    this.values, 
    this.titles, {
      this.title, 
      this.hintText,
      this.onChanged
    }
  );

  @override
  Widget build(BuildContext context) {
    return ProjectInputTitle(
      title,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: ProjectColors.lightBlue)
        ),
        padding: const EdgeInsets.only(top: 10.5, bottom: 11.5, left: 10, right: 10),
        child: DropdownButton(
          isExpanded: true,
          isDense: true,
          underline: Container(),
          style: ProjectTextStyles.base.apply(color: ProjectColors.black),
          hint: Text(hintText,
            style: ProjectTextStyles.base.apply(color: ProjectColors.darkBlue),
          ),
          icon: const Icon(Icons.keyboard_arrow_down, color: ProjectColors.darkBlue),
          value: value,
          items: List.generate(values.length, 
            (index) => DropdownMenuItem(
              value: values[index],
              child: Text(titles[index]),
            ),
          ),
          onChanged: onChanged
        ),
      ),    
    );
  }
}