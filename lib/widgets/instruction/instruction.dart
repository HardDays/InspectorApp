import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inspector/model/instruction.dart';
import 'package:inspector/model/instruction_status.dart';
import 'package:inspector/style/card.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/divider.dart';
import 'package:inspector/style/icons.dart';
import 'package:inspector/style/text_style.dart';
import 'package:inspector/widgets/instruction/check.dart';
import 'package:inspector/style/paragraph.dart';
import 'package:inspector/widgets/instruction/status.dart';
import 'package:intl/intl.dart';

class InstructionWidget extends StatefulWidget {

  final Instruction instruction;

  const InstructionWidget(this.instruction);

  @override
  InstructionWidgetState createState() => InstructionWidgetState();
}


class InstructionWidgetState extends State<InstructionWidget> with SingleTickerProviderStateMixin {

  // todo: replace to normal state manager
  bool _expanded = false;

  AnimationController _expandController;
  Animation<double> _animation; 

  @override
  void initState() {
    super.initState();

    _expandController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300)
    );
    _animation = CurvedAnimation(
      parent: _expandController,
      curve: Curves.fastOutSlowIn,
    );
  }

   @override
  void dispose() {
    _expandController.dispose();
    super.dispose();
  }

  void _onExpand() {
    if (_expanded) {
      _expandController.reverse();
    } else {
      _expandController.forward();
    }
    setState(() {
      _expanded = !_expanded;
    });
  }

  Color get _color => widget.instruction.instructionStatus.id == InstructionStatusIds.complete ? ProjectColors.mediumBlue : ProjectColors.black;

  @override
  Widget build(BuildContext context) {
    return ProjectCard(
      color: widget.instruction.instructionStatus.id == InstructionStatusIds.complete ? Colors.transparent : Colors.white,
      margin: const EdgeInsets.only(bottom: 20, left: 30, right: 30),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildTitle(),
              _buildStatus(),
            ],
          ),
          _buildDate(),
          _buildFirstCheck(),
          _buildRestChecks(),
          _buildInk()
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Flexible(
      child: Text('Поручение № ${widget.instruction.instructionNum} от ${DateFormat('dd.MM.yyyy').format(widget.instruction.instructionDate)}',
        style: ProjectTextStyles.subTitle.apply(color: _color),
      ),
    );
  }

  Widget _buildStatus() {
    return InstructionStatusWidget(
      widget.instruction.instructionStatus,
    );
  }

  Widget _buildDate() {
    return ProjectParagraph(ProjectIcons.calendarIcon(), DateFormat('dd.MM.yyyy').format(widget.instruction.checkDate),
      padding: const EdgeInsets.only(top: 12, left: 8),
      color: _color,
    );
  }

  Widget _buildFirstCheck() {
    if (widget.instruction.instructionChecks.isNotEmpty) {
      return InstructionCheckWidget(widget.instruction.instructionChecks.first, 
        padding: const EdgeInsets.only(top: 10, bottom: 12),
        color: _color
      );
    } else {
      return Container();
    }
  }

  Widget _buildRestChecks() {
    if (widget.instruction.instructionChecks.length > 1) {
      // return InstructionCheckWidget(widget.instruction.instructionChecks.first, 
      //   padding: const EdgeInsets.only(top: 10, bottom: 12)
      // );
      final checks = widget.instruction.instructionChecks;
      return SizeTransition(
        axisAlignment: 1.0,
        sizeFactor: _animation,
        child: Column(
          children: List.generate(checks.length - 1, 
            (index) => Column(
              children: [
                ProjectDivider(),
                InstructionCheckWidget(checks[index + 1],
                  padding: const EdgeInsets.only(top: 3, bottom: 12),
                  color: _color
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  Widget _buildInk() {
    if (widget.instruction.instructionChecks.length > 1) {
      return InkWell(
        onTap: _onExpand,
        child: Padding(
          padding: const EdgeInsets.only(top: 3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 20,
                height: 20,
                alignment: Alignment.center,
                margin: const EdgeInsets.only(right: 10),
                decoration: const BoxDecoration(
                  color: ProjectColors.darkBlue,
                  shape: BoxShape.circle
                ),
                child: _buildInkIcon(),
              ),
              _buildInkText(),
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  Widget _buildInkIcon() {
    if (_expanded) {
      return const Icon(Icons.keyboard_arrow_up,
        size: 18,
        color: Colors.white,
      );
    } else {
      return Text('+${widget.instruction.instructionChecks.length - 1}',
        style: ProjectTextStyles.small.apply(color: Colors.white),
      );
    }
  }

  Widget _buildInkText() {
    return Text(_expanded ? 'Скрыть все' : 'Показать все',
      style: ProjectTextStyles.small.apply(color: ProjectColors.darkBlue, decoration: TextDecoration.underline),
    );
  }

}
