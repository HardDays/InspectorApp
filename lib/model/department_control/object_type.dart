import 'package:freezed_annotation/freezed_annotation.dart';

part 'object_type.g.dart';
part 'object_type.freezed.dart';

@freezed
abstract class ObjectType with _$ObjectType {

  const ObjectType._();

  const factory ObjectType({
    int id,
    String name,
    String code,
  }) = _ObjectType;

  factory ObjectType.fromJson(Map<String, dynamic> json) =>
      _$ObjectTypeFromJson(json);

  Map<String, dynamic> toSqliteJson() => toJson();

}