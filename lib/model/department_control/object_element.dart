import 'package:inspector/model/department_control/object_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'object_element.g.dart';
part 'object_element.freezed.dart';

@freezed
abstract class ObjectElement with _$ObjectElement {
  const factory ObjectElement({
    int id,
    String name,
    ObjectType objectType,
  }) = _ObjectElement;

  factory ObjectElement.fromJson(Map<String, dynamic> json) =>
      _$ObjectElementFromJson(json);
}
