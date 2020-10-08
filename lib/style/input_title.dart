import 'package:flutter/material.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/text_style.dart';

class ProjectInputTitle extends StatelessWidget { 

  final String title;
  final Widget child;

  ProjectInputTitle(this.title, {this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
          style: ProjectTextStyles.medium.apply(color: ProjectColors.black),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: child
        ),
      ],
    );
  }
}