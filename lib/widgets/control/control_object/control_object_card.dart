import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:inspector/model/department_control/control_object.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/icons.dart';
import 'package:inspector/style/text_style.dart';
import 'package:inspector/widgets/control/control_object/control_object_widget.dart';
import 'package:inspector/widgets/control/control_object/violation/violation_short_search_result_widget.dart';

class ControlObjectCard extends StatelessWidget {
  final ControlObject controlObject;

  final void Function(ControlObject) open;
  final void Function(ControlObject) hasViolation;
  final void Function(ControlObject) hasNotViolation;
  final void Function(ControlObject) showInMap;

  const ControlObjectCard({
    Key key,
    @required this.controlObject,
    @required this.open,
    @required this.hasViolation,
    @required this.hasNotViolation,
    @required this.showInMap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20, left: 30, right: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: ProjectColors.lightBlue,
          width: 1,
        ),
      ),
      child: Column(
        children: [
          ClipRect(
            child: Slidable(
              actionExtentRatio: 0.15,
              actionPane: SlidableDrawerActionPane(),
              secondaryActions: [
                _buildAction(
                  ProjectIcons.thumbUpIcon(
                      padding: const EdgeInsets.only(bottom: 7)),
                  'Нарушений\nне выявлено',
                  hasNotViolation,
                ),
                _buildAction(
                  ProjectIcons.thumbDownIcon(
                      padding: const EdgeInsets.only(bottom: 3)),
                  'Выявлено\nнарушение',
                  hasViolation,
                ),
                _buildAction(
                  ProjectIcons.pinIcon(
                      padding: const EdgeInsets.only(bottom: 5)),
                  'Показать на\nкарте',
                  showInMap,
                ),
                _buildAction(
                  ProjectIcons.viewIcon(
                    color: ProjectColors.darkBlue,
                  ),
                  'Просмотр\nобъекта',
                  open,
                ),
              ],
              child: ControlObjectWidget(
                controlObject: controlObject,
                onTap: open,
              ),
            ),
          ),
          Column(
            children: controlObject.violations
                .map(
                  (e) => ViolationShortSearchResultWidget(
                    onClick: () {},
                    onCompleted: () {},
                    onNotCompleted: () {},
                    onRemove: () {},
                    violation: e,
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }

  Widget _buildAction(
      Widget icon, String text, void Function(ControlObject) onTap) {
    return InkWell(
      onTap: () => onTap(controlObject),
      child: Container(
        decoration: BoxDecoration(
          color: ProjectColors.grey,
          border: Border(
            right: BorderSide(color: ProjectColors.lightBlue),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 34,
              child: icon,
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: ProjectTextStyles.smallAction
                  .apply(color: ProjectColors.black),
            ),
          ],
        ),
      ),
    );
  }
}
