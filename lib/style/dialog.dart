import 'package:flutter/material.dart';

class ProjectDialog extends StatelessWidget {

  final Widget child;

  const ProjectDialog({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      alignment: Alignment.center,
      child: Material(
        color: Colors.transparent,
          child: Container(
          padding: const EdgeInsets.all(45),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)
          ),
          child: child,
        ),
      ),
    );
  }
}