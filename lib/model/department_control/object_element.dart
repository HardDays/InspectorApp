import 'package:inspector/model/department_control/object_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'object_element.g.dart';
part 'object_element.freezed.dart';

@freezed
abstract class ObjectElement implements _$ObjectElement {
  const ObjectElement._();

  const factory ObjectElement({
    int id,
    String name,
    ObjectType objectType,
  }) = _ObjectElement;

  factory ObjectElement.fromJson(Map<String, dynamic> json) =>
      _$ObjectElementFromJson(json);

  Map<String, dynamic> toSqliteJson() => {
        'id': id,
        'name': name,
        'typeId': objectType?.id,
        'typeName': objectType?.name,
        'typeCode': objectType?.code,
      };

  factory ObjectElement.fromSqliteJson(Map<String, dynamic> json) =>
      ObjectElement(
        id: json['id'],
        name: json['name'],
        objectType: ObjectType(
          id: json['typeId'],
          name: json['typeName'],
          code: json['typeCode'],
        ),
      );
}
