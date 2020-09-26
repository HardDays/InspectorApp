import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:inspector/style/button.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/icons.dart';
import 'package:inspector/style/text_style.dart';
import 'package:inspector/widgets/assignments/paragraph.dart';
import 'package:inspector/widgets/assignments/status.dart';
import 'package:intl/intl.dart';

class AssignemntsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: ProjectColors.darkBlue,
        title: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Text(
            'Поручения',
            style: ProjectTextStyles.title.apply(
              color: ProjectColors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 20),
        children: [
          _buildAssignment(),
          _buildAssignment(),
           _buildAssignment(),
          _buildAssignment(),
           _buildAssignment(),
          _buildAssignment(),
           _buildAssignment(),
          _buildAssignment(),
           _buildAssignment(),
          _buildAssignment(),
           _buildAssignment(),
          _buildAssignment(),
           _buildAssignment(),
          _buildAssignment(),
        ],
      ),
    );
  }

  Widget _buildAssignment() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: ProjectColors.lightBlue, 
          width: 1,
        ),
      ),
      margin: const EdgeInsets.only(bottom: 20, left: 30, right: 30),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text('Поручение № 20-61-A95-62 от 10.03.2020',
                  style: ProjectTextStyles.subTitle.apply(color: ProjectColors.black),
                ),
              ),
              AssignemntStatusWidget(
                'Назначено',
              ),
            ],
          ),
          AssignemntParagraphWidget(ProjectIcons.calendarIcon(), DateFormat('dd.MM.yyyy').format(DateTime.now()),
            padding: const EdgeInsets.only(left: 8, top: 10),
          )
        ],
      ),
    );
  }

}
