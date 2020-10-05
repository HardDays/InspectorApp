import 'package:flutter/material.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/divider.dart';
import 'package:inspector/style/text_style.dart';

class ProjectTitle extends StatelessWidget { 

  final String title;

  ProjectTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
          style: ProjectTextStyles.subTitle.apply(color: ProjectColors.black),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 7),
          child: ProjectDivider(),
        ),
      ],
    );
  }

}