import 'package:flutter/material.dart';
import 'package:inspector/style/colors.dart';

class ProjectCard extends StatelessWidget { 

  final EdgeInsets margin;
  final EdgeInsets padding;
  final Color color;
  
  final Widget child;

  ProjectCard({
    this.child, 
    this.color = Colors.white,
    this.padding = const EdgeInsets.all(20), 
    this.margin = const EdgeInsets.only(bottom: 20, left: 30, right: 30)
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        border: Border.all(
          color: ProjectColors.lightBlue, 
          width: 1,
        ),
      ),
      margin: margin,
      padding: padding,
      child: child,
    );
  }

}