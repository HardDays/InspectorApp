
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inspector/model/department_control/dcphoto.dart';

part 'perform_control.freezed.dart';
part 'perform_control.g.dart';

@freezed
abstract class PerformControl with _$PerformControl {
  const factory PerformControl({
    int id,
    DateTime planDate,
    DateTime factDate,
    bool resolved,
    List<DCPhoto> photos,
  }) = _PerformControl;

  factory PerformControl.fromJson(Map<String, dynamic> json) =>
      _$PerformControlFromJson(json);
}