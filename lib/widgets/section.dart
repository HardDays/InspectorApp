import 'package:flutter/material.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/text_style.dart';

class SectionWidget extends StatelessWidget { 

  final String title;
  final String description;
  final Widget child;

  SectionWidget(this.title, {this.description, this.child});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.3,
          margin: const EdgeInsets.all(16.0),
          child: Text(title,
            style: ProjectTextStyles.baseBold.apply(color: ProjectColors.blue),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 16, right: 16),
            child: description != null ? Text(description,  
              style: ProjectTextStyles.base.apply(color: ProjectColors.black),
            ) : child,
          )
        ),
      ],
    );
  }

}