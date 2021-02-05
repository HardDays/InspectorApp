import 'package:flutter/material.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/input_title.dart';
import 'package:inspector/style/text_style.dart';

class ProjectTextField extends StatelessWidget { 

  final bool enabled;
  final int maxLines;
  final int minLines;
  final String title;
  final String hintText;
  final String initialValue;
  final TextEditingController controller;
  final Function(String) validator;
  final TextInputType inputType;

  ProjectTextField({
    this.controller, 
    this.title, 
    this.initialValue, 
    this.minLines, 
    this.maxLines, 
    this.hintText,
    this.validator,
    this.enabled = true,
    this.inputType,
  });

  Widget _buildField() {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(color: ProjectColors.lightBlue, width: 1)
    );
    return TextFormField(
      controller: controller,
      initialValue: initialValue,
      validator: validator,
      style: ProjectTextStyles.base.apply(color: ProjectColors.black),
      maxLines: maxLines,
      minLines: minLines,
      enabled: enabled,
      keyboardType: inputType,
      decoration: InputDecoration(
        filled: !enabled,
        fillColor: enabled ? null : ProjectColors.grey,
        hintText: hintText,
        contentPadding: const EdgeInsets.only(left: 10, top: 20, right: 10),
        hintStyle: ProjectTextStyles.base.apply(color: ProjectColors.darkBlue),
        border: border,
        enabledBorder: border,
        focusedBorder: border,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (title != null) {
      return ProjectInputTitle(title,
        child: _buildField(),
      );
    } else {
      return _buildField();
    }
  }
}