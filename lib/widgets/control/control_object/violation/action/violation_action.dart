import 'package:flutter/material.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/text_style.dart';

class ViolationAction extends StatelessWidget {
  const ViolationAction({
    Key key,
    this.icon,
    this.text,
    this.onTap,
  }) : super(key: key);

  final Widget icon;
  final String text;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: ProjectColors.grey,
          border: Border(
            right: BorderSide(color: ProjectColors.lightBlue),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            Text(
              text,
              textAlign: TextAlign.center,
              style: ProjectTextStyles.smallAction
                  .apply(color: ProjectColors.black),
            ),
          ],
        ),
      ),
    );
  }
}
