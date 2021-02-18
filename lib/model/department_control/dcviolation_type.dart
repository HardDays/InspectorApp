import 'package:freezed_annotation/freezed_annotation.dart';

part 'dcviolation_type.g.dart';
part 'dcviolation_type.freezed.dart';

@freezed
abstract class DCViolationType with _$DCViolationType {
  const factory DCViolationType({
    int id,
    String name,
  }) = _DCViolationType;

  factory DCViolationType.fromJson(Map<String, dynamic> json) =>
      _$DCViolationTypeFromJson(json);
}