import 'package:inspector/model/department_control/dcphoto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'perform_mark.g.dart';

@JsonSerializable()
class PerformMark {
  PerformMark({
    this.id,
    this.resolveDate,
    this.organization,
    this.creator,
    this.comments,
    this.photos,
  });

  final int id;
  final DateTime resolveDate;
  final String organization;
  final String creator;
  final String comments;
  final List<DCPhoto> photos;

  factory PerformMark.fromJson(Map<String, dynamic> json) =>
      _$PerformMarkFromJson(json);
  Map<String, dynamic> toJson() => _$PerformMarkToJson(this);
}
