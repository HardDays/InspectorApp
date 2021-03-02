import 'package:freezed_annotation/freezed_annotation.dart';

part 'location.freezed.dart';
part 'location.g.dart';

@freezed
abstract class Location with _$Location {
  const factory Location({
    @required double longitude,
    @required double latitude,
  }) = _Location;

  const factory Location.noLocationProvided() = NoLocationProvider;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

}
