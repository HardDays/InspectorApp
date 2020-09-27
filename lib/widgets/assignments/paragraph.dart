import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/text_style.dart';

class AssignemntParagraphWidget extends StatelessWidget {

  final String title;
  final Widget icon;
  final EdgeInsets padding;

  const AssignemntParagraphWidget(this.icon, this.title, {this.padding = EdgeInsets.zero,});

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
              style: ProjectTextStyles.base.apply(color: ProjectColors.black),
            ),
          ),
        ],
      ),
    );
  }

}
