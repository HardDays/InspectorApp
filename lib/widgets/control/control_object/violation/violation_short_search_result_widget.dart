import 'package:flutter/material.dart';
import 'package:inspector/model/department_control/violation_short_search_result.dart';
import 'package:inspector/widgets/control/control_object/violation/violation.dart';

class ViolationShortSearchResultWidget extends StatelessWidget {
  const ViolationShortSearchResultWidget({
    Key key,
    this.violation,
    this.onClick,
    this.onCompleted,
    this.onNotCompleted,
    this.onRemove,
  }) : super(key: key);

  final ViolationShortSearchResult violation;
  final void Function() onClick;
  final void Function() onCompleted;
  final void Function() onNotCompleted;
  final void Function() onRemove;

  @override
  Widget build(BuildContext context) {
    return ControlViolationWidget(
      detectionDate: violation.detectionDate,
      objectElement: violation.objectElement,
      photos: violation.photos,
      source: violation.source,
      violationName: violation.eknViolationName ?? violation.otherViolationName,
      violationNum: violation.violationNum,
      violationStatus: violation.violationStatus,
      onClick: onClick,
    );
  }
}
