import 'package:freezed_annotation/freezed_annotation.dart';

part 'dcviolation_kind.g.dart';
part 'dcviolation_kind.freezed.dart';

@freezed
abstract class DCViolationKind with _$DCViolationKind {
  const factory DCViolationKind({
    int id,
    String name,
  }) = _DCViolationKind;

  factory DCViolationKind.fromJson(Map<String, dynamic> json) =>
      _$DCViolationKindFromJson(json);
}