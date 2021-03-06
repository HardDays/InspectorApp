import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/text_style.dart';

class ControlStatusWidget extends StatelessWidget {
  //todo: map with api
  static const colors = const {
    'ОДХ': ProjectColors.cyan,
    'КП': ProjectColors.brown,
    'ДТ': ProjectColors.green,
    'КР': ProjectColors.yellow,
  };

  final String status;
  final String number;

  const ControlStatusWidget(this.status, this.number);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            padding:
                const EdgeInsets.only(top: 2, bottom: 3, left: 9, right: 9),
            decoration: BoxDecoration(
              color: colors[status],
            ),
            child: Text(
              status ?? '',
              style: ProjectTextStyles.smallBold.apply(
                color: ProjectColors.white,
              ),
            ),
          ),
          Flexible(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: 150,
              ),
              child: SingleChildScrollView(
                child: Text(
                  number,
                  style: ProjectTextStyles.baseBold.apply(
                    color: ProjectColors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
