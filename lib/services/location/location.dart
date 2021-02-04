import 'package:freezed_annotation/freezed_annotation.dart';

part 'location.freezed.dart';

@freezed
abstract class Location with _$Location {
  const factory Location(
    double longitude,
    double latitude,
  ) = _Location;
}
