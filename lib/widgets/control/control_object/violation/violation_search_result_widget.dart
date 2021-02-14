import 'package:flutter/material.dart';
import 'package:inspector/model/department_control/violation_search_result.dart';
import 'package:inspector/widgets/control/control_object/violation/violation.dart';

class ViolationSearchResultWidget extends StatelessWidget {
  const ViolationSearchResultWidget({
    Key key,
    this.violation,
    this.onClick,
    this.onCompleted,
    this.onNotCompleted,
    this.onRemove,
  }) : super(key: key);

  final ViolationSearchResult violation;
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
      violationName: violation.eknViolationClassification?.violationName ?? violation.otherViolationClassification.violationName,
      violationNum: violation.violationNum,
      violationStatus: violation.violationStatus,
      onClick: onClick,
    );
  }
}
