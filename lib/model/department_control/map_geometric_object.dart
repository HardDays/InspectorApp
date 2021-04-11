import 'package:inspector/model/department_control/map_geometric_object_type.dart';
import 'package:inspector/model/department_control/point.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'map_geometric_object.g.dart';
part 'map_geometric_object.freezed.dart';

@freezed
abstract class MapGeometricObject with _$MapGeometricObject {
  const factory MapGeometricObject({
    MapGeometricObjectType type,
    String color,
    String label,
    List<Point> points,
  }) = _MapGeometricObject;

  factory MapGeometricObject.fromJson(Map<String, dynamic> json) =>
      _$MapGeometricObjectFromJson(json);
}