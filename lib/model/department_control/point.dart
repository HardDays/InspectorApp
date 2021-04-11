import 'package:freezed_annotation/freezed_annotation.dart';

part 'point.g.dart';
part 'point.freezed.dart';

@freezed
abstract class Point with _$Point {
  const factory Point({
    double x,
    double y,
  }) = _Point;

  factory Point.fromJson(Map<String, dynamic> json) => _$PointFromJson(json);
}