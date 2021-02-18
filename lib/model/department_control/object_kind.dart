import 'package:freezed_annotation/freezed_annotation.dart';

part 'object_kind.g.dart';
part 'object_kind.freezed.dart';

@freezed
abstract class ObjectKind with _$ObjectKind {

  const ObjectKind._();

  const factory ObjectKind({
    int id,
    String name,
  }) = _ObjectKind;

  factory ObjectKind.fromJson(Map<String, dynamic> json) =>
      _$ObjectKindFromJson(json);

  Map<String, dynamic> toSqliteJson() => toJson();

}