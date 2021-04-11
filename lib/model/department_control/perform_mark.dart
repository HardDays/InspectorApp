import 'package:inspector/model/department_control/dcphoto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'perform_mark.g.dart';
part 'perform_mark.freezed.dart';

@freezed
abstract class PerformMark with _$PerformMark {
  const factory PerformMark({
    int id,
    DateTime resolveDate,
    String organization,
    String creator,
    String comments,
    List<DCPhoto> photos,
  }) = _PerformMark;

  factory PerformMark.fromJson(Map<String, dynamic> json) =>
      _$PerformMarkFromJson(json);

}
