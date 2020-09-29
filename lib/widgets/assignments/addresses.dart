import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/icons.dart';
import 'package:inspector/style/text_style.dart';
import 'package:inspector/widgets/assignments/paragraph.dart';

class AssignemntAddressesWidget extends StatelessWidget {

  final String task;
  final List<String> addresses;
  final EdgeInsets padding;

  AssignemntAddressesWidget(this.addresses, this.task, {this.padding = EdgeInsets.zero,});

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
                Container(
                  width: 2,
                  margin: const EdgeInsets.only(top: 19),
                  color: ProjectColors.mediumBlue,
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(addresses.length, (index) => _buildParagraph(ProjectIcons.mapIcon(), addresses[index], index == 10 ? 0 : 10)),
                  ),
                ),
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 2,
                height: 21,
                color: ProjectColors.mediumBlue,
              ),
              Flexible(
                child :_buildParagraph(ProjectIcons.themeIcon(), task, 10),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildParagraph(Widget icon, String title, double topPadding) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding),
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Container(
            height: 2,
            width: 8,
            color: ProjectColors.mediumBlue,
            margin: const EdgeInsets.only(top: 9),
          ),
          AssignemntParagraphWidget(icon, title,
            padding: const EdgeInsets.only(left: 6),
          ),
        ],
      ),
    );
  }
}
