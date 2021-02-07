import 'package:json_annotation/json_annotation.dart';

part 'point.g.dart';

@JsonSerializable()
class Point {
  final int x;
  final int y;

  Point({
    this.x,
    this.y,
  });

  factory Point.fromJson(Map<String, dynamic> json) => _$PointFromJson(json);
  Map<String, dynamic> toJson() => _$PointToJson(this);
}