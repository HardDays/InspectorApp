import 'package:inspector/model/department_control/dcphoto.dart';
import 'package:inspector/model/department_control/object_element.dart';
import 'package:inspector/model/department_control/source.dart';
import 'package:inspector/model/department_control/violation_name.dart';
import 'package:inspector/model/violation_status.dart';
import 'package:json_annotation/json_annotation.dart';

part 'violation_short_search_result.g.dart';

@JsonSerializable()
class ViolationShortSearchResult {
  final int id;
  final String violationNum;
  final ViolationStatus violationStatus;
  final String detectionDate;
  final Source source;
  final ObjectElement objectElement;
  final ViolationName eknViolationName;
  final ViolationName otherViolationName;
  final String resolveDate;
  final String controlDate;
  final List<DCPhoto> photos;

  ViolationShortSearchResult({
    this.id,
    this.violationNum,
    this.violationStatus,
    this.detectionDate,
    this.source,
    this.objectElement,
    this.eknViolationName,
    this.otherViolationName,
    this.resolveDate,
    this.controlDate,
    this.photos,
  });

  factory ViolationShortSearchResult.fromJson(Map<String, dynamic> json) =>
      _$ViolationShortSearchResultFromJson(json);
  Map<String, dynamic> toJson() => _$ViolationShortSearchResultToJson(this);
}
