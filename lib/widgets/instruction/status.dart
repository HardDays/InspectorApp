import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inspector/model/instruction_status.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/text_style.dart';

class InstructionStatusWidget extends StatelessWidget {

  final InstructionStatus status;

  const InstructionStatusWidget(this.status);

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
            color: InstructionStatusColors.color(status.id),
          ),
        ),
        Text(status.name,
          style: ProjectTextStyles.base.apply(color: ProjectColors.black)
        ),
      ],
    );
  }

}
