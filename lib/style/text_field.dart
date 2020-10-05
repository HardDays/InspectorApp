import 'package:flutter/material.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/divider.dart';
import 'package:inspector/style/text_style.dart';

class ProjectTextField extends StatelessWidget { 

  final String hintText;

  ProjectTextField({this.hintText});

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(color: ProjectColors.lightBlue, width: 1)
    );

    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: TextFormField(
        style: ProjectTextStyles.base.apply(color: ProjectColors.black),
        maxLines: 5,
        minLines: 3,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: const EdgeInsets.only(left: 10, top: 15, right: 10),
          hintStyle: ProjectTextStyles.base.apply(color: ProjectColors.darkBlue),
          border: border,
          enabledBorder: border,
          focusedBorder: border
        ),
      ),
    );
  }

}