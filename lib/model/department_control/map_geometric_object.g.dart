// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_geometric_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MapGeometricObject _$_$_MapGeometricObjectFromJson(
    Map<String, dynamic> json) {
  return _$_MapGeometricObject(
    type: _$enumDecodeNullable(_$MapGeometricObjectTypeEnumMap, json['type']),
    color: json['color'] as String,
    label: json['label'] as String,
    points: (json['points'] as List)
        ?.map(
            (e) => e == null ? null : Point.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$_$_MapGeometricObjectToJson(
        _$_MapGeometricObject instance) =>
    <String, dynamic>{
      'type': _$MapGeometricObjectTypeEnumMap[instance.type],
      'color': instance.color,
      'label': instance.label,
      'points': instance.points,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$MapGeometricObjectTypeEnumMap = {
  MapGeometricObjectType.point: 'point',
  MapGeometricObjectType.polyline: 'polyline',
  MapGeometricObjectType.polygon: 'polygon',
};
