import 'package:flutter/material.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/divider.dart';
import 'package:inspector/style/text_style.dart';

class ProjectSection extends StatelessWidget {
  final String title;
  final String description;
  final Widget child;

  ProjectSection(this.title, {this.description, this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.3,
              margin: const EdgeInsets.all(16),
              child: Text(
                title,
                style:
                    ProjectTextStyles.baseBold.apply(color: ProjectColors.blue),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 16, right: 16),
                child: Row(
                  children: [
                    if(description != null)
                      Flexible(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Text(
                          description,
                          style: ProjectTextStyles.base
                              .apply(color: ProjectColors.black),
                      ),
                        ),
                      ),
                    if(child != null)
                      child,
                  ],
                ),
              ),
            ),
          ],
        ),
        ProjectDivider()
      ],
    );
  }
}
