import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:inspector/model/department_control/perform_control_search_result.dart';
import 'package:inspector/style/card.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/icons.dart';
import 'package:inspector/style/switch.dart';
import 'package:inspector/style/text_style.dart';
import 'package:inspector/widgets/control/control_object/violation/action/violation_action.dart';
import 'package:inspector/widgets/control/control_object/violation/page/has_date.dart';
import 'package:intl/intl.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class PerformControlWidget extends HasDate {
  const PerformControlWidget({
    Key key,
    this.performControl,
    this.onResolveChanged,
    this.onRemove,
  }) : super(key: key);

  final PerformControlSearchResult performControl;
  final Function(PerformControlSearchResult performControl) onResolveChanged;
  final Function(PerformControlSearchResult performControl) onRemove;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      child: ProjectCard(
        margin: EdgeInsets.symmetric(vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      color: ProjectColors.cyan,
                      padding: EdgeInsets.symmetric(horizontal: 9, vertical: 2),
                      child: Text(
                        'КОНТРОЛЬ УСТРАНЕНИЯ',
                        style: ProjectTextStyles.small.apply(
                          color: ProjectColors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.5,
                    ),
                    Text(
                      DateFormat('dd.MM.yyyy hh:mm').format(performControl.factDate),
                      style: ProjectTextStyles.baseBold.apply(
                        color: ProjectColors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.25,
                ),
                Table(
                  defaultColumnWidth: IntrinsicColumnWidth(),
                  children: [
                    TableRow(
                      children: [
                        Text(
                          'Инспектор:',
                          style: ProjectTextStyles.baseBold.apply(
                            color: ProjectColors.black,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, bottom: 8.0),
                          child: Text(
                            performControl.creatorShortFio,
                            style: ProjectTextStyles.base.apply(
                              color: ProjectColors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text(
                          'Плановая дата:',
                          style: ProjectTextStyles.baseBold.apply(
                            color: ProjectColors.black,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, bottom: 8.0),
                          child: Text(
                            DateFormat('dd.MM.yyyy hh:mm')
                                .format(performControl.planDate),
                            style: ProjectTextStyles.base.apply(
                              color: ProjectColors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text(
                          'Устранено:',
                          style: ProjectTextStyles.baseBold.apply(
                            color: ProjectColors.black,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, bottom: 8.0),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: ProjectSwitch(
                              checked: performControl.resolved,
                              onChanged: (value) => onResolveChanged(performControl.copyWith(resolved: value)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            if(performControl.photos.isNotEmpty)
              SizedBox(
                width: 210,
                height: 140,
                child: Image(
                  image: MemoryImage(
                      base64.decode(performControl.photos.first.data)),
                  fit: BoxFit.contain,
                ),
              ),
          ],
        ),
      ),
      secondaryActions: [
        if(onRemove != null)
          ViolationAction(
            icon: ProjectIcons.delete1Icon(),
            text: 'Удалить',
            onTap: () => onRemove(performControl),
          ),
      ],
    );
  }

  @override
  DateTime get date => performControl.factDate;
}
