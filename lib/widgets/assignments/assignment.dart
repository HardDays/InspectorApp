import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:inspector/pages/assignment_page.dart';
import 'package:inspector/style/button.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/icons.dart';
import 'package:inspector/style/text_style.dart';
import 'package:inspector/widgets/assignments/addresses.dart';
import 'package:inspector/widgets/assignments/paragraph.dart';
import 'package:inspector/widgets/assignments/status.dart';
import 'package:intl/intl.dart';

class AssignmentWidget extends StatefulWidget {

  //todo: make according api model

  final List<Map<String, dynamic>> tasks;

  AssignmentWidget(this.tasks);

  @override
  AssignmentWidgetState createState() => AssignmentWidgetState();
}


class AssignmentWidgetState extends State<AssignmentWidget> with SingleTickerProviderStateMixin {

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

  void _onTap() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => AssignmentPage()));
  }

  @override
  Widget build(BuildContext context) {
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
      child: InkWell(
        onTap: _onTap,
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
              padding: const EdgeInsets.only(top: 20, left: 8),
            ),
            _buildAddress(widget.tasks.first,
              padding: const EdgeInsets.only(top: 10, bottom: 12),
              divider: false
            ),
            SizeTransition(
              axisAlignment: 1.0,
              sizeFactor: _animation,
              child: Column(
                children: List.generate(widget.tasks.length - 1, (index) => _buildAddress(widget.tasks[index + 1])),
              ),
            ),
            _buildInk()
          ],
        ),
      ),
    );
  }

  Widget _buildAddress(Map<String, dynamic> task, {bool divider = true, EdgeInsets padding = const EdgeInsets.only(top: 3, bottom: 12)}) {
    return Column(
      children: [
        divider ? Divider(
          color: ProjectColors.lightBlue,
          height: 1,
        ) : Container(),
        AssignemntAddressesWidget(task['addresses'], task['task'],
          padding: padding,
        ),
      ],
    );
  }

  Widget _buildInk() {
    if (widget.tasks.length > 1) {
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
                child: _expanded ? const Icon(Icons.keyboard_arrow_up,
                  size: 18,
                  color: Colors.white,
                ) : Text('+${widget.tasks.length - 1}',
                  style: ProjectTextStyles.small.apply(color: Colors.white),
                ),
              ),
              Text(_expanded ? 'Скрыть все' : 'Показать все',
                style: ProjectTextStyles.small.apply(color: ProjectColors.darkBlue, decoration: TextDecoration.underline),
              ),
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }

}
