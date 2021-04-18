import 'package:freezed_annotation/freezed_annotation.dart';

part 'violation_name.g.dart';
part 'violation_name.freezed.dart';

@freezed
abstract class ViolationName implements  _$ViolationName {

  const ViolationName._();

  const factory ViolationName({
    int id,
    String name,
    String violationFullName,
    int externalId,
  }) = _ViolationName;

  factory ViolationName.fromJson(Map<String, dynamic> json) =>
      _$ViolationNameFromJson(json); 

  Map<String, dynamic> toSqliteJson() => toJson();

}