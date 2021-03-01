import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inspector/model/department_control/dcphoto.dart';

part 'perform_control_search_result.freezed.dart';
part 'perform_control_search_result.g.dart';

@freezed
abstract class PerformControlSearchResult with _$PerformControlSearchResult {
  const factory PerformControlSearchResult({
    int id,
    DateTime planDate,
    DateTime factDate,
    bool resolved,
    List<DCPhoto> photos,
    String creatorShortFio,
    bool sentToCafap,
  }) = _PerformControlSearchResult;

  factory PerformControlSearchResult.fromJson(Map<String, dynamic> json) =>
      _$PerformControlSearchResultFromJson(json);
}