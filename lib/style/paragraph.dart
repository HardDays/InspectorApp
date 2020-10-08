import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/text_style.dart';

class ProjectParagraph extends StatelessWidget {

  final String title;
  final Widget icon;
  final EdgeInsets padding;
  final int maxLines;
  final Color color;

  const ProjectParagraph(this.icon, this.title, {this.maxLines, this.padding = EdgeInsets.zero, this.color = ProjectColors.black});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: icon,
          ),
          Flexible(
            child: Text(title,
              maxLines: maxLines,
              style: ProjectTextStyles.base.apply(color: color),
            ),
          ),
        ],
      ),
    );
  }

}
