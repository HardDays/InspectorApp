import 'package:flutter/material.dart';

class ProjectExpandable extends StatefulWidget { 
  final String title;
  final Widget child;

  ProjectExpandable({
    this.title,
    this.child
  });

  @override
  ProjectExpandableState createState() => ProjectExpandableState();

}

class ProjectExpandableState extends State<ProjectExpandable> {


  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(widget.title),
      children: [
        widget.child
      ],
    );
  }
}