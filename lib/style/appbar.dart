import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/text_style.dart';

class ProjectAppbar extends StatelessWidget implements PreferredSizeWidget {
  
  final String title;

  ProjectAppbar(this.title);

  @override
  final Size preferredSize = Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: ProjectColors.darkBlue,
      centerTitle: true,
      title: Padding(
        padding: const EdgeInsets.only(left: 12),
        child: Text(title,
          style: ProjectTextStyles.title.apply(
            color: ProjectColors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

}
