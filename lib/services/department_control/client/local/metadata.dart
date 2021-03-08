import 'package:freezed_annotation/freezed_annotation.dart';

part 'metadata.freezed.dart';
part 'metadata.g.dart';

@freezed
abstract class DepartmentControlLocalServiceMetadata
    with _$DepartmentControlLocalServiceMetadata {
  const factory DepartmentControlLocalServiceMetadata(
    bool loaded, {
    DateTime lastUpdatedDate,
    int count,
  }) = _DepartmentControlLocalServiceMetadata;

  factory DepartmentControlLocalServiceMetadata.fromJson(
          Map<String, dynamic> json) =>
      _$DepartmentControlLocalServiceMetadataFromJson(json);
}