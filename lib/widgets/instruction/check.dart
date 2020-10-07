import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inspector/model/instruction_check.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/icons.dart';
import 'package:inspector/style/paragraph.dart';

class InstructionCheckWidget extends StatelessWidget {

  final EdgeInsets padding;
  final InstructionCheck instructionCheck;

  InstructionCheckWidget(this.instructionCheck, {this.padding = EdgeInsets.zero,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildVertical(
                  margin: const EdgeInsets.only(top: 19),
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(0, (index) => _buildParagraph(ProjectIcons.mapIcon(),' addresses[index]', index == 10 ? 0 : 10)),
                  ),
                ),
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [ 
              _buildVertical(
                height: 21
              ),
              Flexible(
                child :_buildParagraph(ProjectIcons.themeIcon(), instructionCheck.checkSubject, 10),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildVertical({double height, EdgeInsets margin = EdgeInsets.zero}) {
    final count = 0;
    if (count > 0) {
      return Container(
        width: 2,
        height: height,
        color: ProjectColors.mediumBlue,
        margin: margin,
      );
    } else {
      return Container();
    }
  }

  Widget _buildParagraph(Widget icon, String title, double topPadding) {
    final count = 0;
    return Padding(
      padding: EdgeInsets.only(top: topPadding),
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          count > 0 ?Container(
            height: 2,
            width: 8,
            color: ProjectColors.mediumBlue,
            margin: const EdgeInsets.only(top: 9),
          ) : Container(),
          ProjectParagraph(icon, title,
            padding: const EdgeInsets.only(left: 6),
          ),
        ],
      ),
    );
  }
}
