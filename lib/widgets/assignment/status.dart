import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/text_style.dart';

class AssignemntStatusWidget extends StatelessWidget {

  //todo: map with api
  static const colors = const {
    'Назначено': ProjectColors.cyan,
    'На исполнении': ProjectColors.yellow,
    'Исполнено': ProjectColors.green
  };

  final String status;

  const AssignemntStatusWidget(this.status);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          margin: const EdgeInsets.only(right: 8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: colors[status],
          ),
        ),
        Text(status,
          style: ProjectTextStyles.base.apply(color: ProjectColors.black)
        ),
      ],
    );
  }

}
