import 'package:flutter/material.dart';
import 'package:inspector/model/department_control/control_result_search_result.dart';
import 'package:inspector/model/department_control/violation_search_result.dart';
import 'package:inspector/widgets/control/control_object/violation/violation.dart';

class ViolationSearchResultWidget extends StatelessWidget {
  ViolationSearchResultWidget({
    Key key,
    this.onClick,
    this.onCompleted,
    this.onNotCompleted,
    this.onRemove,
    this.searchResult,
  }) : super(key: key);

  final ControlResultSearchResult searchResult;
  final void Function() onClick;
  final void Function() onCompleted;
  final void Function() onNotCompleted;
  final void Function() onRemove;

  @override
  Widget build(BuildContext context) {
    return ControlViolationWidget(
      detectionDate: searchResult.surveyDate,
      objectElement: searchResult.violation.objectElement,
      photos: searchResult.violation.photos,
      source: searchResult.violation.source,
      violationName: searchResult.violation.eknViolationClassification?.violationName ?? searchResult.violation.otherViolationClassification.violationName,
      violationNum: searchResult.violation.violationNum,
      violationStatus: searchResult.violation.violationStatus,
      onClick: onClick,
    );
  }
}
