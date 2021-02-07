import 'package:inspector/model/department_control/map_geometric_object_type.dart';
import 'package:inspector/model/department_control/point.dart';
import 'package:json_annotation/json_annotation.dart';

part 'map_geometric_object.g.dart';

@JsonSerializable()
class MapGeometricObject {
  final MapGeometricObjectType type;
  final String color;
  final String label;
  final List<Point> points;

  MapGeometricObject({
    this.type,
    this.color,
    this.label,
    this.points,
  });

  factory MapGeometricObject.fromJson(Map<String, dynamic> json) =>
      _$MapGeometricObjectFromJson(json);
  Map<String, dynamic> toJson() => _$MapGeometricObjectToJson(this);
}