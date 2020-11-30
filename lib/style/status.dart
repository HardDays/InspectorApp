import 'package:flutter/material.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/text_style.dart';

class ProjectStatus extends StatelessWidget {
  final String title;
  final bool rounded;
  final Color color;
  final bool rightBorder;

  const ProjectStatus(this.title, {this.color = ProjectColors.green, this.rounded = true, this.rightBorder = true});

  @override
  Widget build(BuildContext context) {
    //final border = BorderSide(color: color, width: 1);
    return Container(
      decoration: BoxDecoration(
        borderRadius: rounded ? BorderRadius.circular(5) : null,
        border: Border.all(color: color, width: 1)
      ),
      padding: const EdgeInsets.only(left: 5, right: 5, top: 2, bottom: 4),
      child: Text(title,
        style: ProjectTextStyles.smallBold.apply(color: color),
      ),
    );
  }
}
