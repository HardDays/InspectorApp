import 'package:flutter/material.dart';
import 'package:inspector/model/department_control/violation_extension_period_search_result.dart';
import 'package:inspector/style/card.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/text_style.dart';
import 'package:inspector/widgets/control/control_object/violation/page/has_date.dart';
import 'package:intl/intl.dart';

class ViolationExtensionPeriodCard extends HasDate {
  const ViolationExtensionPeriodCard({
    this.violationExtensionPeriod,
    Key key,
  }) : super(key: key);

  final ViolationExtensionPeriodSearchResult violationExtensionPeriod;

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
                    color: ProjectColors.cyan,
                    padding: EdgeInsets.symmetric(horizontal: 9, vertical: 2),
                    child: Text(
                      'ИЗМЕНЕНИЕ СРОКА УСТРАНЕНИЯ',
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
                        .format(violationExtensionPeriod.resolveDate),
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
                        '${violationExtensionPeriod.decisionPersonOccupation ?? ""}:',
                        style: ProjectTextStyles.baseBold.apply(
                          color: ProjectColors.black,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, bottom: 8.0),
                        child: Text(
                          violationExtensionPeriod.decisionPersonFio ?? '',
                          style: ProjectTextStyles.base.apply(
                            color: ProjectColors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // TableRow(
                  //   children: [
                  //     Text(
                  //       'Плановая дата:',
                  //       style: ProjectTextStyles.baseBold.apply(
                  //         color: ProjectColors.black,
                  //       ),
                  //     ),
                  //     Padding(
                  //       padding: const EdgeInsets.only(left: 20.0, bottom: 8.0),
                  //       child: Text(
                  //         DateFormat('dd.MM.yyyy hh:mm')
                  //           .format(violationExtensionPeriod.resolveDate),
                  //         style: ProjectTextStyles.base.apply(
                  //           color: ProjectColors.black,
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // TableRow(
                  //   children: [
                  //     Text(
                  //       'Устранено:',
                  //       style: ProjectTextStyles.baseBold.apply(
                  //         color: ProjectColors.black,
                  //       ),
                  //     ),
                  //     Padding(
                  //       padding: const EdgeInsets.only(left: 20.0, bottom: 8.0),
                  //       child: Text(
                  //         violationExtensionPeriod.,
                  //         style: ProjectTextStyles.base.apply(
                  //           color: ProjectColors.black,
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  DateTime get date => violationExtensionPeriod.resolveDate;
}
