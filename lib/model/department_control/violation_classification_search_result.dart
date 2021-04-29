import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inspector/model/department_control/dcviolation_kind.dart';
import 'package:inspector/model/department_control/dcviolation_type.dart';
import 'package:inspector/model/department_control/object_element.dart';
import 'package:inspector/model/department_control/object_type.dart';
import 'package:inspector/model/department_control/violation_name.dart';

part 'violation_classification_search_result.freezed.dart';
part 'violation_classification_search_result.g.dart';

@freezed
abstract class ViolationClassificationSearchResult
    implements _$ViolationClassificationSearchResult {
  const ViolationClassificationSearchResult._();
  const factory ViolationClassificationSearchResult({
    int id,
    ViolationName violationName,
    DCViolationType violationType,
    DCViolationKind violationKind,
    ObjectType objectType,
    ObjectElement objectElement,
    bool ekn,
    String warning,
    String regulations,
    String npa,
    String article,
  }) = _ViolationClassificationSearchResult;

  factory ViolationClassificationSearchResult.fromJson(
          Map<String, dynamic> json) =>
      _$ViolationClassificationSearchResultFromJson(json);

  Map<String, dynamic> toSqliteJson() => {
        'id': id,
        'ekn': ekn ? 1 : 0,
        'warning': warning,
        'regulations': regulations,
        'npa': npa,
        'article': article,
        'violationNameId': violationName?.id,
        'violationNameName': violationName?.name,
        'violationNameViolationFullName': violationName.violationFullName,
        'violationNameExternalId': violationName.externalId,
        'violationTypeId': violationType?.id,
        'violationTypeName': violationType?.name,
        'violationKindId': violationKind?.id,
        'violationKindName': violationKind?.name,
        'objectTypeId': objectType?.id,
        'objectTypeName': objectType?.name,
        'objectTypeCode': objectType?.code,
        'objectElementId': objectElement?.id,
        'objectElementName': objectElement?.name,
        'objectElementObjectTypeId': objectElement?.objectType?.id,
        'objectElementObjectTypeName': objectElement?.objectType?.name,
        'objectElementObjectTypeCode': objectElement?.objectType?.code,
      };

  factory ViolationClassificationSearchResult.fromSqliteJson(
          Map<String, dynamic> json) =>
      ViolationClassificationSearchResult(
        id: json['id'],
        ekn: json['ekn'] == 1,
        warning: json['warning'],
        regulations: json['regulations'],
        npa: json['npa'],
        article: json['article'],
        violationName: ViolationName(
          id: json['violationNameId'],
          name: json['violationNameName'],
          externalId: json['violationNameExternalId'],
          violationFullName: json['violationNameViolationFullName'],
        ),
        violationType: DCViolationType(
          id: json['violationTypeId'],
          name: json['violationTypeName'],
        ),
        violationKind: DCViolationKind(
          id: json['violationKindId'],
          name: json['violationKindName'],
        ),
        objectType: ObjectType(
            id: json['objectTypeId'],
            name: json['objectNameId'],
            code: json['objectCodeId'],
        ),
        objectElement: ObjectElement(
          id: json['objectElementId'],
          name: json['objectElementName'],
          objectType: ObjectType(
            id: json['objectElementObjectTypeId'],
            name: json['objectElementObjectNameId'],
            code: json['objectElementObjectCodeId'],
          ),
        ),
      );
}
