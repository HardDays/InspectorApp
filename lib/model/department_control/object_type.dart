import 'package:json_annotation/json_annotation.dart';

part 'object_type.g.dart';

@JsonSerializable()
class ObjectType {
  final int id;
  final String name;
  final String code;

  ObjectType({
    this.id,
    this.name,
    this.code,
  });

  factory ObjectType.fromJson(Map<String, dynamic> json) =>
      _$ObjectTypeFromJson(json);
  Map<String, dynamic> toJson() => _$ObjectTypeToJson(this);
}