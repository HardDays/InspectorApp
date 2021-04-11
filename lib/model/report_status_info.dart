import 'package:inspector/model/report_status.dart';
import 'package:inspector/model/resolution_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'report_status_info.g.dart';

@JsonSerializable()
class ReportStatusInfo {
  final String reportNum;
  final ReportStatus reportStatus;
  final String rejectReason;
  final EmployeeShort respEmployee;
  final List<ViolatorResolution> violators;

  ReportStatusInfo({
    this.reportNum,
    this.reportStatus,
    this.rejectReason,
    this.respEmployee,
    this.violators,
  });

  factory ReportStatusInfo.fromJson(Map<String, dynamic> json) => _$ReportStatusInfoFromJson(json);
  Map<String, dynamic> toJson() => _$ReportStatusInfoToJson(this);
}

@JsonSerializable()
class EmployeeShort {
  final int id;
  final String name;

  EmployeeShort({
    this.id,
    this.name,
  });

  factory EmployeeShort.fromJson(Map<String, dynamic> json) => _$EmployeeShortFromJson(json);
  Map<String, dynamic> toJson() => _$EmployeeShortToJson(this);
}

@JsonSerializable()
class ViolatorResolution {
  final int violatorId;
  final ResolutionType resolutionType;
  final String resolutionDate;
  final String resolutionText;
  final EmployeeShort executor;
  final EmployeeShort author;

  ViolatorResolution({
    this.violatorId,
    this.resolutionType,
    this.resolutionDate,
    this.resolutionText,
    this.executor,
    this.author,
  });

  factory ViolatorResolution.fromJson(Map<String, dynamic> json) => _$ViolatorResolutionFromJson(json);
  Map<String, dynamic> toJson() => _$ViolatorResolutionToJson(this);
}
