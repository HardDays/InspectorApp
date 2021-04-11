import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:inspector/model/department_control/perform_mark.dart';
import 'package:inspector/style/card.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/text_style.dart';
import 'package:inspector/widgets/control/control_object/violation/page/has_date.dart';
import 'package:intl/intl.dart';

class PerformMarkWidget extends HasDate {
  const PerformMarkWidget({
    Key key,
    this.performMark,
  }) : super(key: key);

  final PerformMark performMark;

  @override
  Widget build(BuildContext context) {
    return ProjectCard(
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
                    color: ProjectColors.green,
                    padding: EdgeInsets.symmetric(horizontal: 9, vertical: 2),
                    child: Text(
                      'ОТМЕТКА НАРУШИТЕЛЯ ОБ УСТРАНЕНИИ',
                      style: ProjectTextStyles.small.apply(
                        color: ProjectColors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.5,
                  ),
                  Text(
                    DateFormat('dd.MM.yyyy hh:mm')
                        .format(performMark.resolveDate),
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
                        'Внес отметку:',
                        style: ProjectTextStyles.baseBold.apply(
                          color: ProjectColors.black,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, bottom: 8.0),
                        child: Text(
                          performMark.creator ?? '',
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
                        'Ответственный:',
                        style: ProjectTextStyles.baseBold.apply(
                          color: ProjectColors.black,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, bottom: 8.0),
                        child: Text(
                          performMark.organization ?? '',
                          style: ProjectTextStyles.base.apply(
                            color: ProjectColors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (performMark.comments != null &&
                      performMark.comments.isNotEmpty)
                    TableRow(
                      children: [
                        Text(
                          'Комментарий:',
                          style: ProjectTextStyles.baseBold.apply(
                            color: ProjectColors.black,
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 20.0, bottom: 8.0),
                          child: Text(
                            performMark.comments ?? '',
                            style: ProjectTextStyles.base.apply(
                              color: ProjectColors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ],
          ),
          if (performMark.photos.isNotEmpty)
            SizedBox(
              width: 210,
              height: 140,
              child: Image(
                image: MemoryImage(
                  base64.decode(performMark.photos.first.data),
                ),
                fit: BoxFit.contain,
              ),
            ),
        ],
      ),
    );
  }

  @override
  DateTime get date => performMark.resolveDate;
}
