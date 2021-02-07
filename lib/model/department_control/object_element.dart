import 'package:inspector/model/department_control/object_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'object_element.g.dart';

@JsonSerializable()
class ObjectElement {
  final int id;
  final String name;
  final ObjectType objectType;

  ObjectElement({
    this.id,
    this.name,
    this.objectType,
  });

  factory ObjectElement.fromJson(Map<String, dynamic> json) =>
      _$ObjectElementFromJson(json);
  Map<String, dynamic> toJson() => _$ObjectElementToJson(this);
}