import 'package:inspector/model/department_control/dcphoto.dart';
import 'package:inspector/model/department_control/object_element.dart';
import 'package:inspector/model/department_control/source.dart';
import 'package:inspector/model/department_control/violation_name.dart';
import 'package:inspector/model/violation_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'violation_short_search_result.g.dart';
part 'violation_short_search_result.freezed.dart';

@freezed
abstract class ViolationShortSearchResult with _$ViolationShortSearchResult {

  const factory ViolationShortSearchResult({
    int id,
    String violationNum,
    ViolationStatus violationStatus,
    String detectionDate,
    Source source,
    ObjectElement objectElement,
    ViolationName eknViolationName,
    ViolationName otherViolationName,
    String resolveDate,
    String controlDate,
    List<DCPhoto> photos,
  }) = _ViolationShortSearchResult;

  factory ViolationShortSearchResult.fromJson(Map<String, dynamic> json) =>
      _$ViolationShortSearchResultFromJson(json);

}
