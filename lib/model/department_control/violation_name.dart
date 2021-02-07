import 'package:freezed_annotation/freezed_annotation.dart';

part 'violation_name.g.dart';
part 'violation_name.freezed.dart';

@freezed
abstract class ViolationName with _$ViolationName {
  const factory ViolationName({
    int id,
    String name,
  }) = _ViolationName;

  factory ViolationName.fromJson(Map<String, dynamic> json) =>
      _$ViolationNameFromJson(json);

}