import 'package:flutter/material.dart';
import 'package:inspector/model/department_control/control_result_search_result.dart';
import 'package:inspector/widgets/control/control_object/violation/violation.dart';

class ViolationSearchResultWidget extends StatelessWidget {
  ViolationSearchResultWidget({
    Key key,
    this.onClick,
    this.onCompleted,
    this.onNotCompleted,
    this.onRemove,
    this.searchResult,
    this.onEdit,
  }) : super(key: key);

  final ControlResultSearchResult searchResult;
  final void Function() onClick;
  final void Function() onCompleted;
  final void Function() onNotCompleted;
  final void Function() onRemove;
  final void Function() onEdit;

  @override
  Widget build(BuildContext context) {
    return ControlViolationWidget(
      detectionDate: searchResult.surveyDate,
      objectElement: searchResult.violation.objectElement,
      photos: searchResult.violation.photos,
      source: searchResult.violation.source,
      violationName:
          searchResult.violation.eknViolationClassification?.violationName ??
              searchResult.violation.otherViolationClassification.violationName,
      violationNum: searchResult.violation.violationNum,
      violationStatus: searchResult.violation.violationStatus,
      onClick: onClick,
      onCompleted: _canCreatePerformControl ? onCompleted : null,
      onNotCompleted: _canCreatePerformControl ? onNotCompleted : null,
      onRemove: _canBeDeleted ? onRemove : null,
      onEdit: _canBeUpdated ? onEdit : null,
    );
  }

  bool get _canCreatePerformControl =>
      !['Новый', 'Снят с контроля']
          .contains(searchResult.violation.violationStatus?.name) &&
      (['ОАТИ', 'АК'].contains(searchResult.violation?.source?.name) ||
          (searchResult.violation?.source?.name == 'ЦАФАП' &&
              searchResult.violation.cafapViolationConfirmed));

  bool get _canBeDeleted => _canBeUpdated || searchResult.violation?.violationStatus == null;
  bool get _canBeUpdated => ['Снят с контроля', 'На устранении', 'На контроле инспектора', 'Новое'].contains(searchResult.violation?.violationStatus?.name);
}
