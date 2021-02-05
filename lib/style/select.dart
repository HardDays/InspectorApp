import 'package:flutter/material.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/input_title.dart';
import 'package:inspector/style/text_style.dart';

class ProjectSelect<T> extends StatelessWidget { 

  final int count;
  final String title;
  final String hintText;
  final T value;
  final Function(int) itemValue;
  final Function(int) itemTitle;
  final Function onChanged;

  const ProjectSelect(
    this.count,
    this.value, 
    this.itemValue, 
    this.itemTitle, {
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
          items: List.generate(count, 
            (index) => DropdownMenuItem(
              value: itemValue(index),
              child: Text(itemTitle(index)),
            ),
          ),
          onChanged: onChanged
        ),
      ),    
    );
  }
}