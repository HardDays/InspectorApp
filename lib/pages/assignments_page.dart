import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:inspector/style/button.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/icons.dart';
import 'package:inspector/style/text_style.dart';

class AssignemntsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: ProjectColors.darkBlue,
        title: Text(
          'Поручения',
          style: ProjectTextStyles.title.apply(
            color: ProjectColors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
     
          ],
        ),
      ),
    );
  }

  Widget _buildSectionItem(String name, Widget child) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              name,
              style:
                  ProjectTextStyles.baseBold.apply(color: ProjectColors.blue),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: child,
        ),
      ],
    );
  }

  Widget _buildSection(String sectionName, List<Widget> children) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30, 0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(14.0, 30.0, 0, 11),
            child: Container(
              width: double.infinity,
              child: Text(
                sectionName,
                style: ProjectTextStyles.subTitle
                    .apply(color: ProjectColors.black),
              ),
            ),
          ),
          ...children,
        ]
            .map(
              (e) => Container(
                child: e,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: ProjectColors.lightBlue),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
