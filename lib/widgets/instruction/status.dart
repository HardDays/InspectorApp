import 'dart:math' as math;
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
        Arc(
          color1: InstructionStatusColors.color(status.id),
          color2: status.id == InstructionStatusIds.partInProgress || status.id == InstructionStatusIds.partComplete ? Colors.white : InstructionStatusColors.color(status.id)
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(status.name,
            style: ProjectTextStyles.base.apply(color: ProjectColors.black)
          ),
        ),
      ],
    );
  }

}


class Arc extends StatelessWidget {
  final double diameter;
  final Color color1;
  final Color color2;

  const Arc({Key key, this.color1, this.color2, this.diameter = 12}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: MyPainter(
        color1: color1,
        color2: color2
      ),
      size: Size(diameter, diameter),
    );
  }
}

// This is the Painter class
class MyPainter extends CustomPainter {
  final Color color1;
  final Color color2;

  MyPainter({this.color1, this.color2});

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(Offset(size.height / 2, size.width / 2), size.width / 2 + 0.3, Paint()..color = Colors.grey);
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.height / 2, size.width / 2),
        height: size.height,
        width: size.width,
      ),
      math.pi / 2,
      math.pi,
      false,
      Paint()..color = color1,
    );
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.height / 2, size.width / 2),
        height: size.height,
        width: size.width,
      ),
      -math.pi / 2,
      math.pi,
      false,
      Paint()..color = color2,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}